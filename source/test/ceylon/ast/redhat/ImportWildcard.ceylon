import ceylon.ast.core {
    ImportWildcard
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importWildcardToCeylon,
    parseImportWildcard
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportWildcard=ImportWildcard
    }
}

shared object importWildcard satisfies ConcreteTest<ImportWildcard,JImportWildcard> {
    
    shared String->ImportWildcard importWildcard = "..."->ImportWildcard();
    
    parse = parseImportWildcard;
    fromCeylon = RedHatTransformer.transformImportWildcard;
    toCeylon = importWildcardToCeylon;
    codes = [importWildcard];
}
