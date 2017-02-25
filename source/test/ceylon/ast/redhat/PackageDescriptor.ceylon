import ceylon.ast.core {
    Annotations,
    FullPackageName,
    PackageDescriptor
}
import ceylon.ast.redhat {
    RedHatTransformer,
    packageDescriptorToCeylon,
    parsePackageDescriptor
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPackageDescriptor=PackageDescriptor
    }
}

shared object packageDescriptor satisfies ConcreteTest<PackageDescriptor,JPackageDescriptor> {
    
    String->PackageDescriptor construct(String->FullPackageName name, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` package ``name.key``;" -> PackageDescriptor(name.item, annotations.item);
    
    shared String->PackageDescriptor ceylonAstCorePackageDescriptor = construct(fullPackageName.ceylonAstCorePackageName, annotations.helloSharedByLucasAnnotations);
    
    parse = parsePackageDescriptor;
    fromCeylon = RedHatTransformer.transformPackageDescriptor;
    toCeylon = packageDescriptorToCeylon;
    codes = [ceylonAstCorePackageDescriptor];
}
