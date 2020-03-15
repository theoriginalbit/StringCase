import Foundation

// MARK: - Format

public enum StringCaseFormat {
    // MARK: Kebab Case Format

    public enum KebabCase {
        /// Convert from "My Key ID" to "my-key-id"
        case lower

        /// Convert from "My Key ID" to "MY-KEY-ID"
        case upper

        /// Convert from "My Key ID" to "My-Key-Id"
        case capitalized

        /// Convert from "My Key ID" to "My-Key-ID"
        case preserveCaps
    }

    // MARK: Snake Case Format

    /// Formatting options for camel case
    public enum SnakeCase {
        /// Convert from "My Key ID" to "my_key_id"
        case lower

        /// Convert from "My Key ID" to "MY_KEY_ID"
        case upper

        /// Convert from "My Key ID" to "My_Key_Id"
        case capitalized

        /// Convert from "My Key ID" to "My_Key_ID"
        case preserveCaps
    }

    // MARK: Camel Case Format

    /// Formatting options for camel case
    ///
    /// Note that anything other than `.default` will result in unexpected output if the input string is already in the output formatting.
    public enum CamelCase {
        /// Convert from "My Key ID" to "myKeyId"
        case `default`

        /// Convert from "My Key ID" to "MyKeyId"
        ///
        /// Note: If the input string is "MyKeyId" it will result in unexpected results, capitalizing each letter coming after a capital
        /// See `StringCamelCaseTests.test_capitalizedCamelCase_alreadyCapitalizedCamelCase`
        case capitalized

        /// Convert from "My Key ID" to "MyKeyID"
        ///
        /// See `StringCamelCaseTests.test_preserveCapsCamelCase_alreadyPreserveCapsCamelCase`
        case preserveCaps

        // Alternative names

        public static let lowerCamel: CamelCase = .default
        public static let dromedary: CamelCase = .default
        public static let upperCamel: CamelCase = .capitalized
        public static let pascal: CamelCase = .capitalized
        public static let humpBack: CamelCase = .capitalized
    }
}

public extension String {
    func camelCase(_ format: StringCaseFormat.CamelCase = .default) -> String {
        let tokens = tokenize()
        switch format {
        case .default:
            guard let first = tokens.first else {
                return tokens.joined()
            }
            return first.lowercased() + tokens.dropFirst().map { $0.capitalized }.joined()
        case .capitalized:
            return tokens.map { $0.capitalized }.joined()
        case .preserveCaps:
            guard let first = tokens.first else {
                return tokens.joined()
            }
            // if the first word is all caps we shouldn't change the first character to lowercase since it is probably an acronym
            if first == first.uppercased() {
                return tokens.map { $0.firstUppercased() }.joined()
            }
            return first.firstLowercased() + tokens.dropFirst().map { $0.firstUppercased() }.joined()
        }
    }

    func snakeCase(_ format: StringCaseFormat.SnakeCase = .lower) -> String {
        let tokens = tokenize()
        switch format {
        case .lower:
            return tokens.map { $0.lowercased() }.joined(separator: "_")
        case .upper:
            return tokens.map { $0.uppercased() }.joined(separator: "_")
        case .capitalized:
            return tokens.map { $0.capitalized }.joined(separator: "_")
        case .preserveCaps:
            return tokens.joined(separator: "_")
        }
    }

    func kebabCase(_ format: StringCaseFormat.KebabCase = .lower) -> String {
        let tokens = tokenize()
        switch format {
        case .lower:
            return tokens.map { $0.lowercased() }.joined(separator: "-")
        case .upper:
            return tokens.map { $0.uppercased() }.joined(separator: "-")
        case .capitalized:
            return tokens.map { $0.capitalized }.joined(separator: "-")
        case .preserveCaps:
            return tokens.joined(separator: "-")
        }
    }

    // MARK: - CamelCase helpers

    /// Preserves existing case and only lowercase the first character
    private func firstLowercased() -> String {
        return prefix(1).lowercased() + dropFirst()
    }

    /// Preserves existing case and only uppercase the first character
    private func firstUppercased() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    // MARK: - Where all the magic happens

    private func tokenize() -> [String] {
        var res: [String] = []
        let trim = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let alphanumerics = CharacterSet.alphanumerics
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let lowercaseLetters = CharacterSet.lowercaseLetters
        trim.split(separator: " ").forEach { str in
            var previousCase = 0
            var currentCase = 0
            var caseChange = false
            var scalars = UnicodeScalarView()
            for scalar in str.unicodeScalars {
                if alphanumerics.contains(scalar) {
                    if uppercaseLetters.contains(scalar) {
                        currentCase = 1
                    } else if lowercaseLetters.contains(scalar) {
                        currentCase = 2
                    } else {
                        currentCase = 0
                    }
                    let letterInWord = scalars.count
                    if !caseChange, letterInWord > 0 {
                        if currentCase != previousCase {
                            if previousCase == 1 {
                                if letterInWord > 1 {
                                    caseChange = true
                                }
                            } else {
                                caseChange = true
                            }
                        }
                    }
                    if caseChange {
                        res.append(String(scalars))
                        scalars.removeAll()
                    }
                    scalars.append(scalar)
                    caseChange = false
                    previousCase = currentCase
                } else {
                    caseChange = true
                }
            }
            if !scalars.isEmpty {
                res.append(String(scalars))
            }
        }
        return res
    }
}
