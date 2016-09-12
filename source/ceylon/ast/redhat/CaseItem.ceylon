import ceylon.ast.core {
    CaseItem,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCaseItem=CaseItem,
        JIsCase=IsCase,
        JMatchCase=MatchCase,
        JSatisfiesCase=SatisfiesCase
    }
}

"Converts a RedHat AST [[CaseItem|JCaseItem]] to a `ceylon.ast` [[CaseItem]]."
shared CaseItem caseItemToCeylon(JCaseItem caseItem, Anything(JNode,Node) update = noop) {
    assert (is JMatchCase|JIsCase|JSatisfiesCase caseItem);
    switch (caseItem)
    case (is JMatchCase) { return matchCaseToCeylon(caseItem, update); }
    case (is JIsCase) { return isCaseToCeylon(caseItem, update); }
    case (is JSatisfiesCase) {
        throw AssertionError("satisfies cases not yet supported");
    }
}

"Parses the given [[code]] for a Case Item
 into a [[CaseItem]] using the Ceylon compiler
 (more specifically, the rule for a `caseItem`)."
shared CaseItem? parseCaseItem(String code, Anything(JNode,Node) update = noop) {
    if (exists jCaseItem = createParser(code).caseItem()) {
        return caseItemToCeylon(jCaseItem, update);
    } else {
        return null;
    }
}
