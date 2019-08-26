import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(zhaohu_sdk_iosTests.allTests),
    ]
}
#endif
