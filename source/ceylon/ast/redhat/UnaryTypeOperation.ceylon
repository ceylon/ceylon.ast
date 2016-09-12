import ceylon.ast.core {
    Node,
    UnaryTypeOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIsOp=IsOp,
        JOfOp=OfOp,
        JTypeOperatorExpression=TypeOperatorExpression
    }
}

"Converts a RedHat AST [[TypeOperatorExpression|JTypeOperatorExpression]] to a `ceylon.ast` [[UnaryTypeOperation]]."
shared UnaryTypeOperation unaryTypeOperationToCeylon(JTypeOperatorExpression unaryTypeOperation, Anything(JNode,Node) update = noop) {
    assert (is JIsOp|JOfOp unaryTypeOperation);
    switch (unaryTypeOperation)
    case (is JIsOp) { return isOperationToCeylon(unaryTypeOperation, update); }
    case (is JOfOp) { return ofOperationToCeylon(unaryTypeOperation, update); }
}

"Parses the given [[code]] for an Unary Type Operation
 into an [[UnaryTypeOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared UnaryTypeOperation? parseUnaryTypeOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JTypeOperatorExpression jUnaryTypeOperation = createParser(code).comparisonExpression()) {
        return unaryTypeOperationToCeylon(jUnaryTypeOperation, update);
    } else {
        return null;
    }
}
