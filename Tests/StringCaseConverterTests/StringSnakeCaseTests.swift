@testable import StringCaseConverter
import XCTest

class StringSnakeCaseTests: XCTestCase {
    // MARK: - Default / Lowercase

    func test_snakeCase() {
        XCTAssertEqual("i love swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_withUnderscores() {
        XCTAssertEqual("i_love swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_alreadySnakeCase() {
        XCTAssertEqual("i_love_swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".snakeCase(), "i_lov_3_swift")
    }

    func test_snakeCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".snakeCase(), "i_love_swift")
    }

    func test_snakeCase_fromKebabCase() {
        XCTAssertEqual("i-love-swift".snakeCase(), "i_love_swift")
    }

    // MARK: - Uppercase

    func test_upperSnakeCase() {
        XCTAssertEqual("i love swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_withUnderscores() {
        XCTAssertEqual("i_love swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_alreadyUpperSnakeCase() {
        XCTAssertEqual("I_LOVE_SWIFT".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".snakeCase(.upper), "I_LOV_3_SWIFT")
    }

    func test_upperSnakeCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    func test_upperSnakeCase_fromKebabCase() {
        XCTAssertEqual("i-love-swift".snakeCase(.upper), "I_LOVE_SWIFT")
    }

    // MARK: - Capitalize

    func test_capitalizedSnakeCase() {
        XCTAssertEqual("i love swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_withUnderscores() {
        XCTAssertEqual("i_love swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_alreadyCapitalizedSnakeCase() {
        XCTAssertEqual("I_Love_Swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".snakeCase(.capitalized), "I_Lov_3_Swift")
    }

    func test_capitalizedSnakeCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".snakeCase(.capitalized), "I_Love_Swift")
    }

    func test_capitalizedSnakeCase_fromKebabCase() {
        XCTAssertEqual("i-love-swift".snakeCase(.capitalized), "I_Love_Swift")
    }

    // MARK: - Preserve Caps

    func test_preserveCapsSnakeCase() {
        XCTAssertEqual("i love Swift".snakeCase(.preserveCaps), "i_love_Swift")
    }

    func test_preserveCapsSnakeCase_withOuterPadding() {
        XCTAssertEqual("  i love Swift".snakeCase(.preserveCaps), "i_love_Swift")
    }

    func test_preserveCapsSnakeCase_withInnerPadding() {
        XCTAssertEqual("i LOVE    swift".snakeCase(.preserveCaps), "i_LOVE_swift")
    }

    func test_preserveCapsSnakeCase_withUnderscores() {
        XCTAssertEqual("i_love Swift".snakeCase(.preserveCaps), "i_love_Swift")
    }

    func test_preserveCapsSnakeCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".snakeCase(.preserveCaps), "i_love_swift")
    }

    func test_preserveCapsSnakeCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".snakeCase(.preserveCaps), "i_lov_3_swift")
    }

    func test_preserveCapsSnakeCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".snakeCase(.preserveCaps), "i_LOVE_swift")
    }

    func test_preserveCapsSnakeCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".snakeCase(.preserveCaps), "i_Love_Swift")
    }

    func test_preserveCapsSnakeCase_fromKebabCase() {
        XCTAssertEqual("i-LOVE-swift".snakeCase(.preserveCaps), "i_LOVE_swift")
    }

    // MARK: - Swift Package Tests are annoying

    static var allTests = [
        ("test_snakeCase", test_snakeCase),
        ("test_snakeCase_withOuterPadding", test_snakeCase_withOuterPadding),
        ("test_snakeCase_withInnerPadding", test_snakeCase_withInnerPadding),
        ("test_snakeCase_withUnderscores", test_snakeCase_withUnderscores),
        ("test_snakeCase_alreadySnakeCase", test_snakeCase_alreadySnakeCase),
        ("test_snakeCase_withUnsupportedSymbols", test_snakeCase_withUnsupportedSymbols),
        ("test_snakeCase_withNumbers", test_snakeCase_withNumbers),
        ("test_snakeCase_withAllCaps", test_snakeCase_withAllCaps),
        ("test_snakeCase_fromCamelCase", test_snakeCase_fromCamelCase),
        ("test_snakeCase_fromKebabCase", test_snakeCase_fromKebabCase),
        ("test_capitalizedSnakeCase", test_capitalizedSnakeCase),
        ("test_capitalizedSnakeCase_withOuterPadding", test_capitalizedSnakeCase_withOuterPadding),
        ("test_capitalizedSnakeCase_withInnerPadding", test_capitalizedSnakeCase_withInnerPadding),
        ("test_capitalizedSnakeCase_withUnderscores", test_capitalizedSnakeCase_withUnderscores),
        ("test_capitalizedSnakeCase_alreadyCapitalizedSnakeCase", test_capitalizedSnakeCase_alreadyCapitalizedSnakeCase),
        ("test_capitalizedSnakeCase_withUnsupportedSymbols", test_capitalizedSnakeCase_withUnsupportedSymbols),
        ("test_capitalizedSnakeCase_withNumbers", test_capitalizedSnakeCase_withNumbers),
        ("test_capitalizedSnakeCase_withAllCaps", test_capitalizedSnakeCase_withAllCaps),
        ("test_capitalizedSnakeCase_fromCamelCase", test_capitalizedSnakeCase_fromCamelCase),
        ("test_capitalizedSnakeCase_fromKebabCase", test_capitalizedSnakeCase_fromKebabCase),
        ("test_preserveCapsSnakeCase", test_preserveCapsSnakeCase),
        ("test_preserveCapsSnakeCase_withOuterPadding", test_preserveCapsSnakeCase_withOuterPadding),
        ("test_preserveCapsSnakeCase_withInnerPadding", test_preserveCapsSnakeCase_withInnerPadding),
        ("test_preserveCapsSnakeCase_withUnderscores", test_preserveCapsSnakeCase_withUnderscores),
        ("test_preserveCapsSnakeCase_withUnsupportedSymbols", test_preserveCapsSnakeCase_withUnsupportedSymbols),
        ("test_preserveCapsSnakeCase_withNumbers", test_preserveCapsSnakeCase_withNumbers),
        ("test_preserveCapsSnakeCase_withAllCaps", test_preserveCapsSnakeCase_withAllCaps),
        ("test_preserveCapsSnakeCase_fromCamelCase", test_preserveCapsSnakeCase_fromCamelCase),
        ("test_preserveCapsSnakeCase_fromKebabCase", test_preserveCapsSnakeCase_fromKebabCase),
    ]
}
