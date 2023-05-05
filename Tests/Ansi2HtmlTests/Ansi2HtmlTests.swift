import XCTest
@testable import Ansi2Html
import ColorizeSwift
//import CustomDump

final class Ansi2HtmlTests: XCTestCase {
    
    func testPlainString() throws {
        
        let input = "Hello World!"
        let output = "Hello World!"
        let html = input.ansiToHtml
        XCTAssertEqual(html, output)
    }
    
    func testBackgroundColorString() throws {
        
        let input = "background color".backgroundColor(.green)
        let output = """
<body style="background-color:#111111;font-family:'Consolas','Droid Sans Mono',monospace; color:#eeeeee; white-space:pre"><span style="background-color:#af87ff"> background color </span></body>
"""
        
        XCTAssertEqual(input.ansiToHtml, output)
    }
    
    func testHasAnsi() throws {
        XCTAssertFalse("Hello World!".hasAnsi)
        XCTAssertTrue("Hello World!".bold().hasAnsi)
        XCTAssertTrue("Awful combination".colorize(.yellow, background: .red).hasAnsi)
        XCTAssertFalse("Awful combination".colorize(.yellow, background: .red).uncolorized().hasAnsi)
    }
}
