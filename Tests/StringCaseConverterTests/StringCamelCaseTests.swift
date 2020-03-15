@testable import StringCaseConverter
import XCTest

class StringCamelCaseTests: XCTestCase {
    // MARK: - Default / Lowercase

    func test_camelCase() {
        XCTAssertEqual("i love swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_withUnderscores() {
        XCTAssertEqual("i_love swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_alreadyCamelCase() {
        XCTAssertEqual("iLoveSwift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".camelCase(), "iLov3Swift")
    }

    func test_camelCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_fromSnakeCase() {
        XCTAssertEqual("i_love_swift".camelCase(), "iLoveSwift")
    }

    func test_camelCase_fromKebabCase() {
        XCTAssertEqual("i-love-swift".camelCase(), "iLoveSwift")
    }

    // MARK: - Capitalized

    func test_capitalizedCamelCase() {
        XCTAssertEqual("i love swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_withUnderscores() {
        XCTAssertEqual("i_love swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_alreadyCapitalizedCamelCase() {
        // Not what we would want, but a by-product of the way we achieve tokenization
        XCTAssertEqual("ILoveSwift".camelCase(.capitalized), "IlOveSwift")
    }

    func test_capitalizedCamelCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".camelCase(.capitalized), "ILov3Swift")
    }

    func test_capitalizedCamelCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_fromSnakeCase() {
        XCTAssertEqual("i_love_swift".camelCase(.capitalized), "ILoveSwift")
    }

    func test_capitalizedCamelCase_fromKebabCase() {
        XCTAssertEqual("i-love-swift".camelCase(.capitalized), "ILoveSwift")
    }

    // MARK: - Preserve Caps

    func test_preserveCapsCamelCase() {
        XCTAssertEqual("i love swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    func test_preserveCapsCamelCase_withOuterPadding() {
        XCTAssertEqual("  i love swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    func test_preserveCapsCamelCase_withInnerPadding() {
        XCTAssertEqual("i love    swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    func test_preserveCapsCamelCase_withUnderscores() {
        XCTAssertEqual("i_love swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    func test_preserveCapsCamelCase_withUnsupportedSymbols() {
        XCTAssertEqual("i love.swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    func test_preserveCapsCamelCase_withNumbers() {
        XCTAssertEqual("i lov3 swift".camelCase(.preserveCaps), "iLov3Swift")
    }

    func test_preserveCapsCamelCase_withAllCaps() {
        XCTAssertEqual("i LOVE swift".camelCase(.preserveCaps), "iLOVESwift")
    }

    func test_preserveCapsCamelCase_withAllCapsAtStart() {
        XCTAssertEqual("SWIFT loves Me".camelCase(.preserveCaps), "SWIFTLovesMe")
    }

    func test_preserveCapsCamelCase_fromSnakeCase() {
        XCTAssertEqual("i_love_swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    func test_preserveCapsCamelCase_fromKebabCase() {
        XCTAssertEqual("i-love-swift".camelCase(.preserveCaps), "iLoveSwift")
    }

    // MARK: - Swift Package Tests are annoying

    static var allTests = [
        ("test_camelCase", test_camelCase),
        ("test_camelCase_withOuterPadding", test_camelCase_withOuterPadding),
        ("test_camelCase_withInnerPadding", test_camelCase_withInnerPadding),
        ("test_camelCase_withUnderscores", test_camelCase_withUnderscores),
        ("test_camelCase_alreadyCamelCase", test_camelCase_alreadyCamelCase),
        ("test_camelCase_withUnsupportedSymbols", test_camelCase_withUnsupportedSymbols),
        ("test_camelCase_withNumbers", test_camelCase_withNumbers),
        ("test_camelCase_withAllCaps", test_camelCase_withAllCaps),
        ("test_camelCase_fromSnakeCase", test_camelCase_fromSnakeCase),
        ("test_camelCase_fromKebabCase", test_camelCase_fromKebabCase),
        ("test_capitalizedCamelCase", test_capitalizedCamelCase),
        ("test_capitalizedCamelCase_withOuterPadding", test_capitalizedCamelCase_withOuterPadding),
        ("test_capitalizedCamelCase_withInnerPadding", test_capitalizedCamelCase_withInnerPadding),
        ("test_capitalizedCamelCase_withUnderscores", test_capitalizedCamelCase_withUnderscores),
        ("test_capitalizedCamelCase_alreadyCapitalizedCamelCase", test_capitalizedCamelCase_alreadyCapitalizedCamelCase),
        ("test_capitalizedCamelCase_withUnsupportedSymbols", test_capitalizedCamelCase_withUnsupportedSymbols),
        ("test_capitalizedCamelCase_withNumbers", test_capitalizedCamelCase_withNumbers),
        ("test_capitalizedCamelCase_withAllCaps", test_capitalizedCamelCase_withAllCaps),
        ("test_capitalizedCamelCase_fromSnakeCase", test_capitalizedCamelCase_fromSnakeCase),
        ("test_capitalizedCamelCase_fromKebabCase", test_capitalizedCamelCase_fromKebabCase),
        ("test_preserveCapsCamelCase", test_preserveCapsCamelCase),
        ("test_preserveCapsCamelCase_withOuterPadding", test_preserveCapsCamelCase_withOuterPadding),
        ("test_preserveCapsCamelCase_withInnerPadding", test_preserveCapsCamelCase_withInnerPadding),
        ("test_preserveCapsCamelCase_withUnderscores", test_preserveCapsCamelCase_withUnderscores),
        ("test_preserveCapsCamelCase_withUnsupportedSymbols", test_preserveCapsCamelCase_withUnsupportedSymbols),
        ("test_preserveCapsCamelCase_withNumbers", test_preserveCapsCamelCase_withNumbers),
        ("test_preserveCapsCamelCase_withAllCaps", test_preserveCapsCamelCase_withAllCaps),
        ("test_preserveCapsCamelCase_withAllCapsAtStart", test_preserveCapsCamelCase_withAllCapsAtStart),
        ("test_preserveCapsCamelCase_fromSnakeCase", test_preserveCapsCamelCase_fromSnakeCase),
        ("test_preserveCapsCamelCase_fromKebabCase", test_preserveCapsCamelCase_fromKebabCase),
    ]
}
