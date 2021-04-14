import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(YARC_SDKTests.allTests),
    ]
}
#endif
