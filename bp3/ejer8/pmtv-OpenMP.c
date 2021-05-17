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
    if(argc < 2) 
    {
        printf("Uso: ./pmtv-OpenMP_EXE n\nn    Dimensión del vector y de la matriz.\n");
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
    int j;
    double aux;

    #pragma omp parallel private(aux, j) shared(v3)
    {
        #pragma omp master
        {
            struct drand48_data randBuffer;
            double randomNumber;
            srand48_r(time(NULL), &randBuffer);

            for (int i = 0; i < N; i++)
            {
                drand48_r(&randBuffer, &randomNumber);
                v1[i] = randomNumber * 10;
                for (int j = 0; j < N; j++)
                {
                    if (j <= i)
                    {
                        drand48_r(&randBuffer, &randomNumber);
                        matrix[i][j] = randomNumber * 10;
                    }
                    else
                    {
                        matrix[i][j] = 0;
                    }
                    
                }  
            }

        /*    printf("v1 = [");
            for (int i = 0; i < N; i++)
            {
                printf("%2.4f\t", v1[i]);
            }
            printf("]\n");
            printf("M = \n");
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N; j++)
                {
                    printf("%2.4f\t",matrix[i][j]);
                }
                printf("\n");
            }
        */       
        }
        #pragma omp barrier

        // Cálculo de la multiplicación de v1 * matrix = v3

        cgt1 = omp_get_wtime();

        // Filas
        #pragma omp for schedule(runtime)
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
                printf("[%d] = %2.4f ", i, v3[i]);
            }
            
        }
        else
        {
            printf("[0] = %2.4f, ..., [%d] = %2.4f", v3[0], N-1, v3[N-1]);
        }
        printf("\n");

    

    // Liberar memoria
    free(v1);
    free(v3);

    for (int i = 0; i < N; i++) free(matrix[i]);
    free(matrix);
    
    return 0;
}
 
 
