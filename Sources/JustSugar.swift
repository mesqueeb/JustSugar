import Foundation

public extension Array {
  /// JS's `.at()`
  func at(_ index: Int) -> Element? {
    // Check for negative indices
    let effectiveIndex = index >= 0 ? index : count + index

    // Return nil if index is out of range
    guard effectiveIndex >= 0, effectiveIndex < count else {
      return nil
    }

    return self[effectiveIndex]
  }

  /// JS's `.slice()`
  func slice(_ start: Int, _ end: Int? = nil) -> [Element] {
    let startIndex = start >= 0 ? start : count + start
    let endIndex = end ?? count
    let adjustedEndIndex = endIndex >= 0 ? endIndex : count + endIndex

    guard startIndex < adjustedEndIndex, startIndex >= 0, adjustedEndIndex <= count else {
      return []
    }

    return Array(self[startIndex ..< adjustedEndIndex])
  }

  /// Use to be able to casually destructure arrays like you can with JS
  func destructure() -> (Element?, Element?) {
    guard count >= 2 else {
      return (nil, nil)
    }
    return (self[0], self[1])
  }
}

public extension Array where Element == String {
  /// JS's `.join()`
  func join(_ separator: String) -> String {
    return joined(separator: separator)
  }
}

public extension String {
  /// JS's `.split()`
  func split(_ separator: Character) -> [String] {
    return split(separator: separator, omittingEmptySubsequences: false).map(String.init)
  }

  /// JS's `.split()`
  func split(_ delimiter: String) -> [String] {
    return components(separatedBy: delimiter)
  }
}
