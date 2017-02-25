import ceylon.ast.core {
    Node,
    ScalingExpression,
    AddingExpression,
    SumOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSumOp=SumOp
    }
}

"Converts a RedHat AST [[SumOp|JSumOp]] to a `ceylon.ast` [[SumOperation]]."
shared SumOperation sumOperationToCeylon(JSumOp sumOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(sumOperation.leftTerm, update),
        is ScalingExpression right = expressionToCeylon(sumOperation.rightTerm, update));
    value result = SumOperation(left, right);
    update(sumOperation, result);
    return result;
}

"Parses the given [[code]] for a Sum Operation
 into a [[SumOperation]] using the Ceylon compiler
 (more specifically, the rule for an `additiveExpression`)."
shared SumOperation? parseSumOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JSumOp jAdditiveExpression = createParser(code).additiveExpression()) {
        return sumOperationToCeylon(jAdditiveExpression, update);
    } else {
        return null;
    }
}
