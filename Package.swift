// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPCorePackage",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CPCorePackage",
            targets: ["CPCorePackage"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Alamo", url: "https://github.com/Alamofire/Alamofire.git", branch: "master"),
        .package(name: "Realm", url: "https://github.com/realm/realm-swift", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CPCorePackage",
            dependencies: [
                .product(name: "RealmSwift", package: "Realm"),
                .product(name: "Alamofire", package: "Alamo")
            ]),
        .testTarget(
            name: "CPCorePackageTests",
            dependencies: ["CPCorePackage"]),
    ]
)
