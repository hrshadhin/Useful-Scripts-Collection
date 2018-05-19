#include<stdio.h>
#include<math.h>
#include<iostream>
using namespace std;
int main()
{
    int i,j,data,k,l,X,cnt,m,n,a,b,c,xy[50][50],fact[1000];
    double u ,h,x,res,RES;
    fact[0]=1;
    fact[1]=1;
    for(i=2;i<=10;i++)
    {
        fact[i]=fact[i-1]*i;
    }
    printf("How many data you want to enter : ");
    scanf("%d",&data);
    printf("Please enter the values :\n");
    j=0;
    for(i=0;i<data;i++)
    {
        printf("x[%d] = ",i);
        scanf("%d",&xy[i][j]);
    }
    printf("\n");
    j=1;
    for(i=0;i<data;i++)
    {
        printf("y[%d] = ",i);
        scanf("%d",&xy[i][j]);
    }
    n=1;
    for(i=2;i<=data+1;i++)
    {
        for(j=0;j<data-n;j++)
        {
            xy[j][i]=xy[j+1][i-1]-xy[j][i-1];
        }
        n++;
    }
    printf ("Which 'x' do u find out?\nPlease type the value here : ");
    scanf ("%d", &X);
    h = float(xy[1][0]-xy[0][0]);
    u=float((X-xy[0][0])/ h);
    printf("h = %.0lf  u = %lf \n",h,u);
    n=1;
    res = xy[0][1]+ (u * xy[0][2]);
    cnt=1;
    RES=0.0;
    double U = u;
    for(i=3;i<=data;i++)
   {
        u = u * (U-cnt);
        cnt++;
        RES = RES+(u* xy[0][i])/fact[cnt];
        n++;
  }
    printf("The output is : %lf\n",res+RES);
    return 0;
}
