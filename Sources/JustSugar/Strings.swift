import Foundation

extension String {
  /// Allows access like `str[1 ..< 3]`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/subscript(_:)-2so14](https://developer.apple.com/documentation/swift/string/subscript(_:)-2so14)
  @inlinable public subscript(r: Range<Int>) -> String {
    let range = Range(
      uncheckedBounds: (
        lower: max(0, min(count, r.lowerBound)), upper: min(count, max(0, r.upperBound))
      )
    )
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.count)
    return String(self[start ..< end])
  }

  /// Allows access like `str[1]`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/subscript(_:)-2so14](https://developer.apple.com/documentation/swift/string/subscript(_:)-2so14)
  @inlinable public subscript(i: Int) -> String { return self[i ..< i + 1] }

  /// JS's `.at()`
  ///
  /// There's no good viable replacement in Swift. Use this for convenience.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/subscript(_:)-2so14](https://developer.apple.com/documentation/swift/string/subscript(_:)-2so14)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/at](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/at)
  @inlinable public func at(_ index: Int) -> String? {
    // Convert negative to positive index
    let i = index >= 0 ? index : count + index
    // Return nil if index is out of range
    guard i >= 0, i < count else { return nil }
    return self[i]
  }

  /// JS's `.endsWith()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/hassuffix(_:)](https://developer.apple.com/documentation/swift/string/hassuffix(_:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith)
  @available(*, deprecated, message: "Use native Swift's `.hasSuffix(...)` instead") @inlinable
  public func endsWith(_ characters: String) -> Bool { return hasSuffix(characters) }

  /// JS's `.includes()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/contains(_:)](https://developer.apple.com/documentation/swift/string/contains(_:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes)
  @available(*, deprecated, message: "Use native Swift's `.contains(...)` instead") @inlinable
  public func includes(_ characters: String) -> Bool { return contains(characters) }

  /// JS's `.indexOf()`
  ///
  /// Shorthand for native Swift's `range(of: string)?.lowerBound.utf16Offset(in: self) ?? -1`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/stringprotocol/range(of:options:range:locale:)](https://developer.apple.com/documentation/swift/stringprotocol/range(of:options:range:locale:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf)
  @inlinable public func indexOf(_ characters: String) -> Int {
    if characters == "" { return 0 }
    return range(of: characters)?.lowerBound.utf16Offset(in: self) ?? -1
  }

  /// JS's `.lastIndexOf()`
  ///
  /// Shorthand for native Swift's `range(of: string, options: .backwards)?.lowerBound.utf16Offset(in: self) ?? -1`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/stringprotocol/range(of:options:range:locale:)](https://developer.apple.com/documentation/swift/stringprotocol/range(of:options:range:locale:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf)
  @inlinable public func lastIndexOf(_ characters: String) -> Int {
    if characters == "" { return count }
    return range(of: characters, options: .backwards)?.lowerBound.utf16Offset(in: self) ?? -1
  }

  /// JS's `.length`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/count](https://developer.apple.com/documentation/swift/string/count)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length)
  @available(*, deprecated, message: "Use native Swift's `.count` instead") @inlinable public
    var length: Int
  { return count }

  /// JS's `.padEnd()`
  ///
  /// Pad a string at the end.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/init(repeating:count:)-23xjt](https://developer.apple.com/documentation/swift/string/init(repeating:count:)-23xjt)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd)
  @inlinable public func padEnd(_ count: Int, _ characters: String) -> String {
    let paddingCount = count - self.count
    guard paddingCount > 0 else { return self }
    let repeatedString = String(
      repeating: characters,
      count: (paddingCount + characters.count - 1) / characters.count
    )
    return self + repeatedString.prefix(paddingCount)
  }

  /// JS's `.padStart()`
  ///
  /// Pad a string at the start.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/init(repeating:count:)-23xjt](https://developer.apple.com/documentation/swift/string/init(repeating:count:)-23xjt)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart)
  @inlinable public func padStart(_ count: Int, _ characters: String) -> String {
    let paddingCount = count - self.count
    guard paddingCount > 0 else { return self }
    let repeatedString = String(
      repeating: characters,
      count: (paddingCount + characters.count - 1) / characters.count
    )
    return repeatedString.prefix(paddingCount) + self
  }

  /// JS's `.repeat()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/init(repeating:count:)-23xjt](https://developer.apple.com/documentation/swift/string/init(repeating:count:)-23xjt)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat)
  @available(
    *,
    deprecated,
    message: "Use native Swift's `String(repeating: ..., count: ...)` instead"
  ) @inlinable public func repeatJs(_ count: Int) -> String {
    guard count > 0 else { return "" }
    return String(repeating: self, count: count)
  }

  /// JS's `.replace()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/rangereplaceablecollection/replacing(_:with:maxreplacements:)-1tg5u](https://developer.apple.com/documentation/swift/rangereplaceablecollection/replacing(_:with:maxreplacements:)-1tg5u)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
  @available(
    *,
    deprecated,
    message: "Use native Swift's `.replacing(..., with: ..., maxReplacements: 1)` instead"
  ) @inlinable public func replace(_ characters: String, _ with: String) -> String {
    return replacing(characters, with: with, maxReplacements: 1)
  }

  /// JS's `.replaceAll()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/rangereplaceablecollection/replacing(_:with:maxreplacements:)-1tg5u](https://developer.apple.com/documentation/swift/rangereplaceablecollection/replacing(_:with:maxreplacements:)-1tg5u)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll)
  @available(*, deprecated, message: "Use native Swift's `.replacing(..., with: ...)` instead")
  @inlinable public func replaceAll(_ characters: String, _ with: String) -> String {
    return replacing(characters, with: with)
  }

  /// JS's `.slice()`
  ///
  /// There's no good viable replacement in Swift. Use this for convenience.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/subscript(_:)-2so14](https://developer.apple.com/documentation/swift/string/subscript(_:)-2so14)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)
  @inlinable public func slice(_ start: Int, _ end: Int? = nil) -> String {
    // Convert negative to positive index
    let startIndex = start >= 0 ? start : count + start
    let endIndex = end ?? count
    // Convert negative to positive index
    let adjustedEndIndex = endIndex >= 0 ? endIndex : count + endIndex
    // Return "" if index is out of range
    guard startIndex < adjustedEndIndex, startIndex >= 0, adjustedEndIndex <= count else {
      return ""
    }
    return String(self[startIndex ..< adjustedEndIndex])
  }

  /// JS's `.split()`
  ///
  /// Shorthand for native Swift's `split(separator: "...")`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/split(separator:maxsplits:omittingemptysubsequences:)](https://developer.apple.com/documentation/swift/string/split(separator:maxsplits:omittingemptysubsequences:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)
  @inlinable public func split(_ separator: Character) -> [String] {
    return split(separator: separator, omittingEmptySubsequences: false).map(String.init)
  }

  /// JS's `.split()`
  ///
  /// Shorthand for native Swift's `components(separatedBy: "...")`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/stringprotocol/components(separatedby:)-8gl9t](https://developer.apple.com/documentation/swift/stringprotocol/components(separatedby:)-8gl9t)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)
  @inlinable public func split(_ delimiter: String) -> [String] {
    return components(separatedBy: delimiter)
  }

  /// JS's `.startsWith()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/hasprefix(_:)](https://developer.apple.com/documentation/swift/string/hasprefix(_:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith)
  @available(*, deprecated, message: "Use native Swift's `.hasPrefix(...)` instead") @inlinable
  public func startsWith(_ characters: String) -> Bool { return hasPrefix(characters) }

  /// JS's `.toLowerCase()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/lowercased()](https://developer.apple.com/documentation/swift/string/lowercased())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase)
  @available(*, deprecated, message: "Use native Swift's `.lowercased` instead") @inlinable
  public func toLowerCase() -> String { return lowercased() }

  /// JS's `.toUpperCase()`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/string/uppercased()](https://developer.apple.com/documentation/swift/string/uppercased())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase)
  @available(*, deprecated, message: "Use native Swift's `.uppercased` instead") @inlinable
  public func toUpperCase() -> String { return uppercased() }

  /// JS's `.trim()`
  ///
  /// Shorthand for native Swift's `trimmingCharacters(in: .whitespacesAndNewlines)`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:)](https://developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim)
  @inlinable public func trim() -> String { return trimmingCharacters(in: .whitespacesAndNewlines) }

  /// JS's `.trimEnd()`
  ///
  /// Shorthand to trim the end of a string.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:)](https://developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd)
  @inlinable public func trimEnd() -> String {
    let characterSet = CharacterSet.whitespacesAndNewlines
    if let range = rangeOfCharacter(from: characterSet.inverted, options: .backwards) {
      return String(self[..<range.upperBound])
    }
    return ""
  }

  /// JS's `.trimStart()`
  ///
  /// Shorthand to trim the beginning of a string.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:)](https://developer.apple.com/documentation/swift/stringprotocol/trimmingcharacters(in:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart)
  @inlinable public func trimStart() -> String {
    let characterSet = CharacterSet.whitespacesAndNewlines
    if let range = rangeOfCharacter(from: characterSet.inverted) {
      return String(self[range.lowerBound...])
    }
    return ""
  }
}
