import ceylon.ast.core {
    Precedence4Expression,
    Precedence5Expression,
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
    assert (is Precedence5Expression left = expressionToCeylon(complementOperation.leftTerm),
        is Precedence4Expression right = expressionToCeylon(complementOperation.rightTerm));
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
