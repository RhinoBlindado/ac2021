#include <stdio.h>
#include <stdlib.h>
#include <time.h>	

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
    if(argc < 4) 
    {
        printf("Uso: ./pmtv-sencuencial_EXE n\nn    Dimensión del vector y de la matriz.\nkind      Tipo de planificación\nchunk    Tamaño del chunk");
        exit(-1);
    }


    // Declaración de datos.
    double ncgt, cgt1, cgt2;

    int N = atoi(argv[1]);

    double *v1, *v3;
        v1 = (double*) malloc(N*sizeof(double));
        v3 = (double*) malloc(N*sizeof(double));

    double **matrix;
        matrix = (double**) malloc(N*sizeof(double*));

    if(v1 == NULL || matrix == NULL || v3 == NULL)
    {
        printf("Error en la reserva de espacio\n");
        exit(-2);
    }
    
    for(int i=0; i<N; i++) 
    {
        matrix[i] = (double*) malloc(N*sizeof(double));
        if(matrix[i] == NULL)
        {
            printf("Error en la reserva de espacio\n");
            exit(-2);
        }
    }

    // Inicialización de datos.
    omp_set_schedule((omp_sched_t)atoi(argv[2]), atoi(argv[3]));

    int aux, j;
    #pragma omp parallel private(aux, j) shared(v3)
    {
        #pragma omp master
        {
            for (int i = 0; i < N; i++)
            {
                v1[i] = 1;
                for (int j = 0; j < N; j++)
                {
                    if (j <= i)
                    {
                        matrix[i][j] = 1;
                    }
                    else
                    {
                        matrix[i][j] = 0;
                    }
                    
                }
                
            }
        }

        #pragma omp barrier

        // Cálculo de la multiplicación de v1 * matrix = v3

        cgt1 = omp_get_wtime();

        // Filas
        #pragma omp for
        for (int i = 0; i < N; i++)
        {
            aux = 0;
            // Columnas
            for (j = i; j < N; j++)
            {
                aux += matrix[j][i]*v1[j];
            }
            v3[i] = aux;
        }
        
        cgt2 = omp_get_wtime();
    }
        ncgt = cgt2 - cgt1;

        // Imprimir los datos
        printf("Dimension: %d Tiempo: %11.9f \n", N, ncgt);

        printf("Resultado: ");
        if(N<12)
        {
            for (int i = 0; i < N; i++)
            {
                printf("[%d] = %0.2f ", i, v3[i]);
            }
            
        }
        else
        {
            printf("[0] = %2.2f, ..., [%d] = %2.2f", v3[0], N-1, v3[N-1]);
        }
        printf("\n");

    

    // Liberar memoria
    free(v1);
    free(v3);

    for (int i = 0; i < N; i++) free(matrix[i]);
    free(matrix);
    
    return 0;
}
 
 
