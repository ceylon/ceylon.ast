import ceylon.ast.core {
    FullPackageName,
    LIdentifier,
    ModuleDescriptor,
    PackageDescriptor,
    StringLiteral
}

FullPackageName comExampleHelloworldName = FullPackageName([
        LIdentifier("com"),
        LIdentifier("example"),
        LIdentifier("helloworld")
    ]);

shared PackageDescriptor comExampleHelloworldPackageDescriptor = PackageDescriptor(comExampleHelloworldName);

shared ModuleDescriptor comExampleHelloworldModuleDescriptor = ModuleDescriptor {
    name = comExampleHelloworldName;
    version = StringLiteral("1.0.0");
};
