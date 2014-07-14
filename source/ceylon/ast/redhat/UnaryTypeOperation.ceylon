import ceylon.ast.core {
    UnaryTypeOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIsOp=IsOp,
        JOfOp=OfOp,
        JTypeOperatorExpression=TypeOperatorExpression
    }
}

"Converts a RedHat AST [[TypeOperatorExpression|JTypeOperatorExpression]] to a `ceylon.ast` [[UnaryTypeOperation]]."
shared UnaryTypeOperation unaryTypeOperationToCeylon(JTypeOperatorExpression unaryTypeOperation) {
    assert (is JIsOp|JOfOp unaryTypeOperation);
    switch (unaryTypeOperation)
    case (is JIsOp) { return isOperationToCeylon(unaryTypeOperation); }
    case (is JOfOp) { return ofOperationToCeylon(unaryTypeOperation); }
}

"Compiles the given [[code]] for an Unary Type Operation
 into an [[UnaryTypeOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared UnaryTypeOperation? compileUnaryTypeOperation(String code) {
    if (is JTypeOperatorExpression jUnaryTypeOperation = createParser(code).comparisonExpression()) {
        return unaryTypeOperationToCeylon(jUnaryTypeOperation);
    } else {
        return null;
    }
}
