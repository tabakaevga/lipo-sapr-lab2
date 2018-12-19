#include "MacrosFinder.h"
#include <string>
#include <iostream>
#include <pcrecpp.h>
#include <sstream>		
#include <algorithm>
#include <iterator>
#include <vector>	

using namespace std;

string MacrosFinder::findMacros()
{
    string macros = "";
    string list = "";
    pcrecpp::RE macrosRegex = pcrecpp::RE("(#define\\s\\w+\\s\"[\\w\\d\\s.-]*\")");
    
    vector<string>macrosArray;
    vector<string>::iterator macrosArrayIterator;
    vector<string>::iterator uniqueMacros;
    
    while (getline(cin, macros))
    {
        pcrecpp::StringPiece input(macros);
        while (macrosRegex.FindAndConsume(&input, &macros))
        {
            uniqueMacros = find(macrosArray.begin(), macrosArray.end(), macros);
            if (uniqueMacros == macrosArray.end())
            {
                if (list == "")
                {
                    list += macros;
                }
                else 
                {
                    list += "\n" + macros;
                }
                macrosArray.push_back(macros);
            }
        }
    }
    return list;
}