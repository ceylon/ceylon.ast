import ceylon.ast.core {
    IdenticalOperation,
    Precedence11Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIdenticalOp=IdenticalOp
    }
}

"Converts a RedHat AST [[IdenticalOp|JIdenticalOp]] to a `ceylon.ast` [[IdenticalOperation]]."
shared IdenticalOperation identicalOperationToCeylon(JIdenticalOp identicalOperation) {
    "Check precedence"
    assert (is Precedence11Expression left = expressionToCeylon(identicalOperation.leftTerm),
        is Precedence11Expression right = expressionToCeylon(identicalOperation.rightTerm));
    return IdenticalOperation(left, right);
}

"Compiles the given [[code]] for an Identical Operation
 into an [[IdenticalOperation]] using the Ceylon compiler
 (more specifically, the rule for an `equalityExpression`)."
shared IdenticalOperation? compileIdenticalOperation(String code) {
    if (is JIdenticalOp jEqualityExpression = createParser(code).equalityExpression()) {
        return identicalOperationToCeylon(jEqualityExpression);
    } else {
        return null;
    }
}
