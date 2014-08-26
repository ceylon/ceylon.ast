import ceylon.ast.core {
    IfComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIfComprehensionClause=IfComprehensionClause
    }
}

"Converts a RedHat AST [[IfComprehensionClause|JIfComprehensionClause]] to a `ceylon.ast` [[IfComprehensionClause]]."
shared IfComprehensionClause ifComprehensionClauseToCeylon(JIfComprehensionClause ifComprehensionClause) {
    return IfComprehensionClause(conditionListToCeylon(ifComprehensionClause.conditionList), comprehensionClauseToCeylon(ifComprehensionClause.comprehensionClause));
}

"Compiles the given [[code]] for an If Comprehension Clause
 into an [[IfComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for an `ifComprehensionClause`)."
shared IfComprehensionClause? compileIfComprehensionClause(String code) {
    if (exists jIfComprehensionClause = createParser(code).ifComprehensionClause()) {
        return ifComprehensionClauseToCeylon(jIfComprehensionClause);
    } else {
        return null;
    }
}
