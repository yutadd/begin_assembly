#include <stdio.h>
int plus(int a,int b){
    int c=a+b;
    return c;
}
int main() {
    int d=plus(5,2);
    printf("%d\n",d);
    return 0;
}