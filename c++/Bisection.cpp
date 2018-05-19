#include<stdio.h>
#include<iostream>

using namespace std;
int main()
{
    printf("Calculating with the Equation f(x)=x^3-x-1\n\n");
    int i,num;
    float x,fx,a,b;
    printf("Enter the value of a = ");
    scanf ("%f",&a);
    printf("Enter the value of b = ");
    scanf ("%f",&b);
    printf("The iteration number is:  ");
    scanf("%d",&num);
    printf("The table is given below:\n\n");
    for(i=1;i<=num;i++)
    {
        printf("%.5f  %.5f ",a,b);
        x=(a+b)/2;
        printf("%.5f ",x);
        fx=(x*x*x)-x-1; //f(x)=x^3-x-1
        if(fx<0.0)
        {
            a=x;
            printf(" -");
        }
        else
        {
            b=x;
            printf(" +");
        }
        printf("\n");
    }
    printf("\nSo,After %d iteration our correct root of f(x) is %.5f \n",num,x);
    return 0;
}
