import XCTest
@testable import Ansi2Html
//import CustomDump

final class Ansi2HtmlTests: XCTestCase {
    func testExample() throws {
        // XCTest Documenation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testPlainString() throws {
        
        let input = "Hello World!"
        let output = "Hello World!"
//        (0..<1_000_000_000).forEach { _ in
//            _ = input.ansiToHtml
//        }
        let html = input.ansiToHtml
        XCTAssertEqual(html, output)
    }
    
    func testBackgroundColorString() throws {
        
        let input = "\\x1b[48;5;141m background color \\x1b[49m;"
        let output = """
<body style="background-color:#111111;font-family:'Consolas','Droid Sans Mono',monospace; color:#eeeeee; white-space:pre"><span style="background-color:#af87ff"> background color </span></body>
"""
        
        XCTAssertEqual(input.ansiToHtml, output)
    }
}
