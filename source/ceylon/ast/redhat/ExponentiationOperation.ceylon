import ceylon.ast.core {
    ExponentiatingExpression,
    ExponentiationOperation,
    Node,
    PrePostfixingExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPowerOp=PowerOp
    }
}

"Converts a RedHat AST [[PowerOp|JPowerOp]] to a `ceylon.ast` [[ExponentiationOperation]]."
shared ExponentiationOperation exponentiationOperationToCeylon(JPowerOp exponentiationExpression, Anything(JNode, Node) update = noop) {
    assert (is PrePostfixingExpression left = expressionToCeylon(exponentiationExpression.leftTerm, update));
    assert (is ExponentiatingExpression right = expressionToCeylon(exponentiationExpression.rightTerm, update));
    value result = ExponentiationOperation(left, right);
    update(exponentiationExpression, result);
    return result;
}

"Parses the given [[code]] for an Exponentiation Operation
 into an [[ExponentiationOperation]] using the Ceylon compiler
 (more specifically, the rule for an `exponentiationExpression`)."
shared ExponentiationOperation? parseExponentiationOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JPowerOp jExponentiationExpression = createParser(code).exponentiationExpression()) {
        return exponentiationOperationToCeylon(jExponentiationExpression, update);
    } else {
        return null;
    }
}
