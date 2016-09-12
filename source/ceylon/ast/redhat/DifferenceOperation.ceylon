import ceylon.ast.core {
    AddingExpression,
    DifferenceOperation,
    Node,
    ScalingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDifferenceOp=DifferenceOp
    }
}

"Converts a RedHat AST [[DifferenceOp|JDifferenceOp]] to a `ceylon.ast` [[DifferenceOperation]]."
shared DifferenceOperation differenceOperationToCeylon(JDifferenceOp differenceOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is AddingExpression left = expressionToCeylon(differenceOperation.leftTerm, update),
        is ScalingExpression right = expressionToCeylon(differenceOperation.rightTerm, update));
    value result = DifferenceOperation(left, right);
    update(differenceOperation, result);
    return result;
}

"Parses the given [[code]] for a Difference Operation
 into a [[DifferenceOperation]] using the Ceylon compiler
 (more specifically, the rule for an `additiveExpression`)."
shared DifferenceOperation? parseDifferenceOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JDifferenceOp jAdditiveExpression = createParser(code).additiveExpression()) {
        return differenceOperationToCeylon(jAdditiveExpression, update);
    } else {
        return null;
    }
}
