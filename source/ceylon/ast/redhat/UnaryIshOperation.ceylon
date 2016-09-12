import ceylon.ast.core {
    Node,
    UnaryIshOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared UnaryIshOperation unaryIshOperationToCeylon(JUnaryOperatorExpression unaryIshOperation, Anything(JNode,Node) update = noop) {
    assert (is JPostfixOperatorExpression|JPrefixOperatorExpression|JNegativeOp|JPositiveOp|JExists|JNonempty|JTypeOperatorExpression|JNotOp unaryIshOperation);
    switch (unaryIshOperation)
    case (is JPostfixOperatorExpression) { return postfixOperationToCeylon(unaryIshOperation, update); }
    case (is JPrefixOperatorExpression) { return prefixOperationToCeylon(unaryIshOperation, update); }
    case (is JNegativeOp) { return negationOperationToCeylon(unaryIshOperation, update); }
    case (is JPositiveOp) { return identityOperationToCeylon(unaryIshOperation, update); }
    case (is JExists) { return existsOperationToCeylon(unaryIshOperation, update); }
    case (is JNonempty) { return nonemptyOperationToCeylon(unaryIshOperation, update); }
    case (is JTypeOperatorExpression) { return unaryTypeOperationToCeylon(unaryIshOperation, update); }
    case (is JNotOp) { return notOperationToCeylon(unaryIshOperation, update); }
}

"Parses the given [[code]] for an Unary Ish Operation
 into an [[UnaryIshOperation]] using the Ceylon compiler
 (more specifically, the rule for an `unaryIshOperation`)."
shared UnaryIshOperation? parseUnaryIshOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JUnaryOperatorExpression jUnaryExpression = createParser(code).assignmentExpression()) {
        return unaryIshOperationToCeylon(jUnaryExpression, update);
    } else {
        return null;
    }
}
