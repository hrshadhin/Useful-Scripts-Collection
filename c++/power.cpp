#include<iostream>

#include<math.h>
#include<stdlib.h>
using namespace std;
int main()
{
    float a[10][10],x[10],c[10],d=0,temp;
    int n,i,j;

    cout<<"Enter the order of matrix ? ";
    cin>>n;
    cout<<"\nCoefficients of matrix ";
    for(i=0;i<n;i++)
    {
        cout<<endl<<"row  "<<i+1<<"  ";
        for(j=0;j<n;j++)
            cin>>a[i][j];
    }

    cout<<"Enter your starting vector ? ";
    for(i=0;i<n;i++)
    cin>>x[i];

    do
    {
        for(i=0;i<n;i++)
        {
            c[i]=0;
            for(j=0;j<n;j++)
                c[i]+=a[i][j]*x[j];
        }
        for(i=0;i<n;i++)
            x[i]=c[i];

        temp=d;
        d=0;

        for(i=0;i<n;i++)
        {
            if(fabs(x[i])>fabs(d))
                d=x[i];
        }
        for(i=0;i<n;i++)
            x[i]/=d;

    }while(fabs(d-temp)>0.00001);

    cout<<"Eigen value is : "<<d<<endl;

    cout<<"Eigenvector is: ";
    for(i=0;i<n;i++)
        cout<<endl<<x[i];


    return 0;
}
