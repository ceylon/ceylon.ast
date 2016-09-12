import ceylon.ast.core {
    Annotations,
    FullPackageName,
    ModuleBody,
    ModuleDescriptor,
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
    
    String->ModuleDescriptor construct(String->FullPackageName name, String->StringLiteral version, String->ModuleBody body = moduleBody.emptyModuleBody, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` module ``name.key````version.key````body.key``"->ModuleDescriptor(name.item, version.item, body.item, annotations.item);
    
    shared String->ModuleDescriptor ceylonAstCoreEmptyModuleDescriptor = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral);
    
    parse = parseModuleDescriptor;
    fromCeylon = RedHatTransformer.transformModuleDescriptor;
    toCeylon = moduleDescriptorToCeylon;
    codes = [ceylonAstCoreEmptyModuleDescriptor];
}
