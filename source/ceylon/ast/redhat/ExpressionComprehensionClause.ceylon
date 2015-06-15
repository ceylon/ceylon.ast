import ceylon.ast.core {
    ExpressionComprehensionClause,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExpressionComprehensionClause=ExpressionComprehensionClause
    }
}

"Converts a RedHat AST [[ExpressionComprehensionClause|JExpressionComprehensionClause]] to a `ceylon.ast` [[ExpressionComprehensionClause]]."
shared ExpressionComprehensionClause expressionComprehensionClauseToCeylon(JExpressionComprehensionClause expressionComprehensionClause, Anything(JNode,Node) update = noop) {
    value result = ExpressionComprehensionClause(expressionToCeylon(expressionComprehensionClause.expression, update));
    update(expressionComprehensionClause, result);
    return result;
}

"Compiles the given [[code]] for an Expression Comprehension Clause
 into an [[ExpressionComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for an `expressionComprehensionClause`)."
shared ExpressionComprehensionClause? compileExpressionComprehensionClause(String code, Anything(JNode,Node) update = noop) {
    if (exists jExpressionComprehensionClause = createParser(code).expressionComprehensionClause()) {
        return expressionComprehensionClauseToCeylon(jExpressionComprehensionClause, update);
    } else {
        return null;
    }
}
