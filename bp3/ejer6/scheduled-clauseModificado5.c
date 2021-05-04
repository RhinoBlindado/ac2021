#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
    int i, n=200, chunk, a[n], suma=0;
    
    if(argc < 3)
    {
        fprintf(stderr,"\nFalta iteraciones o chunk\n");
        exit(-1);
    }

    n = atoi(argv[1]);
    if (n>200)
        n=200;

    chunk = atoi(argv[2]); 

    for (i=0; i<n; i++)
        a[i] = i; 


    // Variables de estado
    int modifier;
    omp_sched_t kind;
    omp_get_schedule(&kind, &modifier);

    // Cambio de variables antes de región paralela
    printf("Fuera de región paralela:\n\tAntes de modificación: dyn-var=%d, nthreads-var=%d, run-sched-var=%X %d\n",  omp_get_dynamic(), omp_get_max_threads(), kind, modifier);
    
    omp_set_dynamic(1);
    omp_set_num_threads(5);
    omp_set_schedule(omp_sched_auto, chunk);

    omp_get_schedule(&kind, &modifier);
    printf("\tDespués de modificación: dyn-var=%d, nthreads-var=%d, run-sched-var=%X %d\n",  omp_get_dynamic(), omp_get_max_threads(), kind, modifier);



    #pragma omp parallel 
    {
        #pragma omp for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
        for (i=0; i<n; i++)
        {
            suma = suma + a[i];
            printf(" thread %d suma a[%d]=%d suma=%d \n",
                omp_get_thread_num(),i,a[i],suma);
        }

        #pragma omp single
        {
            printf("Dentro de región paralela:\n\tAntes de modificación: dyn-var=%d, nthreads-var=%d, run-sched-var=%X %d\n",  omp_get_dynamic(), omp_get_max_threads(), kind, modifier);

            omp_set_dynamic(0);
            omp_set_num_threads(3);
            omp_set_schedule(omp_sched_guided, chunk+2);

            omp_get_schedule(&kind, &modifier);
            
            printf("\tDespués de modificación: dyn-var=%d, nthreads-var=%d, run-sched-var=%X %d\n",  omp_get_dynamic(), omp_get_max_threads(), kind, modifier);

        }
    }

}