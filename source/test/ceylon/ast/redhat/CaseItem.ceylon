import ceylon.ast.core {
    CaseItem
}
import ceylon.ast.redhat {
    RedHatTransformer,
    caseItemToCeylon,
    parseCaseItem
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCaseItem=CaseItem
    }
}

shared object caseItem satisfies AbstractTest<CaseItem,JCaseItem> {
    parse = parseCaseItem;
    fromCeylon = RedHatTransformer.transformCaseItem;
    toCeylon = caseItemToCeylon;
    
    tests = [matchCase, isCase];
}
