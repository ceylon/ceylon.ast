import ceylon.ast.core {
    Annotations,
    Artifact,
    Module,
    ModuleImport,
    Repository,
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
    
    String->ModuleImport construct(String->Module name, String->StringLiteral version, String->Annotations annotations = package.annotations.emptyAnnotations, <String->Repository>? repository = null, <String->Artifact>? artifact = null)
            => "``annotations.key`` import `` if (exists repository) then "``repository.key``:" else "" `` ``name.key`` `` if (exists artifact) then ":``artifact.key``" else "" `` ``version.key``;" -> ModuleImport(name.item, version.item, annotations.item, repository?.item, artifact?.item);
    
    shared String->ModuleImport ceylonAstCore100ModuleImport = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral, annotations.sharedAnnotations);
    shared String->ModuleImport mavenCommonsCodecModuleImport = construct(stringLiteral.commonsCodecStringLiteral, stringLiteral._14VersionStringLiteral, annotations.emptyAnnotations, identifier.mavenLIdentifier, stringLiteral.commonsCodecStringLiteral);
    
    parse = parseModuleImport;
    fromCeylon = RedHatTransformer.transformModuleImport;
    toCeylon = moduleImportToCeylon;
    codes = [ceylonAstCore100ModuleImport, mavenCommonsCodecModuleImport];
}
