// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "YARC_SDK",
                      platforms: [.iOS("15"), .macOS("11")],
                      products: [.library(name: "YARC_SDK",targets: ["YARC_SDK"])],
                      dependencies: [.package(url: "https://github.com/alexaubry/HTMLString", from: "6.0.1")],
                      targets: [.target(name: "YARC_SDK", dependencies: ["HTMLString"], path: "Sources"),
                                .testTarget(name: "YARC_SDKTests", dependencies: ["YARC_SDK"], path: "Tests")])
