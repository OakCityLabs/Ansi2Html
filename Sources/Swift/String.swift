//
//  String.swift
//  
//
//  Created by Jay Lyerly on 5/5/23.
//

import Foundation

public extension String {
    
    var ansiToHtml: String {
        AnsiAttributedStringBuilder().stringToHtml(self)
    }
    
    var hasAnsi: Bool {
        AnsiAttributedStringBuilder().stringHasAnsi(self)
    }

}
