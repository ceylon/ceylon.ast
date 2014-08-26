import ceylon.ast.core {
    ForComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForComprehensionClause=ForComprehensionClause
    }
}

"Converts a RedHat AST [[ForComprehensionClause|JForComprehensionClause]] to a `ceylon.ast` [[ForComprehensionClause]]."
shared ForComprehensionClause forComprehensionClauseToCeylon(JForComprehensionClause forComprehensionClause) {
    return ForComprehensionClause(forIteratorToCeylon(forComprehensionClause.forIterator), comprehensionClauseToCeylon(forComprehensionClause.comprehensionClause));
}

"Compiles the given [[code]] for a For Comprehension Clause
 into a [[ForComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for a `forComprehensionClause`)."
shared ForComprehensionClause? compileForComprehensionClause(String code) {
    if (exists jForComprehensionClause = createParser(code).forComprehensionClause()) {
        return forComprehensionClauseToCeylon(jForComprehensionClause);
    } else {
        return null;
    }
}
