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
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libmpv-GPL.xcframework.zip",
            checksum: "cbb2ffbc81f078d1d1d5ef072b22693317602c4157982749a7b7e66936e7ca18"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavcodec-GPL.xcframework.zip",
            checksum: "c707920b6a05d7335df96d3c693be6e2b10e6ba871708776f57761b174788b57"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavdevice-GPL.xcframework.zip",
            checksum: "4c2b5d9d2a113c7489cb17068d3dc71c39fed600558820dd57837b2524df849b"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavformat-GPL.xcframework.zip",
            checksum: "11b5b793c8292410200d11ef437b4906e5fbffc9478e1c8e5e8314f3c2e15497"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavfilter-GPL.xcframework.zip",
            checksum: "2517881afa7056210754e226357123519f5c39a33c2545f4ba90f044b34e97ce"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavutil-GPL.xcframework.zip",
            checksum: "da8d8790fabb7ce43a8a1c02bcfd8ae9bc4c73a97cfdceb611579827ad443b10"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libswresample-GPL.xcframework.zip",
            checksum: "ec71c14dc2f85157f67ecacca62cf57cd01fe6ea9c76a91a3040b7e4fc077717"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libswscale-GPL.xcframework.zip",
            checksum: "1aee382e81e2227cb2810580217b669d5a0d02893fa869eb0228b46f0a813d6c"
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
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavs3a.xcframework.zip",
            checksum: "8ce8ea46ed847ff36bf4e1fec15d8ca7a140ab284c27818ca943a48a7dfee73a"
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
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavcodec.xcframework.zip",
            checksum: "8be286dd14ea677b60d503115ee6cc7c8f391a7c1753a88ea7b2cd50bc86b6a3"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavdevice.xcframework.zip",
            checksum: "7719d4f5224e19c18988fac360c5294a75664116f9a1e1f73830afbcac378ea4"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavformat.xcframework.zip",
            checksum: "18d23605127590da7126845a3652fb5acf0518fa3509ac63fc88cce3dc0347c0"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavfilter.xcframework.zip",
            checksum: "3b9bddf4bc0b6549960f45dcd42101ce2d8a517ffd7f6660037d04669621ad3b"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libavutil.xcframework.zip",
            checksum: "f5754dbf41b9d710a2cd31200cdd0d4151e432add7d68bc5c6ddda4ef14e9a36"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libswresample.xcframework.zip",
            checksum: "32e0f8ee0984a4083c5da76cfe8b55a6b5895b4539520abac68ed2e220c14b13"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libswscale.xcframework.zip",
            checksum: "3a33c09237ecc7e08595a87ee23478595086a255046813307fd42cc14e63df40"
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
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libbluray.xcframework.zip",
            checksum: "d3d7b5eded694691c39c897fabae7f40f971a3b261e64934ef928d9365487214"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/prozyy/MPVKit/releases/download/0.39.0/Libmpv.xcframework.zip",
            checksum: "1b244eab697c13d750b18bca69ee4e0ea393d6e1267721200257165b60f40089"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
