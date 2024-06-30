CASE 1
When myID and num_threads are in the parallel region

The program demonstrates the use of OpenMP to run parallel threads in a C program. 
It creates 6 threads, and each of them prints a message indicating its unique ID and the total number of threads running.
The variables myID and num_threads are defined inside the parallel region to capture the thread's ID and the total number of threads.

CASE 1
When you remove myID and num_threads from the parallel region

It will print the same values for myID and num_threads for all threads, because these variables were initialized outside the parallel region and do not reflect the actual thread-specific values inside the parallel region.

