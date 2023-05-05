import XCTest
@testable import Ansi2Html
import ColorizeSwift
import CustomDump

final class Ansi2HtmlTests: XCTestCase {
    
    func testPlainString() throws {
        
        let input = "Hello World!"
        let output = "Hello World!"
        let html = input.ansiToHtml
        XCTAssertNoDifference(html, output)
    }
    
    func testBackgroundColorString() throws {
        
        let input = "background color".backgroundColor(.green)
        let output = """
        <span style="background-color:#39b54a">background color</span>
        """
        
        XCTAssertNoDifference(input.ansiToHtml, output)
    }
    
    func testHasAnsi() throws {
        XCTAssertFalse("Hello World!".hasAnsi)
        XCTAssertTrue("Hello World!".bold().hasAnsi)
        XCTAssertTrue("Awful combination".colorize(.yellow, background: .red).hasAnsi)
        XCTAssertFalse("Awful combination".colorize(.yellow, background: .red).uncolorized().hasAnsi)
    }
}
