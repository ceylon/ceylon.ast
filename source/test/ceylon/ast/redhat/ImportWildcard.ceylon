import ceylon.ast.core {
    ImportWildcard
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importWildcardToCeylon,
    compileImportWildcard
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportWildcard=ImportWildcard
    }
}

shared object importWildcard satisfies ConcreteTest<ImportWildcard,JImportWildcard> {
    
    shared String->ImportWildcard importWildcard = "..."->ImportWildcard();
    
    compile = compileImportWildcard;
    fromCeylon = RedHatTransformer.transformImportWildcard;
    toCeylon = importWildcardToCeylon;
    codes = [importWildcard];
}
