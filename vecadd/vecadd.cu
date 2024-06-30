

/*Fix the codes that say FIXME*/

#include <stdlib.h>
#include <stdio.h>



// this kernel computes the vector sum c = a + b
// each thread performs one pair-wise addition
__global__ void vector_add(const float *a,
                           const float *b,
                           float *c,
                           const size_t n)

{
  // compute the global element index this thread should process
  /* insert code to calculate the index properly using blockIdx.x, blockDim.x, threadIdx.x */
  unsigned int index =blockDim.x * blockIdx.x + threadIdx.x; /*FIXME/Fixed #4*/

  // avoid accessing out of bounds elements
  if(index < n)
  {
    // sum elements
    c[index] = a[index] + b[index];
  }
}


int main(void)
{
  // create arrays of 1M elements
  const int num_elements = 1<<20;

  // compute the size of the arrays in bytes
  const int num_bytes = num_elements * sizeof(float);

  // points to host & device arrays
  float *device_array_a = NULL;
  float *device_array_b = NULL;
  float *device_array_c = NULL;
  float *host_array_a   = NULL;
  float *host_array_b   = NULL;
  float *host_array_c   = NULL;

  // malloc the host arrays
  host_array_a = (float*)malloc(size);
  host_array_b = (float*)malloc(size);
  host_array_c = (float*)malloc(size);


  // cudaMalloc the device arrays
  cudaMalloc((void **)&device_array_a, size); /*FIXME #1/FIXED */
  cudaMalloc((void **)&device_array_b, size); /*FIXME #1/FIXED */
  cudaMalloc((void **)&device_array_c, size); /*FIXME #1/FIXED*/


  // if any memory allocation failed, report an error message
  if(host_array_a == 0 || host_array_b == 0 || host_array_c == 0 ||
     device_array_a == 0 || device_array_b == 0 || device_array_c == 0)
  {
    printf("couldn't allocate memory\n");
    return 1;
  }

  // initialize host_array_a & host_array_b
  for(int i = 0; i < num_elements; ++i)
  {
    // make array a a linear ramp
    host_array_a[i] = (float)i;

    // make array b random
    host_array_b[i] = (float)rand() / RAND_MAX;
  }

  // copy arrays a & b to the device memory space
  /* fix the parameters needed to copy data to the device */
  cudaMemcpy(device_array_a,host_array_a, size, cudaMemcpyHostToDevice); /*FIXME #2/Fixed */
  cudaMemcpy(device_array_b,host_array_b, size, cudaMemcpyHostToDevice);  /*FIXME #2/Fixed */

  // deal with a possible partial final block
  if(num_elements % nThreads) ++nBlocks;

  // launch the kernel
  vector_add<<<1,n >>>(device_array_a, device_array_b, device_array_c,num_elements);//FIXED

  // copy the result back to the host memory space
  cudaMemcpy(host_array_c, device_array_c, size, cudaMemcpyDeviceToHost);//FIXED

  // print out the first 10 results
  for(int i = 0; i < 10; ++i)
  {
    printf("result %d: %1.1f + %7.1f = %7.1f\n", i, host_array_a[i], host_array_b[i], host_array_c[i]);
  }

  // deallocate memory
  free(host_array_a);
  free(host_array_b);
  free(host_array_c);

  cudaFree(device_array_a/*FIXME6*/);//FIXED
  cudaFree(device_array_b/*FIXME6*/);//FIXED
  cudaFree(device_array_c/*FIXME6*/);//FIXED

  return 0;
}
