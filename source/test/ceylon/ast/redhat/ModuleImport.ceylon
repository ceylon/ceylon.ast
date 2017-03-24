import ceylon.ast.core {
    Annotations,
    Module,
    ModuleImport,
    ModuleSpecifier,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleImportToCeylon,
    parseModuleImport
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportModule=ImportModule
    }
}

shared object moduleImport satisfies ConcreteTest<ModuleImport,JImportModule> {
    
    String->ModuleImport construct(String->Module|ModuleSpecifier name, String->StringLiteral version, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` import ``name.key`` ``version.key``;" -> ModuleImport(name.item, version.item, annotations.item);
    
    shared String->ModuleImport ceylonAstCore100ModuleImport = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral, annotations.sharedAnnotations);
    shared String->ModuleImport mavenCommonsCodecModuleImport = construct(moduleSpecifier.mavenCommonsCodecModuleSpecifier, stringLiteral._14VersionStringLiteral, annotations.emptyAnnotations);
    
    parse = parseModuleImport;
    fromCeylon = RedHatTransformer.transformModuleImport;
    toCeylon = moduleImportToCeylon;
    codes = [ceylonAstCore100ModuleImport, mavenCommonsCodecModuleImport];
}
