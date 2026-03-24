#include <stdio.h>

// Delete this function and replace in assembly
//int swap2(int *a, int *b) {
//  int tmp = *a;
//  *a = *b;
//  *b = tmp;
//}

int swap2(int *a, int *b);

int main () {
  int x, y;

  printf("Enter two integers: ");
  int status = scanf("%d %d", &x, &y);

  swap2(&x, &y);

  printf("The values are %d and %d.\n", x, y);

  return 0;
}
