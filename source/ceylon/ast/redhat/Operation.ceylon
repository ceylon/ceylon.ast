import ceylon.ast.core {
    Node,
    Operation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JOperatorExpression=OperatorExpression,
        JUnaryOperatorExpression=UnaryOperatorExpression,
        JWithinOp=WithinOp
    }
}

"Converts a RedHat AST [[OperatorExpression|JOperatorExpression]] to a `ceylon.ast` [[Operation]]."
shared Operation operationToCeylon(JOperatorExpression operatorExpression, Anything(JNode, Node) update = noop) {
    assert (is JUnaryOperatorExpression|JBinaryOperatorExpression|JWithinOp operatorExpression);
    switch (operatorExpression)
    case (is JUnaryOperatorExpression) { return unaryIshOperationToCeylon(operatorExpression, update); }
    case (is JBinaryOperatorExpression) { return binaryOperationToCeylon(operatorExpression, update); }
    case (is JWithinOp) { return withinOperationToCeylon(operatorExpression, update); }
}

"Parses the given [[code]] for an Operation
 into an [[Operation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared Operation? parseOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JOperatorExpression jExpression = createParser(code).assignmentExpression()) {
        return operationToCeylon(jExpression, update);
    } else {
        return null;
    }
}
