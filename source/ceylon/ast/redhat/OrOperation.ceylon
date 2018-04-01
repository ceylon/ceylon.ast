import ceylon.ast.core {
    ConjoiningExpression,
    DisjoiningExpression,
    Node,
    OrOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JOrOp=OrOp
    }
}

"Converts a RedHat AST [[OrOp|JOrOp]] to a `ceylon.ast` [[OrOperation]]."
shared OrOperation orOperationToCeylon(JOrOp orOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is DisjoiningExpression left = expressionToCeylon(orOperation.leftTerm, update),
        is ConjoiningExpression right = expressionToCeylon(orOperation.rightTerm, update));
    value result = OrOperation(left, right);
    update(orOperation, result);
    return result;
}

"Parses the given [[code]] for an Or Operation
 into an [[OrOperation]] using the Ceylon compiler
 (more specifically, the rule for an `disjunctionExpression`)."
shared OrOperation? parseOrOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JOrOp jDisjunctionExpression = createParser(code).disjunctionExpression()) {
        return orOperationToCeylon(jDisjunctionExpression, update);
    } else {
        return null;
    }
}
