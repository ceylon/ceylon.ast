import ceylon.ast.core {
    ComplementOperation,
    IntersectingExpression,
    Node,
    UnioningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JComplementOp=ComplementOp
    }
}

"Converts a RedHat AST [[ComplementOp|JComplementOp]] to a `ceylon.ast` [[ComplementOperation]]."
shared ComplementOperation complementOperationToCeylon(JComplementOp complementOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is UnioningExpression left = expressionToCeylon(complementOperation.leftTerm, update),
        is IntersectingExpression right = expressionToCeylon(complementOperation.rightTerm, update));
    value result = ComplementOperation(left, right);
    update(complementOperation, result);
    return result;
}

"Compiles the given [[code]] for a Complement Operation
 into a [[ComplementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `unionExpression`)."
shared ComplementOperation? compileComplementOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JComplementOp jComplementOperation = createParser(code).unionExpression()) {
        return complementOperationToCeylon(jComplementOperation, update);
    } else {
        return null;
    }
}
