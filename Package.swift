// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-lexbor",
    products: [
        .library(name: "lexbor", targets: ["lexbor"]),
    ],
    targets: [
        .target(
			name: "lexbor",
			exclude: [
				"source/lexbor/core/config.cmake",
				"source/lexbor/css/config.cmake",
				"source/lexbor/dom/config.cmake",
				"source/lexbor/encoding/config.cmake",
				"source/lexbor/html/config.cmake",
				"source/lexbor/ns/config.cmake",
				"source/lexbor/ports/posix/config.cmake",
				"source/lexbor/punycode/config.cmake",
				"source/lexbor/selectors/config.cmake",
				"source/lexbor/tag/config.cmake",
				"source/lexbor/unicode/config.cmake",
				"source/lexbor/url/config.cmake",
				"source/lexbor/utils/config.cmake",

				// exclude Windows port
				"source/lexbor/ports/windows_nt",
			],
			sources: ["source"],
			publicHeadersPath: "source"),

		.testTarget(name: "LexborTests", dependencies: ["lexbor"]),
    ],
	cLanguageStandard: .gnu17
)
