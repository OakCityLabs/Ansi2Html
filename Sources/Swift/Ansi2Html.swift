// The Swift Programming Language
// https://docs.swift.org/swift-book

// Actual conversion is handled by code from this repo, manually copied into this project
// https://github.com/pozemka/ANSIEsc2HTML

import Ansi2HtmlCpp

struct AnsiAttributedStringBuilder {
  
    func stringToHtml(_ str: String) -> String {
        str.withCString { ptr in
            let htmlC = htmlStr(ptr)
            let html = String(cString: htmlC!)
            htmlC?.deallocate()
            return html
        }
    }

//    func stringToHtml(_ str: String) -> String {
//        let htmlC = str.withCString { htmlStr($0) }
//
//        if let htmlC {
//            let html = String(cString: htmlC)
//            return html
//        } else {
//            return str
//        }
//    }
        
}
