import ceylon.ast.core {
    IfComprehensionClause,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIfComprehensionClause=IfComprehensionClause
    }
}

"Converts a RedHat AST [[IfComprehensionClause|JIfComprehensionClause]] to a `ceylon.ast` [[IfComprehensionClause]]."
shared IfComprehensionClause ifComprehensionClauseToCeylon(JIfComprehensionClause ifComprehensionClause, Anything(JNode, Node) update = noop) {
    value result = IfComprehensionClause(conditionsToCeylon(ifComprehensionClause.conditionList, update), comprehensionClauseToCeylon(ifComprehensionClause.comprehensionClause, update));
    update(ifComprehensionClause, result);
    return result;
}

"Parses the given [[code]] for an If Comprehension Clause
 into an [[IfComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for an `ifComprehensionClause`)."
shared IfComprehensionClause? parseIfComprehensionClause(String code, Anything(JNode, Node) update = noop) {
    if (exists jIfComprehensionClause = createParser(code).ifComprehensionClause()) {
        return ifComprehensionClauseToCeylon(jIfComprehensionClause, update);
    } else {
        return null;
    }
}
