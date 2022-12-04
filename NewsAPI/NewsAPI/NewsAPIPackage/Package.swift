// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewsAPIPackage",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "NewsAPIPackage",
            targets: ["NewsAPIPackage"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NewsAPIPackage",
            dependencies: [],
            resources: [
                .copy("Services/DB/NewsDB.xcdatamodel"),
                .process("sounds")
            ]),
        .testTarget(
            name: "NewsAPIPackageTests",
            dependencies: ["NewsAPIPackage"]),
    ]
)
