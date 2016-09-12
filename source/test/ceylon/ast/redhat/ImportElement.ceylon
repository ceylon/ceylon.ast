import ceylon.ast.core {
    ImportElement
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importElementToCeylon,
    parseImportElement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImportMemberOrType=ImportMemberOrType
    }
}

shared object importElement satisfies AbstractTest<ImportElement,JImportMemberOrType> {
    parse = parseImportElement;
    fromCeylon = RedHatTransformer.transformImportElement;
    toCeylon = importElementToCeylon;
    
    tests = [importTypeElement, importFunctionValueElement];
}
