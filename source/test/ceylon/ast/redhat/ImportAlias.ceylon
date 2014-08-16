import ceylon.ast.core {
    ImportAlias
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importAliasToCeylon,
    compileImportAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object importAlias satisfies AbstractTest<ImportAlias,JAlias> {
    compile = compileImportAlias;
    fromCeylon = RedHatTransformer.transformImportAlias;
    toCeylon = importAliasToCeylon;
    
    tests = [importTypeAlias, importFunctionValueAlias];
}
