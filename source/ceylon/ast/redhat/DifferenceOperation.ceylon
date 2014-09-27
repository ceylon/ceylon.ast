import ceylon.ast.core {
    DifferenceOperation,
    ScalingExpression,
    AddingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDifferenceOp=DifferenceOp
    }
}

"Converts a RedHat AST [[DifferenceOp|JDifferenceOp]] to a `ceylon.ast` [[DifferenceOperation]]."
shared DifferenceOperation differenceOperationToCeylon(JDifferenceOp differenceOperation) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(differenceOperation.leftTerm),
        is ScalingExpression right = expressionToCeylon(differenceOperation.rightTerm));
    return DifferenceOperation(left, right);
}

"Compiles the given [[code]] for a Difference Operation
 into a [[DifferenceOperation]] using the Ceylon compiler
 (more specifically, the rule for an `additiveExpression`)."
shared DifferenceOperation? compileDifferenceOperation(String code) {
    if (is JDifferenceOp jAdditiveExpression = createParser(code).additiveExpression()) {
        return differenceOperationToCeylon(jAdditiveExpression);
    } else {
        return null;
    }
}
