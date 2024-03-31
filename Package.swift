// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFSymbolPicker",
    platforms: [
        .iOS("17.2"),
    ],
    products: [
        .library(name: "SFSymbolPicker", targets: ["SFSymbolPicker"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SFSymbolPicker",
            resources: [.process("Resources/Symbols.txt")]
        ),
        .testTarget(
            name: "SFSymbolPickerTests",
            dependencies: ["SFSymbolPicker"]
        ),
    ]
)
