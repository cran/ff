#ifndef FF_H
#define FF_H

/** C API for ff::Array<double> */

#ifdef __cplusplus
extern "C" {
#endif

/** handle to ff::Array<double> */
typedef void* FF;

/** create an ff object */
FF     ff_new(const char* filepath, int size, int pagesize,int readonly);

/** get error code */
int    ff_geterror(FF handle);

/** return length of ff object in units of double */ 
int    ff_len(FF handle);

/** destruction */
void   ff_delete(FF handle);

/** get one cell */
double ff_get(FF handle, int index);

/** set one cell */
void   ff_set(FF handle, int index, double x);

/** close */
void   ff_close(FF handle);

/** read cells */
void   ff_read(FF handle, double* ptr, int index, int size);

/** write cells */
void   ff_write(FF handle, double* ptr, int index, int size);

/** get system page size */
int    ff_getpagesize();

/** read sequences (seqlist points to a seq of from,to,by integers) */
void   ff_readseq(FF handle, double* ptr, int* seqlist, int size);

/** write sequences (seqlist points to a seq of from,to,by integers) */
void   ff_writeseq(FF handle, double* ptr, int* seqlist, int size);

#ifdef __cplusplus
}
#endif

#endif /* FF_H */

