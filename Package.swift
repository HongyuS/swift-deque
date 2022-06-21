// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Deque",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Deque",
            targets: ["Deque"]),
        .library(
            name: "ArrayDeque",
            targets: ["ArrayDeque"]),
        .library(
            name: "LinkedListDeque",
            targets: ["LinkedListDeque"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "_DequeProtocol",
            dependencies: []),
        .target(
            name: "_DoublyCircularLinkedList",
            dependencies: []),
        .target(
            name: "ArrayDeque",
            dependencies: ["_DequeProtocol"]),
        .target(
            name: "LinkedListDeque",
            dependencies: ["_DoublyCircularLinkedList", "_DequeProtocol"]),
        .target(
            name: "Deque",
            dependencies: ["ArrayDeque", "LinkedListDeque"]),
        .testTarget(
            name: "DequeTests",
            dependencies: ["Deque"]),
    ]
)
