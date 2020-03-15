import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StringCamelCaseTests.allTests),
        testCase(StringKebabCaseTests.allTests),
        testCase(StringSnakeCaseTests.allTests),
    ]
}
#endif
