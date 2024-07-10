// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "JustSugar",
  products: [
    .library(
      name: "JustSugar",
      targets: ["JustSugar"]
    ),
  ],
  targets: [
    .target(
      name: "JustSugar",
      swiftSettings: [.enableExperimentalFeature("StrictConcurrency")]
    ),
    .testTarget(
      name: "JustSugarTests",
      dependencies: ["JustSugar"]
    ),
  ]
)
