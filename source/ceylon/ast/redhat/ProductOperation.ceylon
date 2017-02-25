import ceylon.ast.core {
    Node,
    UnioningExpression,
    MultiplyingExpression,
    ProductOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JProductOp=ProductOp
    }
}

"Converts a RedHat AST [[ProductOp|JProductOp]] to a `ceylon.ast` [[ProductOperation]]."
shared ProductOperation productOperationToCeylon(JProductOp productOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(productOperation.leftTerm, update),
        is UnioningExpression right = expressionToCeylon(productOperation.rightTerm, update));
    value result = ProductOperation(left, right);
    update(productOperation, result);
    return result;
}

"Parses the given [[code]] for a Product Operation
 into a [[ProductOperation]] using the Ceylon compiler
 (more specifically, the rule for a `multiplicativeExpression`)."
shared ProductOperation? parseProductOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JProductOp jMultiplicativeExpression = createParser(code).multiplicativeExpression()) {
        return productOperationToCeylon(jMultiplicativeExpression, update);
    } else {
        return null;
    }
}
