import ceylon.ast.core {
    IntersectingExpression,
    UnioningExpression,
    ComplementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComplementOp=ComplementOp
    }
}

"Converts a RedHat AST [[ComplementOp|JComplementOp]] to a `ceylon.ast` [[ComplementOperation]]."
shared ComplementOperation complementOperationToCeylon(JComplementOp complementOperation) {
    "Check precedence"
    assert (is UnioningExpression left = expressionToCeylon(complementOperation.leftTerm),
        is IntersectingExpression right = expressionToCeylon(complementOperation.rightTerm));
    return ComplementOperation(left, right);
}

"Compiles the given [[code]] for a Complement Operation
 into a [[ComplementOperation]] using the Ceylon compiler
 (more specifically, the rule for a `unionExpression`)."
shared ComplementOperation? compileComplementOperation(String code) {
    if (is JComplementOp jComplementOperation = createParser(code).unionExpression()) {
        return complementOperationToCeylon(jComplementOperation);
    } else {
        return null;
    }
}
