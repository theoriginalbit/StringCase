@testable import StringCaseConverter
import XCTest

class StringKebabCaseTests: XCTestCase {
    // MARK: - Default / Lowercase

    func test_kebabCase() {
        XCTAssertEqual("i love swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_withUnderscores() {
        XCTAssertEqual("i_love swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_alreadyKebabCase() {
        XCTAssertEqual("i-love-swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".kebabCase(), "i-lov-3-swift")
    }

    func test_kebabCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".kebabCase(), "i-love-swift")
    }

    func test_kebabCase_fromSnakeCase() {
        XCTAssertEqual("i_love_swift".kebabCase(), "i-love-swift")
    }

    // MARK: - Uppercase

    func test_upperKebabCase() {
        XCTAssertEqual("i love swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_withUnderscores() {
        XCTAssertEqual("i_love swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_alreadyUpperKebabCase() {
        XCTAssertEqual("I_LOVE_SWIFT".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".kebabCase(.upper), "I-LOV-3-SWIFT")
    }

    func test_upperKebabCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    func test_upperKebabCase_fromSnakeCase() {
        XCTAssertEqual("i_love_swift".kebabCase(.upper), "I-LOVE-SWIFT")
    }

    // MARK: - Capitalize

    func test_capitalizedKebabCase() {
        XCTAssertEqual("i love swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_withUnderscores() {
        XCTAssertEqual("i_love swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_alreadyCapitalizedKebabCase() {
        XCTAssertEqual("I_Love_Swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".kebabCase(.capitalized), "I-Lov-3-Swift")
    }

    func test_capitalizedKebabCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".kebabCase(.capitalized), "I-Love-Swift")
    }

    func test_capitalizedKebabCase_fromSnakeCase() {
        XCTAssertEqual("i_love_Swift".kebabCase(.capitalized), "I-Love-Swift")
    }

    // MARK: - Preserve Caps

    func test_preserveCapsKebabCase() {
        XCTAssertEqual("i love swift".kebabCase(.preserveCaps), "i-love-swift")
    }

    func test_preserveCapsKebabCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".kebabCase(.preserveCaps), "i-love-swift")
    }

    func test_preserveCapsKebabCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".kebabCase(.preserveCaps), "i-love-swift")
    }

    func test_preserveCapsKebabCase_withUnderscores() {
        XCTAssertEqual("i_love swift".kebabCase(.preserveCaps), "i-love-swift")
    }

    func test_preserveCapsKebabCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".kebabCase(.preserveCaps), "i-love-swift")
    }

    func test_preserveCapsKebabCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".kebabCase(.preserveCaps), "i-lov-3-swift")
    }

    func test_preserveCapsKebabCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".kebabCase(.preserveCaps), "i-LOVE-swift")
    }

    func test_preserveCapsKebabCase_fromCamelCase() {
        XCTAssertEqual("iLoveSwift".kebabCase(.preserveCaps), "i-Love-Swift")
    }

    func test_preserveCapsKebabCase_fromSnakeCase() {
        XCTAssertEqual("i_love_Swift".kebabCase(.preserveCaps), "i-love-Swift")
    }

    // MARK: - Swift Package Tests are annoying

    static var allTests = [
        ("test_kebabCase", test_kebabCase),
        ("test_kebabCase_withOuterPadding", test_kebabCase_withOuterPadding),
        ("test_kebabCase_withInnerPadding", test_kebabCase_withInnerPadding),
        ("test_kebabCase_withUnderscores", test_kebabCase_withUnderscores),
        ("test_kebabCase_alreadyKebabCase", test_kebabCase_alreadyKebabCase),
        ("test_kebabCase_withUnsupportedSymbols", test_kebabCase_withUnsupportedSymbols),
        ("test_kebabCase_withNumbers", test_kebabCase_withNumbers),
        ("test_kebabCase_withAllCaps", test_kebabCase_withAllCaps),
        ("test_kebabCase_fromCamelCase", test_kebabCase_fromCamelCase),
        ("test_kebabCase_fromSnakeCase", test_kebabCase_fromSnakeCase),
        ("test_capitalizedKebabCase", test_capitalizedKebabCase),
        ("test_capitalizedKebabCase_withOuterPadding", test_capitalizedKebabCase_withOuterPadding),
        ("test_capitalizedKebabCase_withInnerPadding", test_capitalizedKebabCase_withInnerPadding),
        ("test_capitalizedKebabCase_withUnderscores", test_capitalizedKebabCase_withUnderscores),
        ("test_capitalizedKebabCase_alreadyCapitalizedKebabCase", test_capitalizedKebabCase_alreadyCapitalizedKebabCase),
        ("test_capitalizedKebabCase_withUnsupportedSymbols", test_capitalizedKebabCase_withUnsupportedSymbols),
        ("test_capitalizedKebabCase_withNumbers", test_capitalizedKebabCase_withNumbers),
        ("test_capitalizedKebabCase_withAllCaps", test_capitalizedKebabCase_withAllCaps),
        ("test_capitalizedKebabCase_fromCamelCase", test_capitalizedKebabCase_fromCamelCase),
        ("test_capitalizedKebabCase_fromSnakeCase", test_capitalizedKebabCase_fromSnakeCase),
        ("test_preserveCapsKebabCase", test_preserveCapsKebabCase),
        ("test_preserveCapsKebabCase_withOuterPadding", test_preserveCapsKebabCase_withOuterPadding),
        ("test_preserveCapsKebabCase_withInnerPadding", test_preserveCapsKebabCase_withInnerPadding),
        ("test_preserveCapsKebabCase_withUnderscores", test_preserveCapsKebabCase_withUnderscores),
        ("test_preserveCapsKebabCase_withUnsupportedSymbols", test_preserveCapsKebabCase_withUnsupportedSymbols),
        ("test_preserveCapsKebabCase_withNumbers", test_preserveCapsKebabCase_withNumbers),
        ("test_preserveCapsKebabCase_withAllCaps", test_preserveCapsKebabCase_withAllCaps),
        ("test_preserveCapsKebabCase_fromCamelCase", test_preserveCapsKebabCase_fromCamelCase),
        ("test_preserveCapsKebabCase_fromSnakeCase", test_preserveCapsKebabCase_fromSnakeCase),
    ]
}
