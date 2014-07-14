import ceylon.ast.core {
    LargeAsOperation,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLargeAsOp=LargeAsOp
    }
}

"Converts a RedHat AST [[LargeAsOp|JLargeAsOp]] to a `ceylon.ast` [[LargeAsOperation]]."
shared LargeAsOperation largeAsOperationToCeylon(JLargeAsOp largeAsOperation) {
    "Check precedence"
    assert (is Precedence10Expression left = expressionToCeylon(largeAsOperation.leftTerm),
        is Precedence10Expression right = expressionToCeylon(largeAsOperation.rightTerm));
    return LargeAsOperation(left, right);
}

"Compiles the given [[code]] for a Large As Operation
 into a [[LargeAsOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared LargeAsOperation? compileLargeAsOperation(String code) {
    if (is JLargeAsOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return largeAsOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
