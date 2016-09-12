import ceylon.ast.core {
    ModuleBody,
    ModuleImport
}
import ceylon.ast.redhat {
    RedHatTransformer,
    moduleBodyToCeylon,
    parseModuleBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportModuleList=ImportModuleList
    }
}

shared object moduleBody satisfies ConcreteTest<ModuleBody,JImportModuleList> {
    
    String->ModuleBody construct(<String->ModuleImport>* moduleImports)
            => "{``"".join(moduleImports*.key)``}"->ModuleBody(moduleImports*.item);
    
    shared String->ModuleBody emptyModuleBody = construct();
    shared String->ModuleBody nonemptyModuleBody = construct(moduleImport.ceylonAstCore100ModuleImport);
    
    parse = parseModuleBody;
    fromCeylon = RedHatTransformer.transformModuleBody;
    toCeylon = moduleBodyToCeylon;
    codes = [emptyModuleBody, nonemptyModuleBody];
}
