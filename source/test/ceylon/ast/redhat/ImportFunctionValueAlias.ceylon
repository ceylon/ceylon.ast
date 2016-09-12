import ceylon.ast.core {
    ImportFunctionValueAlias,
    LIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importFunctionValueAliasToCeylon,
    parseImportFunctionValueAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object importFunctionValueAlias satisfies ConcreteTest<ImportFunctionValueAlias,JAlias> {
    
    String->ImportFunctionValueAlias construct(String->LIdentifier name)
            => "``name.key``="->ImportFunctionValueAlias(name.item);
    
    shared String->ImportFunctionValueAlias lidImportFunctionValueAlias = construct(identifier.lidLIdentifier);
    
    // not tested directly, but used by other tests
    shared String->ImportFunctionValueAlias sysoutImportFunctionValueAlias = construct(identifier.sysoutLIdentifier);
    
    parse = parseImportFunctionValueAlias;
    fromCeylon = RedHatTransformer.transformImportFunctionValueAlias;
    toCeylon = importFunctionValueAliasToCeylon;
    codes = [lidImportFunctionValueAlias];
}
