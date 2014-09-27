import ceylon.ast.core {
    MultiplyingExpression,
    ScalingExpression,
    ScaleOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JScaleOp=ScaleOp
    }
}

"Converts a RedHat AST [[ScaleOp|JScaleOp]] to a `ceylon.ast` [[ScaleOperation]]."
shared ScaleOperation scaleOperationToCeylon(JScaleOp scaleOperation) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(scaleOperation.leftTerm),
        is ScalingExpression right = expressionToCeylon(scaleOperation.rightTerm));
    return ScaleOperation(left, right);
}

"Compiles the given [[code]] for a Scale Operation
 into a [[ScaleOperation]] using the Ceylon compiler
 (more specifically, the rule for a `scaleExpression`)."
shared ScaleOperation? compileScaleOperation(String code) {
    if (is JScaleOp jScaleExpression = createParser(code).scaleExpression()) {
        return scaleOperationToCeylon(jScaleExpression);
    } else {
        return null;
    }
}
