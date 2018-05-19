#include<iostream>
#include<fstream>
#include <stdlib.h>
#include<string.h>
#include<unistd.h>

using namespace std;
int main()
{


    ifstream shadhin("links.txt");//read file
    char link[5000];
    char url[500];
    char add[50] ="firefox -new-tab ";
    while(shadhin>>link)//copy the linksfile:///home/crazicoder/Dropbox/CodeLife/CrazyCoder/CPlusPLUS/2012/MAY/VIRUS.cpp
// into the link variable
    {

        strcat(add,link);//add the link with program name

        system(add);//call the system to run the link by browser
        strcpy(add,"firefox -new-tab ");
        sleep(10);//delay ten secends



    }
    shadhin.close();
    return 0;

}
