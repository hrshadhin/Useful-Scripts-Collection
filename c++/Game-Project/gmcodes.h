#ifndef GMCODES_H
#define GMCODES_H
#include "mainmenu.h"

class gmcodes: public mainmenu
{
    public:
        gmcodes();
        ~gmcodes();
        int level1();
        int level2();
        int level3();
        void recall(int x);



};

#endif // GMCODES_H
