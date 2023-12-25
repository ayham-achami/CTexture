// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let headersSearchPath: [CSetting] = [.headerSearchPath("."),
                                     .headerSearchPath("Base"),
                                     .headerSearchPath("tvOS"),
                                     .headerSearchPath("Debug"),
                                     .headerSearchPath("Layout"),
                                     .headerSearchPath("Private"),
                                     .headerSearchPath("TextKit"),
                                     .headerSearchPath("Details"),
                                     .headerSearchPath("Private/Layout"),
                                     .headerSearchPath("Details/Transactions"),
                                     .headerSearchPath("TextExperiment/String"),
                                     .headerSearchPath("TextExperiment/Utility"),
                                     .headerSearchPath("TextExperiment/Component")]

let defines: [CSetting] = [.define("AS_USE_VIDEO", to: "1"),
                           .define("AS_IG_LIST_KIT", to: "0"),
                           .define("AS_ENABLE_TEXTNODE", to: "0"),
                           .define("AS_IG_LIST_DIFF_KIT", to: "0"),
                           .define("AS_PIN_REMOTE_IMAGE", to: "1"),
                           .define("IG_LIST_COLLECTION_VIEW", to: "0")]

let package = Package(
    name: "CTexture",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AsyncDisplayKit",
            type: .static,
            targets: [
                "AsyncDisplayKit"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pinterest/PINRemoteImage.git", from: "3.0.3")
    ],
    targets: [
        .target(
            name: "AsyncDisplayKit",
            dependencies: [
                "PINRemoteImage"
            ],
            publicHeadersPath: "Include",
            cSettings: headersSearchPath + defines
        )
    ],
    swiftLanguageVersions: [.v5],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
