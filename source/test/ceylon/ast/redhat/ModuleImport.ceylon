import ceylon.ast.core {
    Annotations,
    FullPackageName,
    ModuleImport,
    RepositoryType,
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
    
    String->ModuleImport construct(String->FullPackageName|StringLiteral name, String->StringLiteral version, String->Annotations annotations = package.annotations.emptyAnnotations, <String->RepositoryType>? repositoryType = null)
            => "``annotations.key`` import `` if (exists repositoryType) then "``repositoryType.key``:" else "" `` ``name.key`` ``version.key``;"->ModuleImport(name.item, version.item, annotations.item, repositoryType?.item);
    
    shared String->ModuleImport ceylonAstCore100ModuleImport = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral, annotations.sharedAnnotations);
    shared String->ModuleImport mavenCommonsCodecModuleImport = construct(stringLiteral.commonsCodecCommonsCodecStringLiteral, stringLiteral._14VersionStringLiteral, annotations.emptyAnnotations, identifier.mavenLIdentifier);
    
    parse = parseModuleImport;
    fromCeylon = RedHatTransformer.transformModuleImport;
    toCeylon = moduleImportToCeylon;
    codes = [ceylonAstCore100ModuleImport, mavenCommonsCodecModuleImport];
}
