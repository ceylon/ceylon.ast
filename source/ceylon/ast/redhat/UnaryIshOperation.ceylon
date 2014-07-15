import ceylon.ast.core {
    UnaryIshOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExists=Exists,
        JNegativeOp=NegativeOp,
        JNonempty=Nonempty,
        JNotOp=NotOp,
        JPositiveOp=PositiveOp,
        JPostfixOperatorExpression=PostfixOperatorExpression,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JTypeOperatorExpression=TypeOperatorExpression,
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

"Converts a RedHat AST [[UnaryOperatorExpression|JUnaryOperatorExpression]] to a `ceylon.ast` [[UnaryIshOperation]]."
shared UnaryIshOperation unaryIshOperationToCeylon(JUnaryOperatorExpression unaryIshOperation) {
    assert (is JPostfixOperatorExpression|JPrefixOperatorExpression|JNegativeOp|JPositiveOp|JExists|JNonempty|JTypeOperatorExpression|JNotOp unaryIshOperation);
    switch (unaryIshOperation)
    case (is JPostfixOperatorExpression) { return postfixOperationToCeylon(unaryIshOperation); }
    case (is JPrefixOperatorExpression) { return prefixOperationToCeylon(unaryIshOperation); }
    case (is JNegativeOp) { return negationOperationToCeylon(unaryIshOperation); }
    case (is JPositiveOp) { return identityOperationToCeylon(unaryIshOperation); }
    case (is JExists) { return existsOperationToCeylon(unaryIshOperation); }
    case (is JNonempty) { return nonemptyOperationToCeylon(unaryIshOperation); }
    case (is JTypeOperatorExpression) { return unaryTypeOperationToCeylon(unaryIshOperation); }
    case (is JNotOp) { return notOperationToCeylon(unaryIshOperation); }
}

"Compiles the given [[code]] for an Unary Ish Operation
 into an [[UnaryIshOperation]] using the Ceylon compiler
 (more specifically, the rule for an `unaryIshOperation`)."
shared UnaryIshOperation? compileUnaryIshOperation(String code) {
    if (is JUnaryOperatorExpression jUnaryExpression = createParser(code).assignmentExpression()) {
        return unaryIshOperationToCeylon(jUnaryExpression);
    } else {
        return null;
    }
}
