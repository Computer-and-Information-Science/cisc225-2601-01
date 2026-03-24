#include <stdio.h>

int add2(int a, int b);

int main () {
  int x, y;

  printf("Enter two integers: ");
  int status = scanf("%d %d", &x, &y);

  int sum = add2(x, y);

  printf("The sum is %d.\n", sum);

  return 0;
}