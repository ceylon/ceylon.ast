import ceylon.ast.core {
    Annotations,
    FullPackageName,
    ModuleBody,
    ModuleDescriptor,
    ModuleSpecifier,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleDescriptorToCeylon,
    parseModuleDescriptor
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JModuleDescriptor=ModuleDescriptor
    }
}

shared object moduleDescriptor satisfies ConcreteTest<ModuleDescriptor,JModuleDescriptor> {
    
    String->ModuleDescriptor construct(String->FullPackageName name, String->StringLiteral version, String->ModuleBody body = moduleBody.emptyModuleBody, String->Annotations annotations = package.annotations.emptyAnnotations, <String->ModuleSpecifier>? specifier = null)
            => "``annotations.key`` module ``name.key`` `` specifier?.key else "" ``  ``version.key````body.key``" -> ModuleDescriptor(name.item, version.item, body.item, annotations.item, specifier?.item);
    
    shared String->ModuleDescriptor ceylonAstCoreEmptyModuleDescriptor = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral);
    shared String->ModuleDescriptor orgHibernateCoreModuleDescriptor = construct {
        name = fullPackageName.orgHibernateCorePackageName;
        version = stringLiteral._211VersionStringLiteral;
        specifier = moduleSpecifier.orgHibernateCoreModuleSpecifier;
    };
    
    parse = parseModuleDescriptor;
    fromCeylon = RedHatTransformer.transformModuleDescriptor;
    toCeylon = moduleDescriptorToCeylon;
    codes = [ceylonAstCoreEmptyModuleDescriptor, orgHibernateCoreModuleDescriptor];
}
