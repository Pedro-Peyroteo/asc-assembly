/* #include <stdio.h> */

int acumulador = 0, i;

void main(void) {
    for (i = 10; i >= 0; i--) {
        acumulador += i * 2 + 1;
    }
    /* printf("acumulador: %d\n", acumulador); */
}
