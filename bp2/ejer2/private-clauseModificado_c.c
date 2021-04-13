#include <stdio.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

main()
{
    int i, n = 7;
    int a[n], suma=16;
    for (i=0; i<n; i++)
        a[i] = i;

    #pragma omp parallel
    {
        #pragma omp for
        for (i=0; i<n; i++)
        {
            suma = suma + a[i];
            printf("thread %d a[%d] suma=%d / ", omp_get_thread_num(), i, suma);
        }
        printf("\n* thread %d suma= %d", omp_get_thread_num(), suma);
    }
    printf("\n");
    printf("Suma fuera de parallel: %d\n", suma);
}