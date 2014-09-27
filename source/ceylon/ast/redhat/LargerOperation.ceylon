import ceylon.ast.core {
    LargerOperation,
    ExistsNonemptyExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLargerOp=LargerOp
    }
}

"Converts a RedHat AST [[LargerOp|JLargerOp]] to a `ceylon.ast` [[LargerOperation]]."
shared LargerOperation largerOperationToCeylon(JLargerOp largerOperation) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(largerOperation.leftTerm),
        is ExistsNonemptyExpression right = expressionToCeylon(largerOperation.rightTerm));
    return LargerOperation(left, right);
}

"Compiles the given [[code]] for a Larger Operation
 into a [[LargerOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared LargerOperation? compileLargerOperation(String code) {
    if (is JLargerOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return largerOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
