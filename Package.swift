// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ansi2Html",
    products: [
        .library(
            name: "Ansi2Html",
            targets: ["Ansi2Html", "Ansi2HtmlCpp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mtynior/ColorizeSwift", .upToNextMajor(from: "1.6.0")),
        .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", .upToNextMajor(from: "0.3.0")),
    ],
    targets: [
        .target(
            name: "Ansi2Html",
            dependencies: [
                "Ansi2HtmlCpp",
            ],
            path: "Sources/Swift"
        ),
        .target(
            name: "Ansi2HtmlCpp",
            path: "Sources/CPP",
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("../CPP")
            ]
        ),
        .testTarget(
            name: "Ansi2HtmlTests",
            dependencies: [
                "Ansi2Html",
                "Ansi2HtmlCpp",
                .product(name: "ColorizeSwift", package: "ColorizeSwift"),
                .product(name: "CustomDump", package: "swift-custom-dump"),
            ]),
    ],
    cxxLanguageStandard: .cxx17
)
