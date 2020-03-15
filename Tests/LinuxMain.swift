import XCTest

var tests = [XCTestCaseEntry]()
tests += StringCamelCaseTests.allTests()
tests += StringKebabCaseTests.allTests()
tests += StringSnakeCaseTests.allTests()
XCTMain(tests)
