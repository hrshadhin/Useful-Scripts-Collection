#include <iostream>

using namespace std;
void display(string x[]);
int main()
{
    string name[][][]={{"1","HR","shadhin"},{"2","mr","friky"}};
    cout<<"Serial No\t:"<<"First name"<<"\t"<<"Last name"<<endl;
    display(name);

    return 0;
}
void display(string x[])
{
    for(int row=0;row<x.length;row++){
            for(int coulum=0;coulum<x[row].length;coulum++){
            cout<<x[row][coulum]<<"\t\t";
            }
            cout<<endl;
    }
}
