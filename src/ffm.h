#ifndef FFM_H
#define FFM_H

/** C API for ff::MultiArray<double> */

#ifdef __cplusplus
extern "C" {
#endif

/** handle to ff::MultiArray<double> */
typedef void* FFM;

/** create an ffm object
    
    @param diminfo: ptr to int vector with
    
              offset 0 : number of dimensions (dimsize),
              offset 1 : length of dimension 1, 
              offset 2 : length of dimension 2, 
              ... 
              offset n : length of dimension n
              
    @param pagesize: pagesize
    @param readonly: readonly flag
                
 */
FFM  ffm_new(const char* filepath, int* diminfo, int pagesize, int readonly);

/** get error code */
int  ffm_geterror(FFM handle);

/** delete ffm object */
void ffm_delete(FFM handle);

/** close ffm object */
void ffm_close(FFM handle);

/** get number of dimensions */
int  ffm_ndims(FFM handle);

/** get size of dimension n */
int  ffm_dimlength(FFM handle, int n);

/** get one double cell given by a pointer to indices (without a dimsize prefixed!) */
double ffm_get(FFM handle, int* index);

/** set one double cell given by a pointer to indices (without a dimsize prefixed!) */
void   ffm_set(FFM handle, int* index, double value);


#ifdef __cplusplus
}
#endif

#endif /* FFM_H */



