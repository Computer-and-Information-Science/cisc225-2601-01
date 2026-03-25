#include <stdio.h>

int main () {
	int x;
	int y;

	//printf("Hello World!\n");

	printf("Enter two int's: ");
	scanf("%d %d", &x, &y);

	int sum = x + y;
	printf("The sum of %d and %d is %d.\n", x, y, sum);

	return 0;
}
