// Multiply two unsigned int's using only bit test, shift, and addition

#include <iostream>
using namespace std;

unsigned int multiply (unsigned int a, unsigned int b);

int main () {
	unsigned int x, y;
	cout << "Enter two unsigned int's: ";
	cin >> x >> y;
	cout << "The product is " << multiply(x, y) << ".\n";
}

unsigned int multiply (unsigned int a, unsigned int b) {
	unsigned int product = 0; // return value, initialized to zero

	// loop once for each bit
	for (unsigned int i = 0; i < sizeof(unsigned int) * 8; i++) {
		// if low-order bit of multipler (b) is set, add a to product
		if (b & 1 != 0)
			product += a;
		// shift multiplicand (a) left by 1 for next partial product
		a = a << 1;
		// shift multiplier (b) right by 1 for next bit test
		b = b >> 1;
	}

	// return the product
	return product;
}
