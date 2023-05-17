import XCTest
@testable import Ansi2Html
import ColorizeSwift
import CustomDump

final class Ansi2HtmlTests: XCTestCase {
    
    let builder = AnsiHtmlStringBuilder()
    
    func testPlainString() throws {
        
        let input = "Hello World!"
        let output = "Hello World!"
        let html = builder.stringToHtml(input)
        XCTAssertNoDifference(html, output)
    }
    
    func testBackgroundColorString() throws {
        
        let input = "background color".backgroundColor(.green)
        let output = """
        <span style="background-color:#39b54a">background color</span>
        """
        
        XCTAssertNoDifference(builder.stringToHtml(input), output)
    }
    
    func testHasAnsi() throws {
        XCTAssertFalse(builder.stringHasAnsi("Hello World!"))
        XCTAssertTrue(builder.stringHasAnsi("Hello World!".bold()))
        XCTAssertTrue(builder.stringHasAnsi("Awful combination".colorize(.yellow, background: .red)))
        XCTAssertFalse(builder.stringHasAnsi("Awful combination".colorize(.yellow, background: .red).uncolorized()))
    }
    
    func testBackgroundColorCloseSpan() throws {
        let input = "Hello World!".backgroundColor(.red)
        let html = builder.stringToHtml(input)
        
        let expectedHtml = #"<span style="background-color:#ff0000">Hello World!</span>"#
        
        XCTAssertNoDifference(html, expectedHtml)
    }
    
    func testForegroundColor() throws {
        let input = "Hello World!".foregroundColor(.purple)
        let html = builder.stringToHtml(input)

        let expectedHtml = ##"<span style="color: #762671;">Hello World!</span>"##

        XCTAssertNoDifference(html, expectedHtml)
    }
}
