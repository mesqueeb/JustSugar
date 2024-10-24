// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "JustSugar",
  platforms: [.macOS(.v13), .iOS(.v16)],
  products: [.library(name: "JustSugar", targets: ["JustSugar"])],
  targets: [
    .target(
      name: "JustSugar",
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency"),
        .enableUpcomingFeature("BareSlashRegexLiterals"),
      ]
    ),
    .testTarget(
      name: "JustSugarTests",
      dependencies: ["JustSugar"],
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency"),
        .enableUpcomingFeature("BareSlashRegexLiterals"),
      ]
    ),
  ]
)
