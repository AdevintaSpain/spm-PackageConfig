// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PackageConfig",
    products: [
		.library(name: "PackageConfig", targets: ["PackageConfig"]),
		.executable(name: "package-config", targets: ["PackageConfigExecutable"]),

		.library(name: "ExampleConfig", targets: ["ExampleConfig"]),
		.executable(name: "package-config-example", targets: ["PackageConfigExecutable"]),

    ],
    dependencies: [
    ],
    targets: [
		.target(name: "PackageConfig", dependencies: []),
		.executableTarget(name: "PackageConfigExecutable"),
		.target(name: "ExampleConfig", dependencies: ["PackageConfig"]),
        .executableTarget(
            name: "Example",
            dependencies: [
                "PackageConfig",
                "ExampleConfig",
            ]
        )

//		.target(name: "PackageConfigs", dependencies: ["ExampleConfig"]),
    ]
)

#if canImport(ExampleConfig)
import ExampleConfig

ExampleConfig(value: "example value").write()
#endif
