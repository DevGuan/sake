// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sake",
    products: [
        .library(name: "SakefileUtils", type: .dynamic, targets: ["SakefileUtils"]),
        .library(name: "SakefileDescription", type: .dynamic, targets: ["SakefileDescription"]),
        .executable(name: "sake", targets: ["sake"])
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.9.0"),
        .package(url: "https://github.com/xcodeswift/xcproj.git", from: "1.7.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
        .package(url: "https://github.com/kareman/SwiftShell", from: "4.0.0")
    ],
    targets: [
        .target(name: "SakeKit", dependencies: ["xcproj","PathKit", "SwiftShell"]),
        .target(name: "SakefileDescription", dependencies: []),
        .target(name: "SakefileUtils", dependencies: ["SakefileDescription"]),
        .target(name: "sake", dependencies: ["Commander", "SakefileDescription", "SakeKit"]),
        .testTarget(name: "SakeKitTests", dependencies: ["SakeKit"]),
        .testTarget(name: "SakefileDescriptionTests", dependencies: ["SakefileDescription"]),
        .testTarget(name: "SakefileUtilsTests", dependencies: ["SakefileUtils"]),
    ],
    swiftLanguageVersions: [4]
)
