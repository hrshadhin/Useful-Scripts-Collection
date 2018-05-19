#include<stdio.h>
#include<math.h>
#include<iostream>


using namespace std;
int main()
{
    int a,b,c,xon,i,x,ite,n;
    double h,sum,xn,xo,fpx,fxn,fx,nextN;
    printf("\nN-R METHOD FOR : x^3-8x-4\n\n");
    printf("how many times do you want to iterate?\nPlease type here:");
    scanf("%d",&ite);
    printf("\nChoosing xo = 3.5 \n\n");
    xn=3.5;
    n=0;
    sum=0;
    for(i=1;i<=ite;i++)
    {
        printf("When n=%d",n);
        printf("\tx = %6f",xn);
        n++;
        fx=pow(xn,3)-(8*xn)-4;
        printf("\tfx = %.6lf",fx);
        fpx=3*(pow(xn,2))-8;
        printf("\tfpx = %.6lf",fpx);
        xn = xn - (fx/fpx);
        printf("\tx(n+1)=%.6lf\n",xn);
        fx=pow(xn,3)-(8*xn)-4;
        fpx=3*(pow(xn,2))-8;
        h=-(fx/fpx);
        nextN = xn + h ;
        xn = nextN ;
    }
    printf("\nSo after the %dth iteration the result is : %.6lf\n",ite,xn);
    return 0;
}
