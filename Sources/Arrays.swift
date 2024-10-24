import Foundation

extension Array {
  /// JS's `.at()`
  ///
  /// There's no good viable replacement in Swift. Use this for convenience.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/subscript(_:)-25iat](https://developer.apple.com/documentation/swift/array/subscript(_:)-25iat)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at)
  @inlinable public func at(_ index: Int) -> Element? {
    // Convert negative to positive index
    let i = index >= 0 ? index : count + index
    // Return nil if index is out of range
    guard i >= 0, i < count else { return nil }
    return self[i]
  }

  /// JS's `.concat`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/+(_:_:)-6h58k](https://developer.apple.com/documentation/swift/array/+(_:_:)-6h58k)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)
  @available(*, deprecated, message: "Use native Swift's `arr1 + arr2` instead") @inlinable
  public func concat(_ array: [Element]) -> [Element] { return self + array }

  /// JS's `.entries`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/enumerated()](https://developer.apple.com/documentation/swift/array/enumerated())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/entries](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/entries)
  @available(*, deprecated, message: "Use native Swift's `.enumerated()` instead") @inlinable
  public func entries() -> EnumeratedSequence<[Element]> { return self.enumerated() }

  /// JS's `.every`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/allSatisfy(_:)](https://developer.apple.com/documentation/swift/array/allSatisfy(_:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every)
  @available(*, deprecated, message: "Use native Swift's `.allSatisfy { $0 == ... }` instead")
  @inlinable public func every(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    return try self.allSatisfy(predicate)
  }

  /// JS's `.fill`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/rangereplaceablecollection/replacesubrange(_:with:)-6x76a](https://developer.apple.com/documentation/swift/rangereplaceablecollection/replacesubrange(_:with:)-6x76a)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill)
  // swift-format-ignore
  @available(*, deprecated, message: "Use native Swift's `.replaceSubrange(startIndex ..< endIndex, with: repeatElement(element, count: endIndex - startIndex))`")
  @inlinable public mutating func fill(_ value: Element, _ startIndex: Int = 0, _ endIndex: Int? = nil) -> [Element] {
    let endIndex = endIndex ?? self.count
    self.replaceSubrange(startIndex ..< endIndex, with: repeatElement(value, count: endIndex - startIndex))
    return self
  }

  /// JS's `.find`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/first(where:)](https://developer.apple.com/documentation/swift/array/first(where:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)
  @available(*, deprecated, message: "Use native Swift's `.first { $0 == ... }` instead") @inlinable
  public func find(_ predicate: (Element) throws -> Bool) rethrows -> Element? {
    return try self.first(where: predicate)
  }

  /// JS's `.findIndex`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/firstindex(where:)](https://developer.apple.com/documentation/swift/array/firstindex(where:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex)
  @available(*, deprecated, message: "Use native Swift's `.firstIndex { $0 == ... }` instead")
  @inlinable public func findIndex(_ predicate: (Element) throws -> Bool) rethrows -> Int {
    return try self.firstIndex(where: predicate) ?? -1
  }

  /// JS's `.findLast`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/last(where:)](https://developer.apple.com/documentation/swift/array/last(where:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findLast](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findLast)
  @available(*, deprecated, message: "Use native Swift's `.last { $0 == ... }` instead") @inlinable
  public func findLast(_ predicate: (Element) throws -> Bool) rethrows -> Element? {
    return try self.last(where: predicate)
  }

  /// JS's `.length`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/count](https://developer.apple.com/documentation/swift/array/count)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length)
  @available(*, deprecated, message: "Use native Swift's `.count` instead") @inlinable public
    var length: Int
  { return self.count }

  /// JS's `.pop`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/poplast()](https://developer.apple.com/documentation/swift/array/poplast())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop)
  @available(*, deprecated, message: "Use native Swift's `.popLast()` instead") @inlinable
  public mutating func pop() -> Element? { return self.popLast() }

  /// JS's `.push`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/append(_:)-1ytnt](https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push)
  @available(*, deprecated, message: "Use native Swift's `.append(...)` instead") @inlinable
  public mutating func push(_ element: Element) -> Int {
    self.append(element)
    return self.count
  }

  /// JS's `.shift`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/removefirst()](https://developer.apple.com/documentation/swift/array/removefirst())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift)
  @available(*, deprecated, message: "Use native Swift's `.removeFirst()` instead") @inlinable
  public mutating func shift() -> Element? {
    if self.isEmpty { return nil }
    return self.removeFirst()
  }

  /// JS's `.slice`
  ///
  /// There's no good viable replacement in Swift. Use this for convenience.
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/subscript(_:)-53fvb](https://developer.apple.com/documentation/swift/array/subscript(_:)-53fvb)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice)
  @inlinable public func slice(_ start: Int, _ end: Int? = nil) -> [Element] {
    // Convert negative to positive index
    let startIndex = start >= 0 ? start : count + start
    let endIndex = end ?? count
    // Convert negative to positive index
    let adjustedEndIndex = endIndex >= 0 ? endIndex : count + endIndex
    // Return [] if index is out of range
    guard startIndex < adjustedEndIndex, startIndex >= 0, adjustedEndIndex <= count else {
      return []
    }
    return Array(self[startIndex ..< adjustedEndIndex])
  }

  /// JS's `.some`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/contains(where:)](https://developer.apple.com/documentation/swift/array/contains(where:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some)
  @available(*, deprecated, message: "Use native Swift's `.contains { $0 == ... }` instead")
  @inlinable public func some(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    return try self.contains(where: predicate)
  }

  /// JS's `.splice`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai](https://developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
  @available(
    *,
    deprecated,
    message: "Use native Swift's `.replaceSubrange(0..<3, with: [1, 2, 3])` instead"
  ) @inlinable public mutating func splice(
    _ start: Int,
    _ deleteCount: Int? = nil,
    _ elements: Element...
  ) -> [Element] {
    let end = if let deleteCount { start + deleteCount } else { count }
    let removedElements = self.slice(start, end)
    self.replaceSubrange(start ..< end, with: elements)
    return removedElements
  }

  /// JS's `.toSpliced`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai](https://developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSpliced](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSpliced)
  @available(
    *,
    deprecated,
    message: "Use native Swift's `.replaceSubrange(0..<3, with: [1, 2, 3])` instead"
  ) @inlinable public func toSpliced(
    _ start: Int,
    _ deleteCount: Int? = nil,
    _ elements: Element...
  ) -> [Element] {
    var newArr = self
    let end = if let deleteCount { start + deleteCount } else { count }
    newArr.replaceSubrange(start ..< end, with: elements)
    return newArr
  }

  /// JS's `.toReversed`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/reverse()](https://developer.apple.com/documentation/swift/array/reverse())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toReversed](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toReversed)
  @available(*, deprecated, message: "Use native Swift's `.reversed()` instead") @inlinable
  public func toReversed() -> [Element] { return self.reversed() }

  /// JS's `.toSorted`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/sorted(by:)](https://developer.apple.com/documentation/swift/array/sorted(by:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted)
  @available(*, deprecated, message: "Use native Swift's `.sorted(by: { $0 > $1 })` instead")
  @inlinable public func toSorted(
    _ predicate: (Element, Element) throws -> Bool
  ) rethrows -> [Element] { return try self.sorted(by: predicate) }

  /// JS's `.unshift`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/insert(_:at:)-3erb3](https://developer.apple.com/documentation/swift/array/insert(_:at:)-3erb3)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
  @available(*, deprecated, message: "Use native Swift's `.insert(..., at: 0)` instead") @inlinable
  public mutating func unshift(_ element: Element) -> Int {
    self.insert(element, at: 0)
    return self.count
  }

  /// Use to be able to casually destructure arrays like you can with JS
  ///
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/destructure](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/destructure)
  @inlinable public func destructure() -> (Element?, Element?) {
    guard count >= 2 else { return (nil, nil) }
    return (self[0], self[1])
  }
}

extension Array where Element: Comparable {
  /// JS's `.toSorted`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/sorted()](https://developer.apple.com/documentation/swift/array/sorted())
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted)
  @available(*, deprecated, message: "Use native Swift's `.sorted()` instead") @inlinable
  public func toSorted() -> [Element] { return self.sorted() }
}

extension Array where Element: Equatable {
  /// JS's `.includes`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/contains(_:)](https://developer.apple.com/documentation/swift/array/contains(_:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes)
  @available(*, deprecated, message: "Use native Swift's `.contains(...)` instead") @inlinable
  public func includes(_ element: Element) -> Bool { return self.contains(element) }

  /// JS's `.indexOf`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/firstindex(of:)](https://developer.apple.com/documentation/swift/array/firstindex(of:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf)
  @available(*, deprecated, message: "Use native Swift's `.firstIndex(of: ...)` instead") @inlinable
  public func indexOf(_ element: Element) -> Int { return self.firstIndex(of: element) ?? -1 }

  /// JS's `.lastIndexOf`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/lastindex(of:)](https://developer.apple.com/documentation/swift/array/lastindex(of:))
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf)
  @available(*, deprecated, message: "Use native Swift's `.lastIndex(of: ...)` instead") @inlinable
  public func lastIndexOf(_ element: Element) -> Int { return self.lastIndex(of: element) ?? -1 }
}

extension Array where Element == String {
  /// JS's `.join()`
  ///
  /// Shorthand for native Swift's `joined(separator: "...")`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/joined(separator:)-5do1g](https://developer.apple.com/documentation/swift/array/joined(separator:)-5do1g)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join)
  @inlinable public func join(_ separator: String) -> String { return joined(separator: separator) }
}

extension Array where Element == Int {
  /// JS's `.join()`
  ///
  /// Shorthand for native Swift's `joined(separator: "...")`
  ///
  /// - SeeAlso: Swift Docs: [developer.apple.com/documentation/swift/array/joined(separator:)-5do1g](https://developer.apple.com/documentation/swift/array/joined(separator:)-5do1g)
  /// - SeeAlso: JS Docs: [developer.apple.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join)
  @inlinable public func join(_ separator: String) -> String {
    let newArr = self.map { String($0) }
    return newArr.joined(separator: separator)
  }
}
