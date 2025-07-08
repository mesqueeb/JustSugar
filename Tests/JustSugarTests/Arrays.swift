import Testing

@testable import JustSugar

struct ArrayTests {
  @Test func at() throws {
    let array = [1, 2, 3, 4, 5]
    #expect(array.at(0) == 1)
    #expect(array.at(2) == 3)
    #expect(array.at(-1) == 5)
    #expect(array.at(-3) == 3)
    #expect(array.at(5) == nil)
    #expect(array.at(-6) == nil)
  }

  @Test func concat() throws {
    #expect([1, 2].concat([3, 4]) == [1, 2, 3, 4])
    #expect([1, 2].concat([]) == [1, 2])
  }

  @Test func entries() throws {
    for (index, value) in ["a", "b"].entries() {
      #expect((index == 0 && value == "a") || (index == 1 && value == "b"))
    }
  }

  @Test func every() throws {
    #expect([].every { $0 > 0 } == true)
    #expect([1, 2].every { $0 > 0 } == true)
    #expect([1, -1].every { $0 > 0 } == false)
  }

  @Test func fill() throws {
    var arr: [Int?] = [1, 2]
    #expect(arr.fill(nil) == [nil, nil])
    arr = [1, 2, 3, 4]
    #expect(arr.fill(0) == [0, 0, 0, 0])
    arr = [1, 2, 3, 4]
    #expect(arr.fill(0, 2, 4) == [1, 2, 0, 0])

    arr = [1, 2, 3, 4]
    #expect(arr.fill(5, 1) == [1, 5, 5, 5])

    arr = [1, 2, 3, 4]
    #expect(arr.fill(6) == [6, 6, 6, 6])
    var emptyArr: [Int?] = []
    #expect(emptyArr.fill(nil) == [])
  }

  @Test func find() throws {
    #expect([0, 1, 5].find { $0 > 1 } == 5)
    #expect([].find { $0 > 1 } == nil)
  }

  @Test func findIndex() throws {
    #expect([0, 1, 5].findIndex { $0 > 1 } == 2)
    #expect([].findIndex { $0 > 1 } == -1)
  }

  @Test func findLast() throws {
    #expect([0, 1, 5].findLast { $0 > 1 } == 5)
    #expect([].findLast { $0 > 1 } == nil)
  }

  @Test func includes() throws {
    #expect([0, 1, 5].includes(5) == true)
    #expect([].includes(5) == false)
  }

  @Test func indexOf() throws {
    #expect([0, 1, 5].indexOf(5) == 2)
    #expect([].indexOf(5) == -1)
  }

  @Test func join() throws {
    #expect(["0", "1", "5"].join(".") == "0.1.5")
    #expect([0, 1, 5].join("-") == "0-1-5")
    let array = ["Hello", "World", "Swift"]
    #expect(array.join(" ") == "Hello World Swift")
    #expect(array.join(",") == "Hello,World,Swift")
    #expect(array.join("") == "HelloWorldSwift")
  }

  @Test func lastIndex() throws {
    #expect([5, 5, 5, 0, 0, 0].lastIndexOf(5) == 2)
    #expect([].lastIndexOf(5) == -1)
  }

  @Test func length() throws {
    #expect([0, 1, 5].length == 3)
    #expect([].length == 0)
  }

  @Test func pop() throws {
    var arr = [0, 1, 5]
    let item = arr.pop()
    #expect(arr == [0, 1])
    #expect(item == 5)
    var emptyArr: [Int] = []
    #expect(emptyArr.pop() == nil)
  }

  @Test func push() throws {
    var arr = [0, 1, 5]
    let newLength = arr.push(0)
    #expect(arr == [0, 1, 5, 0])
    #expect(newLength == 4)
  }

  @Test func shift() throws {
    var arr = [0, 1, 5]
    let item = arr.shift()
    #expect(arr == [1, 5])
    #expect(item == 0)
    var emptyArr: [Int] = []
    #expect(emptyArr.shift() == nil)
  }

  @Test func slice() throws {
    let array = [1, 2, 3, 4, 5]
    #expect(array.slice(1, 3) == [2, 3])
    #expect(array.slice(1) == [2, 3, 4, 5])
    #expect(array.slice(-3, -1) == [3, 4])
    #expect(array.slice(0, 5) == [1, 2, 3, 4, 5])
    #expect(array.slice(3, 1) == [])
    #expect(array.slice(5, 7) == [])
    #expect(array.slice(-6, -4) == [])
    let emptyArr: [String] = []
    #expect(emptyArr.slice(1, 3) == [])
  }

  @Test func some() throws {
    #expect([].some { $0 > 1 } == false)
    #expect([0, 1, 5].some { $0 > 1 } == true)
    #expect([0, 1, 5].some { $0 > 100 } == false)
  }

  @Test func splice() throws {
    var array = [1, 2, 3, 4, 5]
    #expect(array.splice(2) == [3, 4, 5])
    #expect(array == [1, 2])
    array = [1, 2, 3, 4, 5]
    #expect(array.splice(2, 1) == [3])
    #expect(array == [1, 2, 4, 5])
    array = [1, 2, 3, 4, 5]
    #expect(array.splice(2, 1, 0) == [3])
    #expect(array == [1, 2, 0, 4, 5])
    array = [1, 2, 3, 4, 5]
    #expect(array.splice(2, 2, 0, -1) == [3, 4])
    #expect(array == [1, 2, 0, -1, 5])
  }

  @Test func toSpliced() throws {
    let array = [1, 2, 3, 4, 5]
    #expect(array.toSpliced(2) == [1, 2])
    #expect(array == [1, 2, 3, 4, 5])
    #expect(array.toSpliced(2, 1) == [1, 2, 4, 5])
    #expect(array == [1, 2, 3, 4, 5])
    #expect(array.toSpliced(2, 1, 0) == [1, 2, 0, 4, 5])
    #expect(array == [1, 2, 3, 4, 5])
    #expect(array.toSpliced(2, 2, 0, -1) == [1, 2, 0, -1, 5])
    #expect(array == [1, 2, 3, 4, 5])

    // tests from MDN:
    let months = ["Jan", "Mar", "Apr", "May"]
    // Inserting an element at index 1
    let months2 = months.toSpliced(1, 0, "Feb")
    #expect(months2 == ["Jan", "Feb", "Mar", "Apr", "May"])
    // Deleting two elements starting from index 2
    let months3 = months2.toSpliced(2, 2)
    #expect(months3 == ["Jan", "Feb", "May"])
    // Replacing one element at index 1 with two new elements
    let months4 = months3.toSpliced(1, 1, "Feb", "Mar")
    #expect(months4 == ["Jan", "Feb", "Mar", "May"])
    // Original array is not modified
    #expect(months == ["Jan", "Mar", "Apr", "May"])
  }

  @Test func toReversed() throws {
    let array = [1, 2, 3, 4, 5]
    #expect(array.toReversed() == [5, 4, 3, 2, 1])
    #expect(array == [1, 2, 3, 4, 5])
  }

  @Test func toSorted() throws {
    let array = [1, 5, 3, 0]
    #expect(array.toSorted() == [0, 1, 3, 5])
    #expect(array == [1, 5, 3, 0])
  }

  @Test func unshift() throws {
    var arr = [0, 1, 5]
    let newLength = arr.unshift(0)
    #expect(arr == [0, 0, 1, 5])
    #expect(newLength == 4)
  }

  @Test func destructure() throws {
    #expect([1, 2, 3].destructure().0 == 1)
    #expect([1, 2, 3].destructure().1 == 2)
    #expect([1].destructure().0 == nil)
    #expect([1].destructure().1 == nil)
    #expect([].destructure().0 == nil)
    #expect([].destructure().1 == nil)
  }
}
