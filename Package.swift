// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GemiusSDK_iOS_AdMob",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GemiusSDK",
            targets: ["GemiusSDKTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", "12.14.0"..<"14.0.0")
    ],
    targets: [
        .target(
            name: "GemiusSDKTarget",
            dependencies: [
                "GemiusSDKFramework",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("SystemConfiguration")
            ]
        ),
        .binaryTarget(
            name: "GemiusSDKFramework",
            path: "./Framework/GemiusSDK.xcframework"
        ),
    ]
)
