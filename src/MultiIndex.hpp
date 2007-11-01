#ifndef FF_MULTI_INDEX_HPP
#define FF_MULTI_INDEX_HPP

#include "types.hpp"
#include <vector>

namespace ff {

/** MultiIndex utility class
 *  it translates multi-index integers into a foff_t big index */

class MultiIndex
{
public:
  /** constructor, 
   *  diminfo 
   *          points to a vector of integers given 
   *          the number of dimensions, and 
   *          lengths for each dimension 
   **/
  MultiIndex(const int* diminfo=0);
  /** clear dimensions */
  void    clear();
  /** reset to a different dimension */
  void    reset(const int* diminfo);
  /** translate between int multi-integers and one foff_t big index */
  foff_t  indexToOffset(const int* index) const;
  /** get number of dimensions */
  int     ndims() const;
  /** get length of dimension n */
  int     dimlength(int n) const;
  /** get total size of linear vector (product of all dimension length) */
  fsize_t size() const;
  /** initialize with dimension information read from file */
  bool    readFromFile(const char* filepath);
  /** write dimension information to file */
  bool    writeToFile(const char* filepath) const; 
private:
  std::vector<int> _diminfo;
  std::vector<fsize_t> _factors;
  fsize_t _size;
};

}

#endif // FF_MULTI_INDEX_HPP
