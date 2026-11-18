#include <stdio.h>
#include <stdlib.h>

#define N 1024

void init_matrices(float * restrict A, float * restrict B, float * restrict C) {
    for (int i = 0; i < N * N; i++) {
        A[i] = (float)(i % 100) / 10.0f;
        B[i] = (float)((i + 5) % 100) / 10.0f;
        C[i] = 0.0f;
    }
}

void multiply_matrices(const float * restrict A, const float * restrict B, float * restrict C) {
    for (int i = 0; i < N; i++) {
        for (int k = 0; k < N; k++) {
            float a_ik = A[i * N + k];
            for (int j = 0; j < N; j++) {
                C[i * N + j] += a_ik * B[k * N + j];
            }
        }
    }
}

int main() {
    float *A = (float *)malloc(N * N * sizeof(float));
    float *B = (float *)malloc(N * N * sizeof(float));
    float *C = (float *)malloc(N * N * sizeof(float));

    if (!A || !B || !C) return 1;

    init_matrices(A, B, C);
    multiply_matrices(A, B, C);

    printf("Result check: %f\n", C[0]);

    free(A);
    free(B);
    free(C);
    return 0;
}
