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
        printf("Uso: ./*_EXE n\nn    Dimensión del vector y de la matriz.\n");
        exit(-1);
    }


    // Declaración de datos.
    double ncgt, cgt1, cgt2;

    int N = atoi(argv[1]);

    int *v1, *v3;
        v1 = (int*) malloc(N*sizeof(int));
        v3 = (int*) malloc(N*sizeof(int));

    int **matrix;
        matrix = (int**) malloc(N*sizeof(int*));

    if(v1 == NULL || matrix == NULL || v3 == NULL)
    {
        printf("Error en la reserva de espacio\n");
        exit(-2);
    }
    
    for(int i=0; i<N; i++) 
    {
        matrix[i] = (int*) malloc(N*sizeof(int));
        if(matrix[i] == NULL)
        {
            printf("Error en la reserva de espacio\n");
            exit(-2);
        }
    }

    // Inicialización de datos.

    for (int i = 0; i < N; i++)
    {
        v1[i] = 1;
        #pragma omp parallel for
        for (int j = 0; j < N; j++)
        {
            matrix[i][j] = 1;
        }
        
    }

    // Cálculo de la multiplicación de v1 * matrix = v3
    int aux;

    cgt1 = omp_get_wtime();

    // Filas
    for (int i = 0; i < N; i++)
    {
        // Columnas
        aux = 0;
        #pragma omp parallel for reduction(+:aux)
        for (int j = 0; j < N; j++)
        {
            aux += matrix[j][i]*v1[j];
        }
        v3[i] = aux;
    }
    
    cgt2 = omp_get_wtime();

    ncgt = cgt2 - cgt1;

    // Imprimir los datos
    printf("Dimension: %d Tiempo: %11.9f \n", N, ncgt);

    printf("Resultado: ");
    if(N<12)
    {
        for (int i = 0; i < N; i++)
        {
            printf("[%d] = %d ", i, v3[i]);
        }
        
    }
    else
    {
        printf("[0] = %d; [%d] = %d", v3[0], N-1, v3[N-1]);
    }
    printf("\n");


    // Liberar memoria
    free(v1);
    free(v3);

    for (int i = 0; i < N; i++) free(matrix[i]);
    free(matrix);
    
    return 0;
}
 
