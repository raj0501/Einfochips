/* This is demo code for segmentation fault
 * Creation Date : 04-08-2025
 */

#include<stdio.h>
int main(){
    int *ptr = NULL;       // Pointer initialized to NULL
    *ptr = 42;             // Dereferencing NULL causes segmentation fault
    return 0;
}

