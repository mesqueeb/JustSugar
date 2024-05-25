@testable import JustSugar
import XCTest

final class JustSugarTests: XCTestCase {
  func testArrayAt() {
    let array = [1, 2, 3, 4, 5]

    XCTAssertEqual(array.at(0), 1)
    XCTAssertEqual(array.at(2), 3)
    XCTAssertEqual(array.at(-1), 5)
    XCTAssertEqual(array.at(-3), 3)
    XCTAssertNil(array.at(5))
    XCTAssertNil(array.at(-6))
  }

  func testArraySlice() {
    let array = [1, 2, 3, 4, 5]

    XCTAssertEqual(array.slice(1, 3), [2, 3])
    XCTAssertEqual(array.slice(1), [2, 3, 4, 5])
    XCTAssertEqual(array.slice(-3, -1), [3, 4])
    XCTAssertEqual(array.slice(0, 5), [1, 2, 3, 4, 5])
    XCTAssertEqual(array.slice(3, 1), [])
    XCTAssertEqual(array.slice(5, 7), [])
    XCTAssertEqual(array.slice(-6, -4), [])
  }

  func testArrayDestructure() {
    let array1 = [1, 2, 3]
    let array2 = [1]
    let array3: [Int] = []

    XCTAssertEqual(array1.destructure().0, 1)
    XCTAssertEqual(array1.destructure().1, 2)
    XCTAssertEqual(array2.destructure().0, nil)
    XCTAssertEqual(array2.destructure().1, nil)
    XCTAssertEqual(array3.destructure().0, nil)
    XCTAssertEqual(array3.destructure().1, nil)
  }

  func testStringArrayJoin() {
    let array = ["Hello", "World", "Swift"]

    XCTAssertEqual(array.join(" "), "Hello World Swift")
    XCTAssertEqual(array.join(","), "Hello,World,Swift")
    XCTAssertEqual(array.join(""), "HelloWorldSwift")
  }

  func testStringSplitByCharacter() {
    let string = "Hello,World,Swift"

    XCTAssertEqual(string.split(","), ["Hello", "World", "Swift"])
    XCTAssertEqual(string.split("o"), ["Hell", ",W", "rld,Swift"])
    XCTAssertEqual("".split(","), [""])
    XCTAssertEqual(string.split("x"), ["Hello,World,Swift"])
  }

  func testStringSplitByString() {
    let string = "Hello-World-Swift"

    XCTAssertEqual(string.split("-"), ["Hello", "World", "Swift"])
    XCTAssertEqual(string.split("o"), ["Hell", "-W", "rld-Swift"])
    XCTAssertEqual(string.split("x"), ["Hello-World-Swift"])
    XCTAssertEqual("".split("-"), [""])
  }
}
