/*********************************************************************
 Author: Aliaksei Tsitovich <aliaksei.tsitovich@usi.ch>,
         Roberto Bruttomesso <roberto.bruttomesso@unisi.ch>

 OpenSMT2 -- Copyright (C) 2008 - 2012, Roberto Bruttomesso

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

#ifndef LACOLUMN_H_
#define LACOLUMN_H_

#include "LAArray.h"

struct LAColumnItem
{
  int key;
  int pos_in_row;

  LAColumnItem( int _key, int _pos_in_row )
  {
    key = _key;
    pos_in_row = _pos_in_row;
  }
};

class LAColumn: public LAArray<LAColumnItem>
{
public:
  int add( const int key, const int pos );
};

#endif /* LACOLUMN_H_ */
