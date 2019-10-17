// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TestableAssert",
  platforms: [
    .macOS(SupportedPlatform.MacOSVersion.v10_12),
    .iOS(SupportedPlatform.IOSVersion.v10),
    .tvOS(SupportedPlatform.TVOSVersion.v10),
  ],
  products: [
    .library(
      name: "TestableAssert",
      targets: ["TestableAssert"]),
  ],
  dependencies: [
    .package(url: "https://github.com/vinceplusplus/TestableAssertSupport", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "TestableAssert",
      dependencies: ["TestableAssertSupport"]),
    .target(
      name: "TestLibrary",
      dependencies: ["TestableAssertSupport"]),
    .testTarget(
      name: "TestableAssertTests",
      dependencies: [
        "TestLibrary",
        "TestableAssert",
      ]),
  ]
)
