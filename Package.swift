// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SegmentedControl",
    defaultLocalization: "ko",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "SegmentedControl",
            targets: [
                "SegmentedControl",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/jaemyeong/Pretendard.git", .upToNextMajor(from: "0.2.5")),
        .package(url: "https://github.com/jaemyeong/OpenColorKit.git", .upToNextMajor(from: "0.1.10")),
        .package(url: "https://github.com/jaemyeong/ErrorKit.git", .upToNextMajor(from: "0.1.8")),
    ],
    targets: [
        .target(
            name: "SegmentedControl",
            dependencies: [
                "Pretendard",
                "OpenColorKit",
                "ErrorKit",
            ]
        ),
        .testTarget(
            name: "SegmentedControlTests",
            dependencies: [
                "SegmentedControl",
            ]
        ),
    ]
)

#if swift(>=5.6)

package.dependencies.append(.package(url: "https://github.com/apple/swift-docc-plugin", .upToNextMajor(from: "1.0.0")))

#endif
