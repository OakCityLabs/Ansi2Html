//
//  Ansi2HtmlBridge.cpp
//  
//
//  Created by Jay Lyerly on 5/5/23.
//

#include "ansi_esc2html.h"

// extern "C" will cause the C++ compiler
// (remember, this is still C++ code!) to
// compile the function in such a way that
// it can be called from C
// (and Swift).

extern "C" const char* htmlStr(const char* input)
{
    ANSI_SGR2HTML ansisgr2html;
    std::string inputStdStr(input);
    std::string html = ansisgr2html.simpleParse(inputStdStr);
    const char* htmlC = strdup(html.c_str());
    return htmlC;
//    return html.c_str();
    
//    std::string ansi = "\x1b[48;5;141m background color \x1b[49m";
//    std::string html = ansisgr2html.simpleParse(ansi);
}
