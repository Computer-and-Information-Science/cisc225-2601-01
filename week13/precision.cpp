#include <iostream>
#include <iomanip>
using namespace std;

int compare (double a, double b);

const double zero2 = 0.2;

int main () {
	double x = 0;
	double y = 1;

	x = x + zero2 + zero2; // 0.4
	y = y - zero2 - zero2 - zero2; // 0.4

	cout << fixed << setprecision(3);
	cout << "x = " << x << endl;
	cout << "y = " << y << endl;

	cout << "Direct comparison...\n";
	cout << "x is ";
	if (x < y)
		cout << "less than";
	else if (x > y)
		cout << "greater than";
	else
		cout << "equal to";
	cout << " y\n";

	cout << "Allowing for tolerance...\n";
	cout << "x is ";
	switch (compare(x, y)) {
		case -1: cout << "less than"; break;
		case 1: cout << "greater than"; break;
		default: cout << "equal to";
	}
	cout << " y\n";
}

int compare (double a, double b) {
	const double tolerance = 0.0001; // a == b if difference less than 0.0001
	if (a < b)
		return b - a < tolerance ? 0 : -1;
	if (a > b)
		return a - b < tolerance ? 0 : 1;
	return 0;
}
