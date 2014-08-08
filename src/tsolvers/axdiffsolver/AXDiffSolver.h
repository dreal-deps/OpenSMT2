/*********************************************************************
Author: Roberto Bruttomesso <roberto.bruttomesso@gmail.com>

OpenSMT2 -- Copyright (C) 2008-2012, Roberto Bruttomesso

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

#ifndef AXDIFFSOLVER_H
#define AXDIFFSOLVER_H

#include "TSolver.h"
#include "RewriteEngine.h"

class AXDiffSolver : public OrdinaryTSolver
{
public:

  AXDiffSolver( const int           
              , const char *        
	      , SMTConfig &         
	      , Egraph &            
	      , SStore &
	      , vector< Enode * > & 
	      , vector< Enode * > & 
              , vector< Enode * > & );

  ~AXDiffSolver ( );

  lbool   inform             ( Enode * );
  bool    assertLit          ( Enode *, bool = false );
  void    pushBacktrackPoint ( );
  void    popBacktrackPoint  ( );
  bool    check              ( bool );
  bool    belongsToT         ( Enode * );
  void    computeModel       ( );
#ifdef PRODUCE_PROOF
  Enode * getInterpolants    ( );
  void    gatherIndexes      ( Enode * );
#endif
  void    initialize         ( );

private:

  void backtrackToStackSize  ( size_t );
  bool isIndexEq             ( Enode * );
  bool isElemEq              ( Enode * );
  bool hasReadTerms          ( Enode * );

  //
  // Defines the set of operations that can be performed and that should be undone
  //
  typedef enum { 
    ASSERT_LIT
  } oper_t;

  RewriteEngine * re_p;
  RewriteEngine & re;

  vector< oper_t >  undo_stack_oper;
  vector< Enode * > undo_stack_term;

#ifdef PRODUCE_PROOF
  set< Enode * > indexes;
#endif

  unsigned      nof_index_eqs;
  unsigned      nof_asserted_index_eqs;
  unsigned      nof_read_terms;
  unsigned      nof_asserted_read_terms;
};

#endif
