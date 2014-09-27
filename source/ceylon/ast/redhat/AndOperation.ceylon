import ceylon.ast.core {
    AndOperation,
    NegatingExpression,
    ConjoiningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAndOp=AndOp
    }
}

"Converts a RedHat AST [[AndOp|JAndOp]] to a `ceylon.ast` [[AndOperation]]."
shared AndOperation andOperationToCeylon(JAndOp andOperation) {
    "Check precedence"
    assert (is ConjoiningExpression left = expressionToCeylon(andOperation.leftTerm),
        is NegatingExpression right = expressionToCeylon(andOperation.rightTerm));
    return AndOperation(left, right);
}

"Compiles the given [[code]] for an And Operation
 into an [[AndOperation]] using the Ceylon compiler
 (more specifically, the rule for an `conjunctionExpression`)."
shared AndOperation? compileAndOperation(String code) {
    if (is JAndOp jConjunctionExpression = createParser(code).conjunctionExpression()) {
        return andOperationToCeylon(jConjunctionExpression);
    } else {
        return null;
    }
}
