#include <stdio.h>
#include <stdlib.h>
#include <time.h>	
#include <mmintrin.h>
#include <xmmintrin.h>


int main(int argc, char **argv)
{
    if(argc < 2) 
    {
        printf("Uso: ./pmm-sencuencial_EXE n\nn    Dimensión de la matriz.\n");
        exit(-1);
    }


    // Declaración de datos.
    struct timespec cgt1,cgt2; double ncgt;

    int N = atoi(argv[1]);

    double **m1, **m2, **m3;
        m1 = (double**) malloc(N*sizeof(double*));
        m2 = (double**) malloc(N*sizeof(double*));
        m3 = (double**) malloc(N*sizeof(double*));


    if(m1 == NULL || m2 == NULL || m3 == NULL)
    {
        printf("Error en la reserva de espacio\n");
        exit(-2);
    }
    
    for(int i=0; i<N; i++) 
    {
        m1[i] = (double*) malloc(N*sizeof(double));
        m2[i] = (double*) malloc(N*sizeof(double));
        m3[i] = (double*) malloc(N*sizeof(double));
        if(m1[i] == NULL || m2[i] == NULL || m3[i] == NULL)
        {
            printf("Error en la reserva de espacio\n");
            exit(-2);
        }
    }

    // Inicialización de datos.
    int a = 0, b = N*N;
    struct drand48_data randBuffer;
    double randomNumber;
    srand48_r(time(NULL), &randBuffer);

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            m3[i][j] = 0;
            if (N < 9)
            {
                m1[i][j] = ++a;
                m2[i][j] = ++b;
            }
            else
            {
                drand48_r(&randBuffer, &randomNumber);
                m1[i][j] = randomNumber;
                drand48_r(&randBuffer, &randomNumber);
                m2[i][j] = randomNumber;
            }
        }
    }

    // Cálculo de la multiplicación de m1 * m2 = m3
    // !Solo funciona con matrices pares!
    clock_gettime(CLOCK_REALTIME, &cgt1);
    for (int i = 0; i < N; i++)
    {
        for (int k = 0; k < N; k++)
        {
            for (int j = 0; j < N; j+=2)
            {
                m3[i][j] += m1[i][k] * m2[k][j];
                m3[i][j+1] += m1[i][k] * m2[k][j+1];
            }
        }
    }
    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
         (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    // Imprimir los datos
    printf("Dimension: %d Tiempo: %11.9f \n", N, ncgt);

    printf("Resultado: \n");
    if(N<9)
    {
        for (int i = 0; i < N; i++)
        {
            for (int j = 0; j < N; j++)
            {
                printf("[%d][%d] = %0.2f ", i, j, m3[i][j]);
            }
            printf("\n");
        }
    }
    else
    {
        printf("[0][0] = %2.2f, ..., [%d][%d] = %2.2f", m3[0][0], N-1,N-1, m3[N-1][N-1]);
    }
    printf("\n");


    // Liberar memoria
    for (int i = 0; i < N; i++) 
    {   
        free(m1[i]); 
        free(m2[i]);
        free(m3[i]);
    }

    free(m1);
    free(m2);
    free(m3);

    return 0;
}
 
 
