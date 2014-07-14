import ceylon.ast.core {
    UnaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

"Converts a RedHat AST [[UnaryOperatorExpression|JUnaryOperatorExpression]] to a `ceylon.ast` [[UnaryOperation]]."
shared UnaryOperation unaryOperationToCeylon(JUnaryOperatorExpression unaryOperatorExpression) {
    assert (is UnaryOperation unaryOperation = unaryIshOperationToCeylon(unaryOperatorExpression));
    return unaryOperation;
}

"Compiles the given [[code]] for a Unary Operation
 into a [[UnaryOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared UnaryOperation? compileUnaryOperation(String code) {
    if (is JUnaryOperatorExpression jUnaryExpression = createParser(code).assignmentExpression()) {
        return unaryOperationToCeylon(jUnaryExpression);
    } else {
        return null;
    }
}
