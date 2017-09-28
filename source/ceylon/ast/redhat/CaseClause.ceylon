import ceylon.ast.core {
    CaseClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCaseClause=CaseClause
    }
}

"Converts a RedHat AST [[CaseClause|JCaseClause]] to a `ceylon.ast` [[CaseClause]]."
shared CaseClause caseClauseToCeylon(JCaseClause caseClause, Anything(JNode, Node) update = noop) {
    value result = CaseClause(caseItemToCeylon(caseClause.caseItem, update), blockToCeylon(caseClause.block, update), caseClause.overlapping);
    update(caseClause, result);
    return result;
}

"Parses the given [[code]] for a Case Clause
 into a [[CaseClause]] using the Ceylon compiler
 (more specifically, the rule for a `caseBlock`)."
shared CaseClause? parseCaseClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jCaseBlock = createParser(code).caseBlock()) {
        return caseClauseToCeylon(jCaseBlock, update);
    } else {
        return null;
    }
}
