#include <iostream>
using namespace std;

#define MAX_STR 32

int main() {

    // Getting the user inputs
    char userName[MAX_STR];
    int userAge;

    printf("Enter your name: ");
    cin >> userName;    // Need to use fgets here otherwise it'll result in a buffer error
    printf("\n");

    printf("Enter your age: ");
    cin >> userAge;
    printf("\n");

    // Result output
    printf("Hello, %s. You are %d years old.\n", userName, userAge);

    return 0;
}