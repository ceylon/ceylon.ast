import ceylon.ast.core {
    OrOperation,
    ConjoiningExpression,
    DisjoiningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrOp=OrOp
    }
}

"Converts a RedHat AST [[OrOp|JOrOp]] to a `ceylon.ast` [[OrOperation]]."
shared OrOperation orOperationToCeylon(JOrOp orOperation) {
    "Check precedence"
    assert (is DisjoiningExpression left = expressionToCeylon(orOperation.leftTerm),
        is ConjoiningExpression right = expressionToCeylon(orOperation.rightTerm));
    return OrOperation(left, right);
}

"Compiles the given [[code]] for an Or Operation
 into an [[OrOperation]] using the Ceylon compiler
 (more specifically, the rule for an `disjunctionExpression`)."
shared OrOperation? compileOrOperation(String code) {
    if (is JOrOp jDisjunctionExpression = createParser(code).disjunctionExpression()) {
        return orOperationToCeylon(jDisjunctionExpression);
    } else {
        return null;
    }
}
