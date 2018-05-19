#include <iostream>
#include "gmcodes.h"
#include "mainmenu.h"
using namespace std;
gmcodes ob2;
mainmenu::mainmenu()
{
    //ctor
}
void mainmenu::menu()
{
    cout<<"Press:\n 1 Start\t  2 Resume\n 3 Instruction\t  4 Help\n 5 Scroce\t  6 Exit"<<endl;
}
void mainmenu::start(int y)
{

    if(y==1)
    {
        cout<<"\t\t====================="<<endl;
        cout<<"\t\t  ]= LEVEL-1 =["<<endl;
        cout<<"\t\t====================="<<endl;
        cout<<"Guess a number that should be in range(0-9)"<<endl;
        randnum=ob2.level1();
        ob2.recall(randnum);
    }
    if(ob2.promotion==3)
    {
        cout<<"Do you want to play next level?(y/n)"<<endl;
        cin>>lch;
        if(lch=='y')
        {
            cout<<"\t\t====================="<<endl;
            cout<<"\t\t  ]= LEVEL-2 =["<<endl;
            cout<<"\t\t====================="<<endl;
            cout<<"Guess a number that should be in range(0-14)"<<endl;
            ob2.levelch=0;
            randnum=ob2.level2();
            ob2.recall(randnum);


        }else{}

    }
    if(ob2.promotion==6)
    {
        cout<<"Do you want to play next level?(y/n)"<<endl;
        cin>>lch;
        if(lch=='y')
        {
            cout<<"\t\t====================="<<endl;
            cout<<"\t\t  ]= LEVEL-3 =["<<endl;
            cout<<"\t\t====================="<<endl;
            cout<<"Guess a number that should be in range(0-19)"<<endl;
            ob2.levelch=0;
            randnum=ob2.level3();
            ob2.recall(randnum);
            cout<<"\t\t****************************************************"<<endl;
            cout<<"\t\t*  "<<name<<endl;
            cout<<"\t\t* Contrats You had finised all level of this game. *"<<endl;
            cout<<"\t\t*  Your Total Scroce is :"<<ob2.scroce<<"          *"<<endl;
            cout<<"\t\t****************************************************"<<endl;

        }else{}

    }

}
void mainmenu::resume()
{

    if(ob2.promotion==3)
    {
        cout<<"Do you want to play next level?(y/n)"<<endl;
        cin>>lch;
        if(lch=='y')
        {
            cout<<"\t\t====================="<<endl;
            cout<<"\t\t  ]= LEVEL-2 =["<<endl;
            cout<<"\t\t====================="<<endl;
            cout<<"Guess a number that should be in range(0-14)"<<endl;
            ob2.levelch=0;
            randnum=ob2.level2();
            ob2.recall(randnum);

        }else{}

    }
    if(ob2.promotion==6)
    {
        cout<<"Do you want to play next level?(y/n)"<<endl;
        cin>>lch;
        if(lch=='y')
        {
            cout<<"\t\t====================="<<endl;
            cout<<"\t\t  ]= LEVEL-3 =["<<endl;
            cout<<"\t\t====================="<<endl;
            cout<<"Guess a number that should be in range(0-19)"<<endl;
            ob2.levelch=0;
            randnum=ob2.level3();
            ob2.recall(randnum);
            cout<<"\t\t****************************************************"<<endl;
            cout<<"\t\t*  ||"<<name<<"||"<<endl;
            cout<<"\t\t* Contrats You had finised all level of this game. *"<<endl;
            cout<<"\t\t*  Your Total Scroce is :"<<ob2.scroce<<"       *"<<endl;
            cout<<"\t\t****************************************************"<<endl;

        }else{}

    }else{
        cout<<"No pused game is found."<<endl;
    }

}
void mainmenu::instraction()
{
    cout<<"\t\t\t]=: Guess Game :=["<<endl;
    cout<<"Wel come to information center.In this game you have to guess a number. "<<endl;
    cout<<"If you guess a number and it is smaller than a correct number.Then it is show you  massege'The number is too low'";
    cout<<"If you guess a number and it is greter than a correct number.Then it is show you  massege'The number is too High'";
    cout<<"If you guess a number and it is equal to the correct number.Then it is show you  massege'Congrats!and you can see your scroce.'";
    cout<<"There are 3 Levels and each levels you need to guess correct number 3 times. Each guess time you have 3 chances to correct guess.";
    cout<<"In this way you play the game."<<endl;
}
void mainmenu::help()
{
    cout<<"\t\t\t]=:  HElp  :=["<<endl;
    cout<<"  If you have any kind of problem to play this game\n"<<endl;
    cout<<"\t\tContuct us as this number:"<<endl;
    cout<<"\t\tHabibur Rahman:01755305105\n\t\tArafat Hossain:01681278782\n\t\tImran Khan Emon:01670063271\n\t\tMoshiur Rahman:01680115265"<<endl;
    cout<<"OR: www.facebook.com/groups/sprogrammingclub\n"<<endl;
}
void mainmenu::Scroce()
{
    cout<<"\t\t====================="<<endl;
    cout<<"\t\t  ]: Last Scroce :["<<endl;
    cout<<"\t\t====================="<<endl;
    cout<<"\t\t\t"<<name<<":"<<ob2.scroce<<endl;

}
mainmenu::~mainmenu()
{
    //ctor
}
