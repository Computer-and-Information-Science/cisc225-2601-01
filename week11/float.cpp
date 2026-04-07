#include <iostream>
#include <iomanip>
using namespace std;

int main () {
	float sum = 0;
	float value = 0.2;

	for (int i = 0; i < 50; i++)
		sum += value;

	cout << fixed << setprecision(10);
	cout << sum << endl;
}
