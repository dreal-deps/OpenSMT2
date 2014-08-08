/*********************************************************************
Author: Antti Hyvarinen <antti.hyvarinen@gmail.com>

OpenSMT2 -- Copyright (C) 2012 - 2014 Antti Hyvarinen
                         2008 - 2012 Roberto Bruttomesso

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

#ifndef THANDLER_H
#define THANDLER_H

#include "TermMapper.h"
#include "SMTConfig.h"
#include "Egraph.h"
//#include "TSolver.h"

//class SMTSolver; // Forward declaration

class THandler
{
public:

  THandler ( Egraph &      e
           , SMTConfig &   c
           , TermMapper&   tm
           , Logic&        l
//           , vec< int > &  l
//           , vec< char > & a
//           , const Var     vt
//           , const Var     vf
           )
    : egraph             ( e )
    , euf_stats          ( e.tsolver_stats )
    , config             ( c )
    , tmap               ( tm )
    , logic              ( l )
//    , level              ( l )
//    , assigns            ( a )
//    , var_True           ( vt )
//    , var_False          ( vf )
    , checked_trail_size ( 0 )
    , tatoms             ( 0 )
    , batoms             ( 0 )
    , tatoms_given       ( 0 )
  {
    // Reserve room for true and false
//    var_to_enode   .resize( 65536, NULL );
//    enode_id_to_var.resize( 65536, var_Undef );
  }

  virtual ~THandler ( ) { }

  Logic&  getLogic  ( ) { return logic; }

#ifdef PEDANTIC_DEBUG
  void    getConflict          ( vec<Lit>&, vec<int>&, int &, vec<char>&, vec<Lit>& ); // Returns theory conflict in terms of literals
#else
  void    getConflict          ( vec<Lit>&, vec<int>&, int &, vec<char>& ); // Returns theory conflict in terms of literals
#endif
#ifdef PRODUCE_PROOF
  Enode * getInterpolants      ( );                     // Fill a vector with interpolants
#endif
  Lit     getDeduction         (Lit& r);                // Returns a literal that is implied by the current state and the reason literal
  Lit     getSuggestion        ( );                     // Returns a literal that is suggested by the current state
#ifdef PEDANTIC_DEBUG
  bool    getReason            ( Lit, vec< Lit > &, vec<char>& );   // Returns the explanation for a deduced literal
#else
  void    getReason            ( Lit, vec< Lit > &, vec<char>& );   // Returns the explanation for a deduced literal
#endif

  PTRef varToTerm           ( Var v ) { return tmap.varToTerm[v]; }  // Return the term ref corresponding to a variable
  Pterm& varToPterm         ( Var v)  { return logic.getPterm(tmap.varToTerm[v]); } // Return the term corresponding to a variable

  void getVarName           ( Var v, char** name ) { *name = logic.printTerm(tmap.varToTerm[v]); }

    Var ptrefToVar          ( PTRef r ) { return tmap.getVar(r); }

//  Var     enodeToVar           ( Enode * );             // Converts enode into boolean variable. Create a new variable if needed
//  Lit     enodeToLit           ( Enode * );             // Converts enode into boolean literal. Create a new variable if needed
//  Lit     enodeToLit           ( Enode *, Var & );      // Converts enode into boolean literal. Create a new variable if needed
//  Enode * varToEnode           ( Var );                 // Return the enode corresponding to a variable
//  void    clearVar             ( Var );                 // Clear a Var in translation table (used in incremental solving)

  bool    assertLits           (vec<Lit>&);             // Give to the TSolvers the newly added literals on the trail
  bool    check                (bool, vec<Lit>&);       // Check trail in the theories
//  void    backtrack            (vec<Lit>&);             // Remove literals that are not anymore on the trail
  void    backtrack            (int);                   // Remove literals that are not anymore on the trail

  double  getAtomsRatio        ( ) { return (double)batoms/((double)tatoms + 1.0); }

  void    inform               ( );

  lbool   evaluate             ( PTRef e ) { return egraph.evaluate( e ); }

private:

  // Returns a random float 0 <= x < 1. Seed must never be 0.
  static inline double drand(double& seed)
  {
    seed *= 1389796;
    int q = (int)(seed / 2147483647);
    seed -= (double)q * 2147483647;
    return seed / 2147483647; 
  }

  // Returns a random integer 0 <= x < size. Seed must never be 0.
  static inline int irand(double& seed, int size) 
  {
    return (int)(drand(seed) * size); 
  }

//  void verifyCallWithExternalTool        ( bool, size_t );
//  void verifyExplanationWithExternalTool ( vector< Enode * > & );
//  void verifyDeductionWithExternalTool   ( Enode * = NULL );
//  bool callCertifyingSolver              ( const char * );
#ifdef PRODUCE_PROOF
  void verifyInterpolantWithExternalTool ( vector< Enode * > &, Enode *, const logic_t & );
#endif

#ifdef PEDANTIC_DEBUG
  bool  isOnTrail     ( Lit, vec<Lit>& );
#endif

//  vector< Var >       enode_id_to_var;          // Conversion EnodeID --> Var
//  vector< Enode * >   var_to_enode;             // Conversion Var --> EnodeID
#ifdef PEDANTIC_DEBUG
public:
#endif
  Egraph &            egraph;                   // Pointer to Egraph that works as core solver
  TSolverStats&       euf_stats;                // Egraph statistics
  SMTConfig &         config;                   // Reference to configuration
//  SMTSolver &         solver;                   // Reference to SMT Solver
  TermMapper&         tmap;                     // Mappings between TRefs and Lits
//  vec< int > &        level;                    // Reference to SMT Solver level
//  vec< char > &       assigns;                  // Reference to SMT Solver assigns
//  const Var           var_True;                 // To specify constantly true atoms
//  const Var           var_False;                // To specify constantly false atoms
  Logic &             logic;                    // For true, false literals etc
  vec< PTRef >        stack;                    // Stacked atoms
  size_t              checked_trail_size;       // Store last size of the trail checked by the solvers

  int                 tatoms;                   // Tracks theory atoms
  int                 batoms;                   // Tracks boolean atoms

  vec< bool >         tatoms_seen;              // Atoms seen
  unsigned            tatoms_given;             // Next atom to give
  vec< ERef >         tatoms_list;              // List of tatoms to communicate later
  vec< bool >         tatoms_give;              // We might want not to give some atoms

  inline lbool value (Lit p, vec<char>& assigns) const { return toLbool(assigns[var(p)]) ^ sign(p); }


// Debug
public:
  const char* printAsrtClause(vec<Lit>& r);
  const char* printAsrtClause(Clause *c);
  bool checkTrailConsistency(vec<Lit>& trail);
private:
#ifdef PEDANTIC_DEBUG
  std::string printExplanation(vec<PtAsgn>&, vec<char>&);
  std::string printAssertion(Lit);
#endif
};

#endif
