import ceylon.ast.core {
    NegationOperation,
    ExponentiatingExpression,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JNegativeOp=NegativeOp
    }
}

"Converts a RedHat AST [[NegativeOp|JNegativeOp]] to a `ceylon.ast` [[NegationOperation]]."
shared NegationOperation negationOperationToCeylon(JNegativeOp negationOperation, Anything(JNode, Node) update = noop) {
    assert (is ExponentiatingExpression operand = expressionToCeylon(negationOperation.term, update));
    value result = NegationOperation(operand);
    update(negationOperation, result);
    return result;
}

"Parses the given [[code]] for a Negation Operation
 into a [[NegationOperation]] using the Ceylon compiler
 (more specifically, the rule for a `negationComplementExpression`)."
shared NegationOperation? parseNegationOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JNegativeOp jNegationComplementExpression = createParser(code).negationComplementExpression()) {
        return negationOperationToCeylon(jNegationComplementExpression, update);
    } else {
        return null;
    }
}
