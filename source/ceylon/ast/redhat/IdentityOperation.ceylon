import ceylon.ast.core {
    IdentityOperation,
    ExponentiatingExpression,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPositiveOp=PositiveOp
    }
}

"Converts a RedHat AST [[PositiveOp|JPositiveOp]] to a `ceylon.ast` [[IdentityOperation]]."
shared IdentityOperation identityOperationToCeylon(JPositiveOp identityOperation, Anything(JNode, Node) update = noop) {
    assert (is ExponentiatingExpression operand = expressionToCeylon(identityOperation.term, update));
    value result = IdentityOperation(operand);
    update(identityOperation, result);
    return result;
}

"Parses the given [[code]] for an Identity Operation
 into an [[IdentityOperation]] using the Ceylon compiler
 (more specifically, the rule for an `negationComplementExpression`)."
shared IdentityOperation? parseIdentityOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JPositiveOp jNegationComplementExpression = createParser(code).negationComplementExpression()) {
        return identityOperationToCeylon(jNegationComplementExpression, update);
    } else {
        return null;
    }
}
