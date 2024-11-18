<p align="center">
  <a href="https://mesqueeb.github.io/SwiftVsTypeScript/justSugar">
    <img alt="logo" src="https://mesqueeb.github.io/SwiftVsTypeScript/logo.png" width="160" style="" />
  </a>
</p>

# JustSugar 🍰

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmesqueeb%2FJustSugar%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/mesqueeb/JustSugar)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmesqueeb%2FJustSugar%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/mesqueeb/JustSugar)

```
.package(url: "https://github.com/mesqueeb/JustSugar", from: "0.2.3")
```

JS-inspired Syntax Sugar on top of Swift to do two things:
1. Adds useful Array and String methods inspired by JS like `.at`, `.slice`, `.join`, etc.
2. Adds all the most common JS Array and String methods to Swift, with deprecation warnings where Swift has an alternative that is just as good.
  - In this case we want to prefer the Swift method, so a deprecation warning is shown when reaching for the JS method. This is perfect for new Swift developers coming from JavaScript or TypeScript.

**Example of the .slice method**

<img width="500" alt="example of the slice method" src="docs/public/eg-shorthands.png" />

**Example of JS methods with deprecation warning prompting to use the Swift equivalent**

<img width="800" alt="example of JS methods with deprecation warning" src="docs/public/eg-deprecations.png" />

## Full Documentation

See the SPM [JustSugar documentation](https://swiftpackageindex.com/mesqueeb/justsugar/documentation/justsugar/swift) for more info.

## TypeScript VS Swift Cheatsheet

See [mesqueeb.github.io/SwiftVsTypeScript](https://mesqueeb.github.io/SwiftVsTypeScript/) for a cheatsheet comparing Swift and TypeScript.
