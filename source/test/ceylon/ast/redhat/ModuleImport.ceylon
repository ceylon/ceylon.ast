import ceylon.ast.core {
    Annotations,
    FullPackageName,
    ModuleImport,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleImportToCeylon,
    compileModuleImport
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportModule=ImportModule
    }
}

shared object moduleImport satisfies ConcreteTest<ModuleImport,JImportModule> {
    
    String->ModuleImport construct(String->FullPackageName|StringLiteral name, String->StringLiteral version, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` import ``name.key`` ``version.key``;"->ModuleImport(name.item, version.item, annotations.item);
    
    shared String->ModuleImport ceylonAstCore100ModuleImport = construct(fullPackageName.ceylonAstCorePackageName, stringLiteral._100VersionStringLiteral, annotations.sharedAnnotations);
    
    compile = compileModuleImport;
    fromCeylon = RedHatTransformer.transformModuleImport;
    toCeylon = moduleImportToCeylon;
    codes = [ceylonAstCore100ModuleImport];
}
