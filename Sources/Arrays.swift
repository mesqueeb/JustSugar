import Foundation

public extension Array {
  /// JS's `.at()`
  ///
  /// There's no good viable replacement in Swift. Use this for convenience.
  @inlinable func at(_ index: Int) -> Element? {
    // Check for negative indices
    let effectiveIndex = index >= 0 ? index : count + index

    // Return nil if index is out of range
    guard effectiveIndex >= 0, effectiveIndex < count else {
      return nil
    }

    return self[effectiveIndex]
  }

  /// JS's `.concat`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/+(_:_:)-6h58k](https://https://developer.apple.com/documentation/swift/array/+(_:_:)-6h58k)
  @available(*, deprecated, message: "Use native Swift's `arr1 + arr2` instead")
  @inlinable func concat(_ array: [Element]) -> [Element] {
    return self + array
  }

  /// JS's `.entries`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/enumerated()](https://developer.apple.com/documentation/swift/array/enumerated())
  @available(*, deprecated, message: "Use native Swift's `.enumerated()` instead")
  @inlinable func entries() -> EnumeratedSequence<[Element]> {
    return self.enumerated()
  }

  /// JS's `.every`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/allSatisfy(_:)](https://developer.apple.com/documentation/swift/array/allSatisfy(_:))
  @available(*, deprecated, message: "Use native Swift's `.allSatisfy { $0 == ... }` instead")
  @inlinable func every(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    return try self.allSatisfy(predicate)
  }

  /// JS's `.fill`
  @inlinable mutating func fill(_ element: Element) -> [Element] {
    var i = 0
    while i < self.count {
      self[i] = element
      i += 1
    }
    return self
  }

  /// JS's `.find`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/first(where:)](https://developer.apple.com/documentation/swift/array/first(where:))
  @available(*, deprecated, message: "Use native Swift's `.first { $0 == ... }` instead")
  @inlinable func find(_ predicate: (Element) throws -> Bool) rethrows -> Element? {
    return try self.first(where: predicate)
  }

  /// JS's `.findIndex`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/firstindex(where:)](https://developer.apple.com/documentation/swift/array/firstindex(where:))
  @available(*, deprecated, message: "Use native Swift's `.firstIndex { $0 == ... }` instead")
  @inlinable func findIndex(_ predicate: (Element) throws -> Bool) rethrows -> Int {
    return try self.firstIndex(where: predicate) ?? -1
  }

  /// JS's `.findLast`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/last(where:)](https://developer.apple.com/documentation/swift/array/last(where:))
  @available(*, deprecated, message: "Use native Swift's `.last { $0 == ... }` instead")
  @inlinable func findLast(_ predicate: (Element) throws -> Bool) rethrows -> Element? {
    return try self.last(where: predicate)
  }

  /// JS's `.length`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/count](https://developer.apple.com/documentation/swift/array/count)
  @available(*, deprecated, message: "Use native Swift's `.count` instead")
  var length: Int {
    return self.count
  }

  /// JS's `.pop`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/poplast()](https://developer.apple.com/documentation/swift/array/poplast())
  @available(*, deprecated, message: "Use native Swift's `.popLast()` instead")
  @inlinable mutating func pop() -> Element? {
    return self.popLast()
  }

  /// JS's `.push`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/append(_:)-1ytnt](https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt)
  @available(*, deprecated, message: "Use native Swift's `.append(...)` instead")
  @inlinable mutating func push(_ element: Element) -> Int {
    self.append(element)
    return self.count
  }

  /// JS's `.shift`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/removefirst()](https://developer.apple.com/documentation/swift/array/removefirst())
  @available(*, deprecated, message: "Use native Swift's `.removeFirst()` instead")
  @inlinable mutating func shift() -> Element? {
    if self.isEmpty { return nil }
    return self.removeFirst()
  }

  /// JS's `.slice`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/subscript(_:)-53fvb](https://developer.apple.com/documentation/swift/array/subscript(_:)-53fvb)
  ///
  /// There's no good viable replacement in Swift. Use this for convenience.
  @inlinable func slice(_ start: Int, _ end: Int? = nil) -> [Element] {
    let startIndex = start >= 0 ? start : count + start
    let endIndex = end ?? count
    let adjustedEndIndex = endIndex >= 0 ? endIndex : count + endIndex

    guard startIndex < adjustedEndIndex, startIndex >= 0, adjustedEndIndex <= count else {
      return []
    }

    return Array(self[startIndex ..< adjustedEndIndex])
  }

  /// JS's `.some`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/contains(where:)](https://developer.apple.com/documentation/swift/array/contains(where:))
  ///
  @available(*, deprecated, message: "Use native Swift's `.contains { $0 == ... }` instead")
  @inlinable func some(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    return try self.contains(where: predicate)
  }

  /// JS's `.splice`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai](https://developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai)
  @available(*, deprecated, message: "Use native Swift's `.replaceSubrange(0..<3, with: [1, 2, 3])` instead")
  @inlinable mutating func splice(_ start: Int, _ deleteCount: Int? = nil, _ elements: Element...) -> [Element] {
    let end = if let deleteCount { start + deleteCount } else { count }
    let removedElements = self.slice(start, end)
    self.replaceSubrange(start ..< end, with: elements)
    return removedElements
  }

  /// JS's `.toSpliced`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai](https://developer.apple.com/documentation/swift/array/replacesubrange(_:with:)-6a2ai)
  @available(*, deprecated, message: "Use native Swift's `.replaceSubrange(0..<3, with: [1, 2, 3])` instead")
  @inlinable func toSpliced(_ start: Int, _ deleteCount: Int? = nil, _ elements: Element...) -> [Element] {
    var newArr = self
    let end = if let deleteCount { start + deleteCount } else { count }
    let removedElements = newArr.slice(start, end)
    newArr.replaceSubrange(start ..< end, with: elements)
    return newArr
  }

  /// JS's `.toReversed`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/reverse()](https://developer.apple.com/documentation/swift/array/reverse())
  @available(*, deprecated, message: "Use native Swift's `.reversed()` instead")
  @inlinable func toReversed() -> [Element] {
    return self.reversed()
  }

  /// JS's `.toSorted`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/sorted(by:)](https://developer.apple.com/documentation/swift/array/sorted(by:))
  @available(*, deprecated, message: "Use native Swift's `.sorted(by: { $0 > $1 })` instead")
  @inlinable func toSorted(_ predicate: (Element, Element) throws -> Bool) rethrows -> [Element] {
    return try self.sorted(by: predicate)
  }

  /// JS's `.unshift`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/insert(_:at:)-3erb3](https://developer.apple.com/documentation/swift/array/insert(_:at:)-3erb3)
  @available(*, deprecated, message: "Use native Swift's `.unshift(...)` instead")
  @inlinable mutating func unshift(_ element: Element) -> Int {
    self.insert(element, at: 0)
    return self.count
  }

  /// Use to be able to casually destructure arrays like you can with JS
  @inlinable func destructure() -> (Element?, Element?) {
    guard count >= 2 else {
      return (nil, nil)
    }
    return (self[0], self[1])
  }
}

public extension Array where Element: Comparable {
  /// JS's `.toSorted`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/sorted()](https://developer.apple.com/documentation/swift/array/sorted())
  @available(*, deprecated, message: "Use native Swift's `.sorted()` instead")
  @inlinable func toSorted() -> [Element] {
    return self.sorted()
  }
}

public extension Array where Element: Equatable {
  /// JS's `.includes`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/contains(_:)](https://developer.apple.com/documentation/swift/array/contains(_:))
  @available(*, deprecated, message: "Use native Swift's `.contains(...)` instead")
  @inlinable func includes(_ element: Element) -> Bool {
    return self.contains(element)
  }

  /// JS's `.indexOf`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/firstindex(of:)](https://developer.apple.com/documentation/swift/array/firstindex(of:))
  @available(*, deprecated, message: "Use native Swift's `.firstIndex(of: ...)` instead")
  @inlinable func indexOf(_ element: Element) -> Int {
    return self.firstIndex(of: element) ?? -1
  }

  /// JS's `.lastIndexOf`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/lastindex(of:)](https://developer.apple.com/documentation/swift/array/lastindex(of:))
  @available(*, deprecated, message: "Use native Swift's `.lastIndex(of: ...)` instead")
  @inlinable func lastIndexOf(_ element: Element) -> Int {
    return self.lastIndex(of: element) ?? -1
  }
}

public extension Array where Element == String {
  /// JS's `.join()`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/joined(separator:)-5do1g](https://developer.apple.com/documentation/swift/array/joined(separator:)-5do1g)
  ///
  /// Shorthand for native Swift's `joined(separator: "...")`
  @inlinable func join(_ separator: String) -> String {
    return joined(separator: separator)
  }
}

public extension Array where Element == Int {
  /// JS's `.join()`
  ///
  /// - SeeAlso: [developer.apple.com/documentation/swift/array/joined(separator:)-5do1g](https://developer.apple.com/documentation/swift/array/joined(separator:)-5do1g)
  ///
  /// Shorthand for native Swift's `joined(separator: "...")`
  @inlinable func join(_ separator: String) -> String {
    let newArr = self.map { String($0) }
    return newArr.joined(separator: separator)
  }
}
