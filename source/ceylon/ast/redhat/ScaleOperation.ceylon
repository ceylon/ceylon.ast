import ceylon.ast.core {
    MultiplyingExpression,
    Node,
    ScalingExpression,
    ScaleOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JScaleOp=ScaleOp
    }
}

"Converts a RedHat AST [[ScaleOp|JScaleOp]] to a `ceylon.ast` [[ScaleOperation]]."
shared ScaleOperation scaleOperationToCeylon(JScaleOp scaleOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(scaleOperation.leftTerm, update),
        is ScalingExpression right = expressionToCeylon(scaleOperation.rightTerm, update));
    value result = ScaleOperation(left, right);
    update(scaleOperation, result);
    return result;
}

"Parses the given [[code]] for a Scale Operation
 into a [[ScaleOperation]] using the Ceylon compiler
 (more specifically, the rule for a `scaleExpression`)."
shared ScaleOperation? parseScaleOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JScaleOp jScaleExpression = createParser(code).scaleExpression()) {
        return scaleOperationToCeylon(jScaleExpression, update);
    } else {
        return null;
    }
}
