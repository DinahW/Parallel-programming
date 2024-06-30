#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main (int argc, char* argv[])
{

  //TODO 3
       int thread_count=6;
  //TODO 5

#pragma omp parallel num_threads(thread_count)

    {

      //TODO 1
      int  myID = omp_get_thread_num();

      //TODO 2
      int num_threads = omp_get_num_threads();

      printf("Hello from thread %d of %d\n", myID, num_thre$
    }

  return 0;
}




