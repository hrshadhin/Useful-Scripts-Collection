#include <iostream>
#include "gmcodes.h"
#include "mainmenu.h"
#include<cstdlib>
#include<ctime>

using namespace std;


gmcodes::gmcodes()
{

}

int gmcodes::level1()
{
    srand(time(0));
    return rand()%10;
}
int gmcodes::level2()
{
    srand(time(0));
    return rand()%15;
}
int gmcodes::level3()
{
    srand(time(0));
    return rand()%20;
}
void gmcodes::recall(int x)
{

    do
    {
        cin>>gnum;

        count+=1;
        if(gnum>x)
        {
            cout<<"Your guess number is too high.Try again."<<endl;
        }
        else if(gnum<x)
        {
            cout<<"Your Guess number is too low.try again."<<endl;
        }
        else if(gnum==x)
        {

            scroce+=100;
            cout<<"Congrats! Your guess is correct and scroce is "<<scroce<<"\n Guess again:"<<endl;
            count=0;
            promotion+=1;
            levelch+=1;
            if(promotion==3){
                x=level2();
            }
            else if(promotion==6){
                x=level3();
            }
            else{
                x=level1();
            }


        }
        if(count==3){
            cout<<"\nOppssss!!! You are a loser...!!!!"<<endl;
            count=0;

            break;
        }

    }while(levelch!=3);

}
gmcodes::~gmcodes()
{

}
