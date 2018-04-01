import ceylon.ast.core {
    Identifier,
    ImportAlias
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importAliasToCeylon,
    parseImportAlias
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object importAlias satisfies ConcreteTest<ImportAlias,JAlias> {
    
    String->ImportAlias construct(String->Identifier name)
            => "``name.key``=" -> ImportAlias(name.item);
    
    shared String->ImportAlias uidImportAlias = construct(identifier.uidUIdentifier);
    shared String->ImportAlias lidImportAlias = construct(identifier.lidLIdentifier);
    
    // not tested directly, but used by other tests
    shared String->ImportAlias jstringImportAlias = construct(identifier.jstringUIdentifier);
    shared String->ImportAlias sysoutImportAlias = construct(identifier.sysoutLIdentifier);
    
    parse = parseImportAlias;
    fromCeylon = RedHatTransformer.transformImportAlias;
    toCeylon = importAliasToCeylon;
    codes = [uidImportAlias, lidImportAlias];
}
