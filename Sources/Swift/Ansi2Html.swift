// The Swift Programming Language
// https://docs.swift.org/swift-book

// Actual conversion is handled by code from this repo, manually copied into this project
// https://github.com/pozemka/ANSIEsc2HTML

import Ansi2HtmlCpp
import Foundation

public struct AnsiAttributedStringBuilder {
    
    public init() { }       // make this explicitly public
    
    public func stringToHtml(_ str: String) -> String {
        guard stringHasAnsi(str) else { return str }
        
        let html = str.withCString { ptr in
            let htmlC = htmlStr(ptr)                // Get the cString
            let html = String(cString: htmlC!)      // Create a Swift string by copying the bytes of the cString
            htmlC?.deallocate()                     // Deallocate the cString, so we don't leak
            return html
        }
        
        return html
    }
    
    public let ansiRegex = try! NSRegularExpression(pattern: "\\\u{001B}\\[([0-9;]+)m")
    
    public func stringHasAnsi(_ str: String) -> Bool {
        ansiRegex.numberOfMatches(in: str, options: [], range: str.range) != 0
    }
    
}

private extension String {
    
    var range: NSRange { NSRange(location:0, length: count) }
    
}
