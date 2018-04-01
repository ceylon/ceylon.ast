import ceylon.ast.core {
    ModuleBody,
    ModuleImport,
    ValueDefinition
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleBodyToCeylon,
    parseModuleBody
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JImportModuleList=ImportModuleList
    }
}

shared object moduleBody satisfies ConcreteTest<ModuleBody,JImportModuleList> {
    
    String->ModuleBody construct(<String->ModuleImport>[] moduleImports = [], <String->ValueDefinition>[] constantDefinitions = [])
            => "{``"".join(constantDefinitions*.key)````"".join(moduleImports*.key)``}" -> ModuleBody(moduleImports*.item, constantDefinitions*.item);
    
    shared String->ModuleBody emptyModuleBody = construct();
    shared String->ModuleBody nonemptyModuleBody = construct([moduleImport.ceylonAstCore100ModuleImport], [valueDefinition.languageVersion133Definition]);
    
    parse = parseModuleBody;
    fromCeylon = RedHatTransformer.transformModuleBody;
    toCeylon = moduleBodyToCeylon;
    codes = [emptyModuleBody, nonemptyModuleBody];
}
