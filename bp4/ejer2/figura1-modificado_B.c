#include <stdio.h>
#include <stdlib.h>
#include <time.h>	

#define MAX 64000

int main(int argc, char **argv)
{
    if(argc < 3) 
    {
        printf("Uso: ./figura1-modificado_A_EXE N M\n");
        exit(-1);
    }

    // Declaración de datos.
    struct timespec cgt1,cgt2; double ncgt;

    int N = atoi(argv[1]),
        M = atoi(argv[2]);

    struct 
    {
        int a;
        int b;
    } s[MAX];

    double *R;
        R = (double *)malloc(M * sizeof(double));

    if(R == NULL)
    {
        printf("Error en la reserva de espacio\n");
        exit(-2);
    }

    // Inicialización de datos.
    int a = 0, b = N;
    struct drand48_data randBuffer;
    double randomNumber;
    srand48_r(time(NULL), &randBuffer);

    for (int i = 0; i < N; i++)
    {
        if (N < 9 && M < 9)
        {
            s[i].a = ++a;
            s[i].b = ++b;
        }
        else
        {
            drand48_r(&randBuffer, &randomNumber);
            s[i].a = (int)2*randomNumber;
            drand48_r(&randBuffer, &randomNumber);
            s[i].b = (int)2*randomNumber;
        }
    }

    // Cálculo
    double X1, X2, Y1, Y2;
    int ii, i;
    clock_gettime(CLOCK_REALTIME, &cgt1);
    for (ii = 0; ii < M; ii++)
    {
        X1=0; X2=0;
        for(i=0; i<N;i+=2)
        {
            X1 += ((s[i].a + s[i].a) + ii) + ((s[i + 1].a + s[i + 1].a) + ii);

            X2 += ((s[i].b + s[i].b + s[i].b) - ii) + ((s[i + 1].b + s[i + 1].b + s[i + 1].b) - ii);
        }

        if (X1<X2)
            R[ii] = X1;
        else
            R[ii] = X2;

    }
    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
         (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    // Imprimir los datos
    printf("Dimension: %d Tiempo: %11.9f \n", N, ncgt);

    printf("Resultado: \n");
    if(N<9 && M<9)
    {
        for (int i = 0; i < M; i++)
        {
            printf("[%d] = %2.0f ", i, R[i]);
        }
    }
    else
    {
        printf("[0] = %2.0f, ..., [%d] = %2.0f", R[0], M-1, R[M-1]);
    }
    printf("\n");


    // Liberar memoria
    free(R);

    return 0;
}