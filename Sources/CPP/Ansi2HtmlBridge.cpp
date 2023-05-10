//
//  Ansi2HtmlBridge.cpp
//  
//
//  Created by Jay Lyerly on 5/5/23.
//

#include "ansi_esc2html.h"

extern "C" const char* htmlStr(const char* input)
{
    ANSI_SGR2HTML ansisgr2html;
    std::string inputStdStr(input);
    std::string html = ansisgr2html.simpleParse(inputStdStr);
    const char* htmlC = strdup(html.c_str());           // Allocate memory for a copy so it's not immediately released.
    return htmlC;
}
