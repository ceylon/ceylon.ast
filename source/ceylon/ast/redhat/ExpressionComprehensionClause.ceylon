import ceylon.ast.core {
    ExpressionComprehensionClause
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionComprehensionClause=ExpressionComprehensionClause
    }
}

"Converts a RedHat AST [[ExpressionComprehensionClause|JExpressionComprehensionClause]] to a `ceylon.ast` [[ExpressionComprehensionClause]]."
shared ExpressionComprehensionClause expressionComprehensionClauseToCeylon(JExpressionComprehensionClause expressionComprehensionClause) {
    return ExpressionComprehensionClause(expressionToCeylon(expressionComprehensionClause.expression));
}

"Compiles the given [[code]] for an Expression Comprehension Clause
 into an [[ExpressionComprehensionClause]] using the Ceylon compiler
 (more specifically, the rule for an `expressionComprehensionClause`)."
shared ExpressionComprehensionClause? compileExpressionComprehensionClause(String code) {
    if (exists jExpressionComprehensionClause = createParser(code).expressionComprehensionClause()) {
        return expressionComprehensionClauseToCeylon(jExpressionComprehensionClause);
    } else {
        return null;
    }
}
