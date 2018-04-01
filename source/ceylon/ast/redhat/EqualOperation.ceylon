import ceylon.ast.core {
    EqualOperation,
    ComparingExpression,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEqualOp=EqualOp
    }
}

"Converts a RedHat AST [[EqualOp|JEqualOp]] to a `ceylon.ast` [[EqualOperation]]."
shared EqualOperation equalOperationToCeylon(JEqualOp equalOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ComparingExpression left = expressionToCeylon(equalOperation.leftTerm, update),
        is ComparingExpression right = expressionToCeylon(equalOperation.rightTerm, update));
    value result = EqualOperation(left, right);
    update(equalOperation, result);
    return result;
}

"Parses the given [[code]] for an Equal Operation
 into an [[EqualOperation]] using the Ceylon compiler
 (more specifically, the rule for an `equalityExpression`)."
shared EqualOperation? parseEqualOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JEqualOp jEqualityExpression = createParser(code).equalityExpression()) {
        return equalOperationToCeylon(jEqualityExpression, update);
    } else {
        return null;
    }
}
