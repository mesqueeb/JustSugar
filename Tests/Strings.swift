@testable import JustSugar
import Testing

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
