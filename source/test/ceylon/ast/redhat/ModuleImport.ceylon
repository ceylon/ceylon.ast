import ceylon.ast.core {
    Annotations,
    BaseExpression,
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
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JImportModule=ImportModule
    }
}

shared object moduleImport satisfies ConcreteTest<ModuleImport,JImportModule> {
    
    String->ModuleImport construct(String->Module|ModuleSpecifier name, String->StringLiteral|BaseExpression version, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` import ``name.key`` ``version.key``;" -> ModuleImport(name.item, version.item, annotations.item);
    
    shared String->ModuleImport ceylonAstCore100ModuleImport = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral, annotations.sharedAnnotations);
    shared String->ModuleImport mavenCommonsCodecModuleImport = construct(moduleSpecifier.mavenCommonsCodecModuleSpecifier, stringLiteral._14VersionStringLiteral, annotations.emptyAnnotations);
    shared String->ModuleImport ceylonCollectionLanguageVersionImport = construct(fullPackageName.ceylonCollectionPackageName, baseExpression.languageVersionExpression, annotations.emptyAnnotations);
    
    parse = parseModuleImport;
    fromCeylon = RedHatTransformer.transformModuleImport;
    toCeylon = moduleImportToCeylon;
    codes = [ceylonAstCore100ModuleImport, mavenCommonsCodecModuleImport, ceylonCollectionLanguageVersionImport];
}
