#include <iostream>
#include<algorithm>
#include<string>
using namespace std;
int checkString(string x);
int main()
{
    string num;
    int check;
    for(int i=0;i<5;i++)
    {
        back:
        cout<<"Enter Integer numbers:";
        cin>>num;
        check=checkString(num);
        if(check==1) cout<<"The Number is: "<<num<<endl;
        else
        {
            cout<<"Number invalid!! This number contains letters or its floats."<<endl;
            goto back;
        }

    }
    return 0;
}
int checkString(string x)
{
    int count=0;
    for(int k=0;k<x.length();k++)
    {
        if(isdigit(x[k])) count++;
    }
    if(x.size()==count) return 1;
    else return 0;


}
