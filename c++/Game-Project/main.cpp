#include <iostream>
#include "gmcodes.h"
#include "mainmenu.h"
using namespace std;

int main()
{
    int choice,s;
    char ch;
    mainmenu ob;
    gmcodes ob2;

    do
    {
        ob.menu();
        cin>>choice;
        switch(choice)
        {
            case 1:
            cout<<"Whats Your name:";
            cin>>ob.name;
            ob.start(1);
            break;
            case 2:
            ob.resume();
            break;
            case 3:
            ob.instraction();
            break;
            case 4:
            ob.help();
            break;
            case 5:
            ob.Scroce();
            break;
            case 6:
            return 0;
            default:
            cout<<"I can't uderstand you,what r u want! Enter the correct input."<<endl;
        }
        cout<<"Press b to back mainmenu or e to exit"<<endl;
        cin>>ch;
    }while(ch!='e');
    cin>>s;
    return 0;
}
