import ceylon.ast.core {
    CaseItem
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCaseItem=CaseItem,
        JIsCase=IsCase,
        JMatchCase=MatchCase,
        JSatisfiesCase=SatisfiesCase
    }
}

"Converts a RedHat AST [[CaseItem|JCaseItem]] to a `ceylon.ast` [[CaseItem]]."
shared CaseItem caseItemToCeylon(JCaseItem caseItem) {
    assert (is JMatchCase|JIsCase|JSatisfiesCase caseItem);
    switch (caseItem)
    case (is JMatchCase) { return matchCaseToCeylon(caseItem); }
    case (is JIsCase) { return isCaseToCeylon(caseItem); }
    case (is JSatisfiesCase) {
        throw AssertionError("satisfies cases not yet supported");
    }
}

"Compiles the given [[code]] for a Case Item
 into a [[CaseItem]] using the Ceylon compiler
 (more specifically, the rule for a `caseItem`)."
shared CaseItem? compileCaseItem(String code) {
    if (exists jCaseItem = createParser(code).caseItem()) {
        return caseItemToCeylon(jCaseItem);
    } else {
        return null;
    }
}
