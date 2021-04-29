import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [testCase(YARC_SDKTests.allTests)]
}
#endif
