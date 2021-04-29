@testable import YARC_SDK
import XCTest

final class YARC_SDKTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(YARC_SDK().text, "Hello, World!")
    }

    static var allTests = [("testExample", testExample)]
}
