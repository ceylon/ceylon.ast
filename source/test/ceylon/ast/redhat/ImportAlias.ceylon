import ceylon.ast.core {
    ImportAlias
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importAliasToCeylon,
    parseImportAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object importAlias satisfies AbstractTest<ImportAlias,JAlias> {
    parse = parseImportAlias;
    fromCeylon = RedHatTransformer.transformImportAlias;
    toCeylon = importAliasToCeylon;
    
    tests = [importTypeAlias, importFunctionValueAlias];
}
