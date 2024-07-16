import Foundation

public extension String {
  /// JS's `.split()`
  ///
  /// Shorthand for native Swift's `split(separator: "...")`
  func split(_ separator: Character) -> [String] {
    return split(separator: separator, omittingEmptySubsequences: false).map(String.init)
  }

  /// JS's `.split()`
  ///
  /// Shorthand for native Swift's `components(separatedBy: "...")`
  func split(_ delimiter: String) -> [String] {
    return components(separatedBy: delimiter)
  }
}
