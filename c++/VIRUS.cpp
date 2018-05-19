#include<iostream>
#include<string>
#include<sstream>
#include<stdlib.h>
#include<fstream>
using namespace std;
int main()
{
    ofstream shadhin("virus.txt");
    int i=0;
    while(i<1000)
    {
       string l="cp virus.txt > 007.txt_";//FILE COPY COMMAND
       string s ;
       stringstream out;//SPECIAL TYPE STRING THAT WORK FOR CONVERT INT TO STR
        out << i;//COPY I TO OUT
        s = out.str();//CONVERT INT TO STR
        l.append(s);//ADD S TO THE LAST OF L 

        const char *p;//CREATE A CONSTANT CHAR VARIABLE (BCOZ SYSTEM FUNCTION WTIH CHAR NOT STRING)
        p=l.c_str();//CONVER STRING TO CONST CHAR

        system(p);//CXICUTE THE COMMAD
        i++;
    }



    return 3;
}
