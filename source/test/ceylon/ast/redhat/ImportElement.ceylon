import ceylon.ast.core {
    ImportElement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importElementToCeylon,
    compileImportElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

shared object importElement satisfies AbstractTest<ImportElement,JImportMemberOrType> {
    compile = compileImportElement;
    fromCeylon = RedHatTransformer.transformImportElement;
    toCeylon = importElementToCeylon;
    
    tests = [importTypeElement, importFunctionValueElement];
}
