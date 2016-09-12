import ceylon.ast.core {
    ImportTypeAlias,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importTypeAliasToCeylon,
    parseImportTypeAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object importTypeAlias satisfies ConcreteTest<ImportTypeAlias,JAlias> {
    
    String->ImportTypeAlias construct(String->UIdentifier name)
            => "``name.key``="->ImportTypeAlias(name.item);
    
    shared String->ImportTypeAlias uidImportTypeAlias = construct(identifier.uidUIdentifier);
    
    // not tested directly, but used by other tests
    shared String->ImportTypeAlias jstringImportTypeAlias = construct(identifier.jstringUIdentifier);
    
    parse = parseImportTypeAlias;
    fromCeylon = RedHatTransformer.transformImportTypeAlias;
    toCeylon = importTypeAliasToCeylon;
    codes = [uidImportTypeAlias];
}
