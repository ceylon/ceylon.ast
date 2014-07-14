import ceylon.ast.core {
    Precedence10Expression,
    SmallerOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSmallerOp=SmallerOp
    }
}

"Converts a RedHat AST [[SmallerOp|JSmallerOp]] to a `ceylon.ast` [[SmallerOperation]]."
shared SmallerOperation smallerOperationToCeylon(JSmallerOp smallerOperation) {
    "Check precedence"
    assert (is Precedence10Expression left = expressionToCeylon(smallerOperation.leftTerm),
        is Precedence10Expression right = expressionToCeylon(smallerOperation.rightTerm));
    return SmallerOperation(left, right);
}

"Compiles the given [[code]] for a Smaller Operation
 into a [[SmallerOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared SmallerOperation? compileSmallerOperation(String code) {
    if (is JSmallerOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return smallerOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
