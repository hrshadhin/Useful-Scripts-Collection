#include<iostream>
#include<string>
using namespace std;
int main()
{
	 for(int h=0;h<24;h++)
	 {
	     for(int m=0;m<60;m++)
	     {
	         for(int s=0;s<60;s++)
	         {
	             for(int i=0;i<=36000;i++) /*this loop changes seconds of clock you will have to modify it according to your compiler speed*/
                    cout<<"       \t\t\t*:::::[* "<<h<<":"<<m<<":"<<s<<" *]:::::*"<<'\r';

	         }
	     }
	 }




}




