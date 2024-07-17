@testable import JustSugar
import RegexBuilder
import Testing

struct StringTests {
  @Test func at() throws {
    #expect("The quick brown fox jumps over the lazy dog.".at(5) == "u")
    #expect("".at(5) == nil)
  }
  
  @Test func endsWith() throws {
    #expect("The quick brown fox jumps over the lazy dog.".endsWith("dog.") == true)
    #expect("".endsWith("dog.") == false)
  }
  
  @Test func includes() throws {
    #expect("The quick brown fox jumps over the lazy dog.".includes("fox") == true)
    #expect("".includes("fox") == false)
  }
  
  @Test func indexOf() throws {
    #expect("The quick brown fox jumps over the lazy dog.".indexOf("fox") == 16)
    #expect("".indexOf("a") == -1)
    #expect("".indexOf("") == 0)
    #expect("a".indexOf("") == 0)
    #expect("a".indexOf("a") == 0)
  }
  
  @Test func lastIndexOf() throws {
    #expect("The quick brown fox jumps over the lazy dog.".lastIndexOf("o") == 41)
    #expect("The quick brown fox jumps over the lazy dog.".lastIndexOf("") == 44)
    #expect("".lastIndexOf("") == 0)
    #expect("a".lastIndexOf("") == 1)
    #expect("a".lastIndexOf("a") == 0)
    #expect("".lastIndexOf("a") == -1)
  }
  
  @Test func matchAll() throws {
    let regex1 = /foo[a-z]*/
    let str1 = "table football, foosball"
    let matches1 = str1.matches(of: regex1)
    #expect(matches1[0].0 == "football")
    #expect(matches1[1].0 == "foosball")
    
    let regex2 = /t(e)(st(\d?))/
    let str2 = "test1test2"
    let matches2 = str2.matches(of: regex2)
    #expect(matches2[0].0 == "test1")
    #expect(matches2[0].1 == "e")
    #expect(matches2[0].2 == "st1")
    #expect(matches2[0].3 == "1")
    #expect(matches2[1].0 == "test2")
    #expect(matches2[1].1 == "e")
    #expect(matches2[1].2 == "st2")
    #expect(matches2[1].3 == "2")
  }
  
  @Test func padEnd() throws {
    #expect("fox".padEnd(10, ".") == "fox.......")
    #expect("".padEnd(3, "-") == "---")
  }
  
  @Test func padStart() throws {
    #expect("fox".padStart(10, ".") == ".......fox")
    #expect("".padStart(3, "-") == "---")
  }
  
  @Test func repeatJs() throws {
    #expect("F.O.X.".repeatJs(3) == "F.O.X.F.O.X.F.O.X.")
    #expect("".repeatJs(100) == "")
  }
  
  @Test func replace() throws {
    #expect("The quick brown fox jumps over the lazy fox.".replace("fox", "ox") == "The quick brown ox jumps over the lazy fox.")
    #expect("".replace("a", "b") == "")
  }
  
  @Test func replaceAll() throws {
    #expect("The quick brown fox jumps over the lazy fox.".replaceAll("fox", "ox") == "The quick brown ox jumps over the lazy ox.")
    #expect("".replaceAll("a", "b") == "")
  }
  
  @Test func slice() throws {
    let str = "The quick brown fox jumps over the lazy dog."
    #expect(str.slice(31) == "the lazy dog.")
    #expect(str.slice(4, 19) == "quick brown fox")
    #expect(str.slice(-4) == "dog.")
    #expect(str.slice(-9, -5) == "lazy")
    #expect("".slice(0, 1) == "")
  }
  
  @Test func split() throws {
    let string = "Hello,World,Swift"
    
    #expect(string.split(",") == ["Hello", "World", "Swift"])
    #expect(string.split("o") == ["Hell", ",W", "rld,Swift"])
    #expect("".split(",") == [""])
    #expect(string.split("x") == ["Hello,World,Swift"])
    
    let string2 = "Hello-World-Swift"
    
    #expect(string2.split("-") == ["Hello", "World", "Swift"])
    #expect(string2.split("o") == ["Hell", "-W", "rld-Swift"])
    #expect(string2.split("x") == ["Hello-World-Swift"])
    #expect("".split("-") == [""])
  }
  
  @Test func startsWith() throws {
    #expect("The quick brown fox jumps over the lazy dog.".startsWith("The") == true)
    #expect("".startsWith("fox") == false)
  }
  
  @Test func toLowerCase() throws {
    #expect("The quick brown fox jumps over the lazy dog.".toLowerCase() == "the quick brown fox jumps over the lazy dog.")
    #expect("".toLowerCase() == "")
  }
  
  @Test func toUpperCase() throws {
    #expect("The quick brown fox jumps over the lazy dog.".toUpperCase() == "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.")
    #expect("".toUpperCase() == "")
  }
  
  @Test func trim() throws {
    #expect("    fox    ".trim() == "fox")
    #expect("".trim() == "")
  }
  
  @Test func trimEnd() throws {
    #expect("    fox    ".trimEnd() == "    fox")
    #expect("".trimEnd() == "")
  }
  
  @Test func trimStart() throws {
    #expect("    fox    ".trimStart() == "fox    ")
    #expect("".trimStart() == "")
  }
}
