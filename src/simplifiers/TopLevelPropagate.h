/*********************************************************************
Author: Antti Hyvarinen <antti.hyvarinen@gmail.com>

OpenSMT2 -- Copyright (C) 2012 - 2014 Antti Hyvarinen

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*********************************************************************/


#include "logics/Logic.h"
#include "minisat/mtl/Vec.h"
#include "cnfizers/Cnfizer.h"

#ifndef Simplifiers_TopLevelPropagate_h
#define Simplifiers_TopLevelPropagate_h

struct SERef {
    uint32_t x;
    void operator= (uint32_t v) { x = v; }
    inline friend bool operator<  (const SERef& a1, const SERef& a2) {return a1.x < a2.x;  }
    inline friend bool operator== (const SERef& a1, const SERef& a2) {return a1.x == a2.x; }
    inline friend bool operator!= (const SERef& a1, const SERef& a2) {return a1.x != a2.x; }
};
static struct SERef SERef_Undef = {INT32_MAX};

class SEAllocator;
typedef uint32_t CgId;

class SEnode
{
    class SCgData {
      public:
        SERef        root;           // Root of the equivalence class
        SERef        next;           // Next node in the class
        int          size;           // Size of the eq class
        SERef        parent;         // Parent of the node (in congruence)
        SERef        same_car;       // Circular list of all the car-parents of the class
        SERef        same_cdr;       // Circular list of all the cdr-parents of the class
        int          parent_size;    // Size of the parent's congruence class
        SERef        cg_ptr;         // Congruence class representative (how is this different from root?)
    };
    static uint32_t cgid_ctr;
    struct {
        unsigned type       : 2;
        unsigned reloced    : 1;
        unsigned unused     : 29; } header;
    union { SymRef symb; PTRef pterm; };     // The symbol or the pterm
    SERef       er;     // Either my eref or reference to the relocated one
    SERef       car;
    SERef       cdr;
    cgId        cid;            // The congruence id of the enode (defined also for symbols)

  public:
    // This is a trick to enable congruence data on only Enodes it is needed
    static SERef SERef_Nil;
    SCgData      cgdata[0];
    enum en_type { et_symb, et_list, et_term };
    // Constructor for symbols
    SEnode(SymRef, SERef);
    // Constructor for term and list nodes
    SEnode(SERef car_, SERef cdr_, en_type t, SEAllocator& ea, SERef er);
    en_type type         ()        const { return (en_type)header.type; }

    void   relocate      (SERef e)       { header.reloced = 1; er = e; }
    bool   reloced       ()        const { return header.reloced; }
    SERef  relocation    ()        const { return er; }

    bool   isList        ()        const { return (en_type)header.type == et_list; }
    bool   isTerm        ()        const { return (en_type)header.type == et_term; }
    bool   isSymb        ()        const { return (en_type)header.type == et_symb; }
    SERef  getCar        ()        const { assert(type() != et_symb); return car; }
    SERef  getCdr        ()        const { assert(type() != et_symb); return cdr; }
    SymRef getSymb       ()        const { assert(type() == et_symb); return symb; }
    PTRef  getTerm       ()        const { assert(type() != et_symb && type() != et_list); return pterm; }
    SERef  getRoot       ()        const { if (type() == et_symb) return er; else return cgdata->root; }
    void   setRoot       (SERef r)        { assert(type() != et_symb); cgdata->root = r; }
    SERef  getCgPtr      ()        const { return cgdata->cg_ptr; }
    void   setCgPtr      (SERef e)        { cgdata->cg_ptr = e; }
    CgId   getCid        ()        const { return cid; }
    void   setCid        (CgId id)       { cid = id; }
    SERef  getParent     ()        const { return cgdata->parent; }
    void   setParent     (SERef e)        { cgdata->parent = e; }
    int    getParentSize ()        const { return cgdata->parent_size; }
    void   setParentSize (int i)         { cgdata->parent_size = i; }
    SERef  getSameCdr    ()        const { return cgdata->same_cdr; }
    void   setSameCdr    (SERef e)        { cgdata->same_cdr = e; }
    SERef  getSameCar    ()        const { return cgdata->same_car; }
    void   setSameCar    (SERef e)        { cgdata->same_car = e; }
    SERef  getNext       ()        const { return cgdata->next; }
    void   setNext       (SERef n)        { cgdata->next = n; }
    int    getSize       ()        const { return cgdata->size; }
    void   setSize       (int i)         { cgdata->size = i; }

    bool operator< (const SEnode& e) const {
        assert((type() != et_symb) && (e.type() != et_symb));
        assert(type() == e.type());
        bool xsmall = (getSize() < e.getSize());
        if (type() == et_list) return xsmall;
        // is type et_term
        bool xv = (getCdr() == SERef_Nil);   // I am a term without args
        bool yv = (e.getCdr() == SERef_Nil); // e is a term without args
        return (xsmall && (!xv || yv)) || (!xsmall && !xv && yv); }

    friend class SEAllocator;
};

struct SERefHash {
    uint32_t operator () (const SERef& s) const {
        return (uint32_t)s.x; }
};

class SEAllocator : public RegionAllocator<uint32_t>
{
    static int senodeWord32Size(bool has_cgdata){
        if (has_cgdata) return (sizeof(SEnode) + sizeof(SEnode::SCgData))/sizeof(int32_t);
        else            return sizeof(SEnode)/sizeof(int32_t); }

    Map<SigPair,SERef,SigHash,Equal<const SigPair&> >& sigtab;

 public:

    SEAllocator(uint32_t start_cap, Map<SigPair,SERef,SigHash,Equal<const SigPair&> >& st) : RegionAllocator<uint32_t>(start_cap), sigtab(st) {}
//    SEAllocator() {}

    void moveTo(SEAllocator& to){
        RegionAllocator<uint32_t>::moveTo(to); }

    // For symbols
    SERef alloc(SymRef sym) {
        assert(sizeof(SymRef)     == sizeof(uint32_t));
        assert(sizeof(SERef)     == sizeof(uint32_t));
        uint32_t v = RegionAllocator<uint32_t>::alloc(senodeWord32Size(false));
        SERef eid;
        eid.x = v;
        SEnode* tmp = new (lea(eid)) SEnode(sym, eid);
        tmp->header.type = Enode::et_symb;
        return eid;
    }

    // For terms and lists
    SERef alloc(SERef car, SERef cdr, SEnode::en_type t, PTRef ptr)
    {
        assert(sizeof(SymRef)     == sizeof(uint32_t));
        assert(sizeof(SERef)     == sizeof(uint32_t));
        assert(t != SEnode::et_symb);
        bool has_cgdata = (t == SEnode::et_list) || (t == SEnode::et_term);
        uint32_t v = RegionAllocator<uint32_t>::alloc(senodeWord32Size(has_cgdata));
        SERef eid;
        eid.x = v;
        SEnode* tmp = new (lea(eid)) SEnode(car, cdr, t, *this, eid);
        tmp->header.type = t;
        tmp->pterm = ptr;
        cgId car_id = operator[](car).getCid();
        cgId cdr_id = operator[](cdr).getCid();
        sigtab.insert(SigPair(car_id, cdr_id), eid);
        return eid;
    }

    SERef alloc(SEnode&) {
        assert(false);
        return SERef_Undef;
    }

    // Deref, Load Effective Address (LEA), Inverse of LEA (AEL):
    SEnode&       operator[](SERef r)         { return (SEnode&)RegionAllocator<uint32_t>::operator[](r.x); }
    const SEnode& operator[](SERef r) const   { return (SEnode&)RegionAllocator<uint32_t>::operator[](r.x); }
    SEnode*       lea       (SERef r)         { return (SEnode*)RegionAllocator<uint32_t>::lea(r.x); }
    const SEnode* lea       (SERef r) const   { return (SEnode*)RegionAllocator<uint32_t>::lea(r.x); }
    const SEnode& dbg       (int  r) const   { return (SEnode&)RegionAllocator<uint32_t>::operator[](r); }
    SERef         ael       (const SEnode* t) { RegionAllocator<uint32_t>::Ref r = RegionAllocator<uint32_t>::ael((uint32_t*)t); SERef rf; rf.x = r; return rf; }

    void free(SERef eid)
    {
        SEnode& e = operator[](eid);
        if ((e.type() == SEnode::et_list) || (e.type() == SEnode::et_term))
            RegionAllocator<uint32_t>::free(senodeWord32Size(true));
        else
            RegionAllocator<uint32_t>::free(senodeWord32Size(false));

    }

    void reloc(SERef& er, SEAllocator& to)
    {
        SEnode& e = operator[](er);

        if (e.reloced()) { er = e.relocation(); return; }

        er = to.alloc(e);
        e.relocate(er);
    }

#ifdef PEDANTIC_DEBUG
    const char* printEnode(SERef er)
    {
        SEnode& e = operator[](er);
        stringstream ss;
        ss << "============================================" << endl;
        ss << "| my ref: " << er.x << endl;
        ss << "| type: " << (e.type() == SEnode::et_symb ? "symb" : (e.type() == SEnode::et_list ? "list" : "term")) << endl;
        if (e.type() == SEnode::et_term) {
            ss << "| Pterm " << e.getTerm().x << endl;
        }
        ss << "| car " << e.getCar().x << endl;
        ss << "| cdr " << e.getCdr().x << endl;
        ss << "+------------------------------------------" << endl;
        if (e.type() != SEnode::et_symb) {
            ss << "| root " << e.getRoot().x << endl;
            ss << "| CgPtr " << e.getCgPtr().x << endl;
            ss << "| parent " << e.getParent().x << endl;
            ss << "| parent size " << e.getParentSize() << endl;
            ss << "| sameCdr " << e.getSameCdr().x << endl;
            ss << "| sameCar " << e.getSameCar().x << endl;
            ss << "| next " << e.getNext().x << endl;
            ss << "| size " << e.getSize() << endl;
        }
        ss << "| Cid " << e.getCid() << endl;
        ss << "============================================" << endl;
        return ss.str().c_str();
    }

    void checkEnodeAsrts(SERef er) {
        SEnode& e = operator[](er);
        SERef same_cdr = e.getSameCdr();
        while (same_cdr != er) {
            assert(operator[](operator[](same_cdr).getCdr()).getRoot() ==
                                      operator[](e.getCdr()).getRoot());
            same_cdr = operator[](same_cdr).getSameCdr();
        }
    }
#endif

};

//
// TopLevelPropagator implements three types of simplifications:
//  - A simpler congruence closure algorithm without backtracking and forbid lists
//    for top-level propagation, and
//  - A heuristic for minimizing the number of terms in the uninterpreted functions, and
//  - The transitivity simplification (which seems a bit useless, given that it only applies
//    in one benchmark category famous for this simplification)
//
class TopLevelPropagator {
    class Node {
      public:
        PTRef  tr;
        int    rank;
        Node*  parent;
        Node(PTRef d) : tr(d), rank(0), parent(this) {} // makeSet
    };
    class SERefPair {
      public:
        SERef x;
        SERef y;
        SERefPair(SERef x_, SERef y_) : x(x_), y(y_) {}
    };
    // For depth first search
    class pi {
      public:
        PTRef x;
        bool done;
        pi(PTRef x_) : x(x_), done(false) {}
    };

    Logic&      logic;
    Cnfizer&    cnfizer;

    Map<PTRef,SERef,PTRefHash,Equal<const PTRef> >    termToSERef;
    Map<SymRef,SERef,SymRefHash,Equal<SymRef> >       symToSERef;
    Map<SigPair,SERef,SigHash,Equal<const SigPair&> > sigtab;

    SEAllocator ea;

    int total_substs;

    vec<SERefPair> pending;


    SERef       n_false;
    SERef       n_true;

    Map<PTRef, Node*, PTRefHash, Equal<PTRef> > PTRefToNode;
    // Get root congruence node and return its term
    PTRef find(PTRef p) const { return ea[ea[termToSERef[p]].getRoot()].getTerm(); }
    void merge(SERef xr, SERef yr);   // union
    bool contains(PTRef x, PTRef y);  // term x contains an occurrence of y
    bool assertEq(PTRef eq);          // Add equivalence and propagate

  public:
    TopLevelPropagator(Logic& logic, Cnfizer& cnfizer);
    // Collect the top level facts following the boolean structure
    void collectFacts(PTRef root, vec<PtAsgn>& facts);
    // OpenSMT 1 substitution scheme - replace variables with terms not containing the variable
#ifdef SIMPLIFY_DEBUG
    void retrieveSubstitutions(PTRef root, Map<PTRef,PTRef,PTRefHash>& substs, Map<PTRef,int,PTRefHash>& subst_targets, vec<PTRef>& subst_vars);
#else
    void retrieveSubstitutions(PTRef root, Map<PTRef,PTRef,PTRefHash>& substs, Map<PTRef,int,PTRefHash>& subst_targets);
#endif
    // Initialize the congruence with terms starting from root
    void initCongruence(PTRef root);
    // Compute the substitutions based on the congruence
    bool computeCongruenceSubstitutions(PTRef root, vec<PtAsgn>& tlfacts);
    bool substitute(PTRef& root, PTRef& n);    // Substitute based on the
//                                     // previously inserted bindings.
//                                     // Return true if substitutions were performed
//                                     // n will be the new root
    PTRef extractSimplified();

#ifndef OLD_VARSUBSTITUTE
    bool varsubstitute(PTRef& root, Map<PTRef,PTRef,PTRefHash>& substs, Map<PTRef,int,PTRefHash>& subst_targets, PTRef& tr_new);
#else
    bool varsubstitute(PTRef& root, Map<PTRef,PTRef,PTRefHash>& substs);
#endif
    PTRef learnEqTransitivity(PTRef); // Learn limited transitivity information
                                      // (should speed up significantly the solving of some problems)
};

#endif
