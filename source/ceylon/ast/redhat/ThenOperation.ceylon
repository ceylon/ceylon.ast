import ceylon.ast.core {
    ThenOperation,
    Precedence15Expression,
    Precedence16Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JThenOp=ThenOp
    }
}

"Converts a RedHat AST [[ThenOp|JThenOp]] to a `ceylon.ast` [[ThenOperation]]."
shared ThenOperation thenOperationToCeylon(JThenOp thenOperation) {
    "Check precedence"
    assert (is Precedence16Expression left = expressionToCeylon(thenOperation.leftTerm),
        is Precedence15Expression right = expressionToCeylon(thenOperation.rightTerm));
    return ThenOperation(left, right);
}

"Compiles the given [[code]] for a Then Operation
 into a [[ThenOperation]] using the Ceylon compiler
 (more specifically, the rule for a `thenElseExpression`)."
shared ThenOperation? compileThenOperation(String code) {
    if (is JThenOp jThenElseExpression = createParser(code).thenElseExpression()) {
        return thenOperationToCeylon(jThenElseExpression);
    } else {
        return null;
    }
}
