#include <stdio.h>
#define TAMANHO 5
#define CONSTANTE 2048
int origem[TAMANHO] = {7, 8, 9, 10, 11};
int destino[TAMANHO];
int calcula_enuplo(int numero) { return (numero * CONSTANTE); }
void multiplica_vetor(int *vec1, int *vec2, int t) {
  for (; t > 0; t--)
    vec2[t - 1] = calcula_enuplo(vec1[t - 1]);
}
void imprime_vetor(int *vec, int t) {
  for (; t > 0; t--)
    printf("%d\n", vec[t - 1]);
}
int main(void) {
  multiplica_vetor(origem, destino, TAMANHO);
  imprime_vetor(destino, TAMANHO);
  return 0;
}