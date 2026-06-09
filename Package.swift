// swift-tools-version: 6.3.1
import PackageDescription

let package = Package(
    name: "swift-sector-cyclic-primitives",
    platforms: [.macOS(.v26), .iOS(.v26), .tvOS(.v26), .watchOS(.v26), .visionOS(.v26)],
    products: [
        .library(name: "Sector Cyclic Primitives", targets: ["Sector Cyclic Primitives"]),
        .library(name: "Sector Cyclic Primitives Test Support", targets: ["Sector Cyclic Primitives Test Support"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-sector-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-cyclic-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-ordinal-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Sector Cyclic Primitives",
            dependencies: [
                .product(name: "Sector Primitives", package: "swift-sector-primitives"),
                .product(name: "Cyclic Primitives", package: "swift-cyclic-primitives"),
                .product(name: "Ordinal Primitives", package: "swift-ordinal-primitives"),
            ]
        ),
        .target(name: "Sector Cyclic Primitives Test Support", dependencies: ["Sector Cyclic Primitives"], path: "Tests/Support"),
        .testTarget(name: "Sector Cyclic Primitives Tests", dependencies: ["Sector Cyclic Primitives", "Sector Cyclic Primitives Test Support"]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
