@testable import JustSugar
import Testing

@Test func arrayAt() throws {
  let array = [1, 2, 3, 4, 5]

  #expect(array.at(0) == 1)
  #expect(array.at(2) == 3)
  #expect(array.at(-1) == 5)
  #expect(array.at(-3) == 3)
  #expect(array.at(5) == nil)
  #expect(array.at(-6) == nil)
}

@Test func arraySlice() throws {
  let array = [1, 2, 3, 4, 5]

  #expect(array.slice(1, 3) == [2, 3])
  #expect(array.slice(1) == [2, 3, 4, 5])
  #expect(array.slice(-3, -1) == [3, 4])
  #expect(array.slice(0, 5) == [1, 2, 3, 4, 5])
  #expect(array.slice(3, 1) == [])
  #expect(array.slice(5, 7) == [])
  #expect(array.slice(-6, -4) == [])
}

@Test func arrayDestructure() throws {
  let array1 = [1, 2, 3]
  let array2 = [1]
  let array3: [Int] = []

  #expect(array1.destructure().0 == 1)
  #expect(array1.destructure().1 == 2)
  #expect(array2.destructure().0 == nil)
  #expect(array2.destructure().1 == nil)
  #expect(array3.destructure().0 == nil)
  #expect(array3.destructure().1 == nil)
}

@Test func stringArrayJoin() throws {
  let array = ["Hello", "World", "Swift"]

  #expect(array.join(" ") == "Hello World Swift")
  #expect(array.join(",") == "Hello,World,Swift")
  #expect(array.join("") == "HelloWorldSwift")
}

@Test func stringSplitByCharacter() throws {
  let string = "Hello,World,Swift"

  #expect(string.split(",") == ["Hello", "World", "Swift"])
  #expect(string.split("o") == ["Hell", ",W", "rld,Swift"])
  #expect("".split(",") == [""])
  #expect(string.split("x") == ["Hello,World,Swift"])
}

@Test func stringSplitByString() throws {
  let string = "Hello-World-Swift"

  #expect(string.split("-") == ["Hello", "World", "Swift"])
  #expect(string.split("o") == ["Hell", "-W", "rld-Swift"])
  #expect(string.split("x") == ["Hello-World-Swift"])
  #expect("".split("-") == [""])
}
