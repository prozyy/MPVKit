// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "MPVKit",
            targets: ["_MPVKit"]
        ),
        .library(
            name: "MPVKit-GPL",
            targets: ["_MPVKit-GPL"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d", "Libavs3a"
            ],
            path: "Sources/_FFmpeg",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "_MPVKit-GPL",
            dependencies: [
                "Libmpv-GPL", "_FFmpeg-GPL", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-GPL",
            dependencies: [
                "Libavcodec-GPL", "Libavdevice-GPL", "Libavfilter-GPL", "Libavformat-GPL", "Libavutil-GPL", "Libswresample-GPL", "Libswscale-GPL",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libsmbclient", "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d", "Libavs3a"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),

        .binaryTarget(
            name: "Libmpv-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libmpv-GPL.xcframework.zip",
            checksum: "efb9f5940a9ece6deb84b8517f9ff9aadfac621e1b56b0b783d77ec453edc6e5"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavcodec-GPL.xcframework.zip",
            checksum: "cdae869fd5b9f12edbe95dd6230f359d17613d803a08521fcc3dcfea71726a84"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavdevice-GPL.xcframework.zip",
            checksum: "1a08afcfaa97ad1c2be3799f7d916b555e2d12a218f70d4045b5441c9495922f"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavformat-GPL.xcframework.zip",
            checksum: "551e7b9dcf7cead94b2fe030d690f05170d4a57753fb7dd64d6bb4f27165977f"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavfilter-GPL.xcframework.zip",
            checksum: "f956c3053d4fa62edef2fb2530028d8144a312037ae90eef2e813cd3a08c47af"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavutil-GPL.xcframework.zip",
            checksum: "d0fd293c1c37c971eda17fcd001136270aada29e3c5f75d939dce4645c5f5739"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libswresample-GPL.xcframework.zip",
            checksum: "900037852320177e52963285f60c20120376a18372c9f817c07ac85549bd3390"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libswscale-GPL.xcframework.zip",
            checksum: "dfa0d984958813d667f7ca20b319a213f4298e4ceb0e355ee0e7c99b9b07abf5"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.2.0/Libcrypto.xcframework.zip",
            checksum: "89989ea14f7297d98083eb8adfba9b389f5b4886cb54fb3d5b6e8b915b7adf1d"
        ),
        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.2.0/Libssl.xcframework.zip",
            checksum: "46ad8e8fa5a6efe7bd31c9b3c56b20c1bc29a581083588d86e941d261d7dbe98"
        ),

        .binaryTarget(
            name: "gmp",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.3/gmp.xcframework.zip",
            checksum: "defd5623e6786543588001b8f33026395960a561540738deb6df6996d39f957d"
        ),

        .binaryTarget(
            name: "nettle",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.3/nettle.xcframework.zip",
            checksum: "c3b8f506fa32bcb3f9bf65096b0556c4f5973f846ee964577d783edbe8e6969d"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.3/hogweed.xcframework.zip",
            checksum: "47a34e7877f7ebd9175f5645059030e553276faa9a21b91e29fb7463b94e8daf"
        ),

        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.3/gnutls.xcframework.zip",
            checksum: "5f5cf903a2d52157c29ad304260709f618ce086afea02061241982f8425a6fb0"
        ),

        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.3/Libunibreak.xcframework.zip",
            checksum: "430ed1a8ff1a230bd93b6868021cde2aafb23c8cb2d586525836cac47c4f310f"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.3/Libfreetype.xcframework.zip",
            checksum: "300d2966c914e06f0211d8da0ea6208a345709b888e9cbbf1cdd94df26330359"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.3/Libfribidi.xcframework.zip",
            checksum: "4a3122a2027f021937ed0fa07173dca7f2c1c4c4202b7caf8043fa80408c0953"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.3/Libharfbuzz.xcframework.zip",
            checksum: "f607773598caa72435d8b19ce6a9d54fa7f26cde126b6b66c0a3d2804f084c68"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.3/Libass.xcframework.zip",
            checksum: "af24cd1429069153f0ca5c650e0b374c27ae38283aca47cbbbc9edb3165b182e"
        ),

        .binaryTarget(
            name: "Libsmbclient",
            url: "https://github.com/mpvkit/libsmbclient-build/releases/download/4.15.13/Libsmbclient.xcframework.zip",
            checksum: "589db9c241e6cc274f2825bee542add273febd0666ebd7ea8a402574ed76e9af"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1/Libuavs3d.xcframework.zip",
            checksum: "893257fc73c61b87fb45ee9de7df6ac4a6967062d7cac2c8d136cd2774a04971"
        ),

        .binaryTarget(
            name: "Libavs3a",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavs3a.xcframework.zip",
            checksum: "790c53c6f7cf6fdfdadfeba7426f44c5d66a79477fef04223b3c1c44227eb21d"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.0/Libdovi.xcframework.zip",
            checksum: "ca4382ea4e17103fbcc979d0ddee69a6eb8967c0ab235cb786ffa96da5f512ed"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/mpvkit/moltenvk-build/releases/download/1.2.9-fix/MoltenVK.xcframework.zip",
            checksum: "63836d61deceb5721ff0790dac651890e44ef770ab7b971fb83cc1b2524d1025"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/mpvkit/libshaderc-build/releases/download/2024.2.0/Libshaderc_combined.xcframework.zip",
            checksum: "1ccd9fce68ea29af030dceb824716fc16d1f4dcdc0b912ba366d5cb91d7b1add"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.349.0/lcms2.xcframework.zip",
            checksum: "bd2c27366f8b7adfe7bf652a922599891c55b82f5c519bcc4eece1ccff57c889"
        ),

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.349.0/Libplacebo.xcframework.zip",
            checksum: "f32d20351289a080cd7288742747cd927553fde8c217f63263b838083d07a01a"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.4.3/Libdav1d.xcframework.zip",
            checksum: "eccfe37da9418e350bc6c1566890fa5b9585fbb87b8ceb664de77800ef17fe04"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavcodec.xcframework.zip",
            checksum: "4c0e9a2da7d6b2f8841d342419f7c97b7e2c871a38f42d55d8dfcabdeb475ba4"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavdevice.xcframework.zip",
            checksum: "b2648fa64b0b69272a3fae76f9790455be1703a9597371eecad20658941d276b"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavformat.xcframework.zip",
            checksum: "b25386b0e29c3a33289804321882a4d7980f4776408c4a4b9ef1bdcaa0734591"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavfilter.xcframework.zip",
            checksum: "6c08f43dd29889cbabf4d9d6e5319a82a73ee57f92e5199e3bd12b1e85786647"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libavutil.xcframework.zip",
            checksum: "471a07a82711ee74e7e2733ffeca3d545792ace4d0eb5d91cb859ddb948285ac"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libswresample.xcframework.zip",
            checksum: "f2429f178b4d3dec112ccc777190925f97d21ab5adca191dd7955baab06727ca"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libswscale.xcframework.zip",
            checksum: "a662d09f98fc2eec25af379d7d0efdd30330e0bd497afb5a986df34b19c0318d"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8/Libuchardet.xcframework.zip",
            checksum: "80b14d8080c2531ced6d6b234a826c13f0be459a8c751815f68e0eefd34afa30"
        ),

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0/Libluajit.xcframework.zip",
            checksum: "3765d7c6392b4f9a945b334ed593747b8adb9345078717ecfb6d7d12114a0f9e"
        ),

        .binaryTarget(
            name: "Libbluray",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libbluray.xcframework.zip",
            checksum: "efd30571956097e4787d835576d79f62d875de3d02a3d1485d5c93d4a6e47621"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/prozyy/MPVKit/releases/download/v0.39.1/Libmpv.xcframework.zip",
            checksum: "52f4d2202f77c658f9e9dee9dd1bea9d1dae620adebf4d93a035029f815848ba"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
