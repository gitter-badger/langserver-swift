import PackageDescription

let package = Package(
    name: "langserver-swift",
    targets: [
        Target(name: "BaseProtocol"),
        Target(name: "SourceKitter"),
        Target(name: "YamlConvertable"),
        Target(name: "LanguageServerProtocol", dependencies: ["YamlConvertable", "BaseProtocol", "SourceKitter"]),
        Target(name: "LanguageServer", dependencies: ["LanguageServerProtocol", "BaseProtocol"])
    ],
    dependencies: [
        .Package(url: "https://github.com/RLovelett/SourceKit.git", majorVersion: 1),
        .Package(url: "https://github.com/jpsim/Yams.git", Version(0, 1, 4)),
        .Package(url: "https://github.com/thoughtbot/Argo.git", majorVersion: 4),
        .Package(url: "https://github.com/edwardaux/Ogra.git", majorVersion: 4),
        .Package(url: "https://github.com/thoughtbot/Curry.git", majorVersion: 3)
    ]
)

products.append(
    Product(
        name: "langserver-swift",
        type: .Executable,
        modules: ["LanguageServer"]
    )
)
