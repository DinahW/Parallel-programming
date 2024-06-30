#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
int main (int argc, char* argv[]){
    int thread_count= 6;
    int num_threads = omp_get_num_threads();
    int myID = omp_get_thread_num();

    #pragma omp parallel num_threads(thread_count)
    {
    printf(“Hello from thread %d of %d\n”, myID, num_threads);
    }

    return 0;

  }
