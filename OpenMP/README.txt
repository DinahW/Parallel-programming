Lab_Hello

CASE 1
When myID and num_threads are in the parallel region

The program demonstrates the use of OpenMP to run parallel threads in a C program. 
It creates 6 threads, and each of them prints a message indicating its unique ID and the total number of threads running.
The variables myID and num_threads are defined inside the parallel region to capture the thread's ID and the total number of threads.
Each ID will correspond to a thread 

CASE 1
When you remove myID and num_threads from the parallel region

It will print the same values for myID and num_threads for all threads because these variables were initialized outside the parallel region and do not reflect the actual thread-specific values inside the parallel region.
Prints the thread as num 1 and MyID as 0 consecutively.

Lab2_sum
My_sum is declared private to ensure each thread has its own copy.
Sum is declared shared to allow all threads to update the shared sum.
Each thread initializes my_sum to 0 within the parallel region.
OpenMP for Directive:
The #pragma omp for directive distributes iterations of the loop among the threads.

Without critical section
The sum is unpredicted since there is a race condition that leads to a concurrent update of the sum, therefore it prints the predicted sum and actual sum.

With critical region
The right sum is printed since the sum update is done atomically preventing race condition.
