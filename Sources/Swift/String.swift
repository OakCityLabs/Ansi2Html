//
//  String.swift
//  
//
//  Created by Jay Lyerly on 5/5/23.
//

import Foundation

extension String {
    
    var ansiToHtml: String {
        AnsiAttributedStringBuilder().stringToHtml(self)
    }

}
