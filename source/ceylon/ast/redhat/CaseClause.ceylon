import ceylon.ast.core {
    CaseClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCaseClause=CaseClause
    }
}

"Converts a RedHat AST [[CaseClause|JCaseClause]] to a `ceylon.ast` [[CaseClause]]."
shared CaseClause caseClauseToCeylon(JCaseClause caseClause) {
    return CaseClause(caseItemToCeylon(caseClause.caseItem), blockToCeylon(caseClause.block));
}

"Compiles the given [[code]] for a Case Clause
 into a [[CaseClause]] using the Ceylon compiler
 (more specifically, the rule for a `caseBlock`)."
shared CaseClause? compileCaseClause(String code) {
    if (exists jCaseBlock = createParser(code).caseBlock()) {
        return caseClauseToCeylon(jCaseBlock);
    } else {
        return null;
    }
}
