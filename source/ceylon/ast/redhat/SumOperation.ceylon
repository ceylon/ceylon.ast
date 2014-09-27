import ceylon.ast.core {
    ScalingExpression,
    AddingExpression,
    SumOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSumOp=SumOp
    }
}

"Converts a RedHat AST [[SumOp|JSumOp]] to a `ceylon.ast` [[SumOperation]]."
shared SumOperation sumOperationToCeylon(JSumOp sumOperation) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(sumOperation.leftTerm),
        is ScalingExpression right = expressionToCeylon(sumOperation.rightTerm));
    return SumOperation(left, right);
}

"Compiles the given [[code]] for a Sum Operation
 into a [[SumOperation]] using the Ceylon compiler
 (more specifically, the rule for an `additiveExpression`)."
shared SumOperation? compileSumOperation(String code) {
    if (is JSumOp jAdditiveExpression = createParser(code).additiveExpression()) {
        return sumOperationToCeylon(jAdditiveExpression);
    } else {
        return null;
    }
}
