#ifndef MAINMENU_H
#define MAINMENU_H
using namespace std;

class mainmenu
{
    public:
        mainmenu();
        ~mainmenu();
        int randnum;
        int gnum,count,scroce,promotion,levelch;
        string name;
        char lch;
        void menu();
        void start(int y);
        void resume();
        void instraction();
        void help();
        void Scroce();


};

#endif // MAINMENU_H
