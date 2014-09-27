import ceylon.ast.core {
    RemainderOperation,
    UnioningExpression,
    MultiplyingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JRemainderOp=RemainderOp
    }
}

"Converts a RedHat AST [[RemainderOp|JRemainderOp]] to a `ceylon.ast` [[RemainderOperation]]."
shared RemainderOperation remainderOperationToCeylon(JRemainderOp remainderOperation) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(remainderOperation.leftTerm),
        is UnioningExpression right = expressionToCeylon(remainderOperation.rightTerm));
    return RemainderOperation(left, right);
}

"Compiles the given [[code]] for a Remainder Operation
 into a [[RemainderOperation]] using the Ceylon compiler
 (more specifically, the rule for a `multiplicativeExpression`)."
shared RemainderOperation? compileRemainderOperation(String code) {
    if (is JRemainderOp jMultiplicativeExpression = createParser(code).multiplicativeExpression()) {
        return remainderOperationToCeylon(jMultiplicativeExpression);
    } else {
        return null;
    }
}
