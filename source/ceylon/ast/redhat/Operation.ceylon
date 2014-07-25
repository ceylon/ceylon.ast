import ceylon.ast.core {
    Operation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JOperatorExpression=OperatorExpression,
        JUnaryOperatorExpression=UnaryOperatorExpression,
        JWithinOp=WithinOp
    }
}

"Converts a RedHat AST [[OperatorExpression|JOperatorExpression]] to a `ceylon.ast` [[Operation]]."
shared Operation operationToCeylon(JOperatorExpression operatorExpression) {
    assert (is JUnaryOperatorExpression|JBinaryOperatorExpression|JWithinOp operatorExpression);
    switch (operatorExpression)
    case (is JUnaryOperatorExpression) { return unaryIshOperationToCeylon(operatorExpression); }
    case (is JBinaryOperatorExpression) { return binaryOperationToCeylon(operatorExpression); }
    case (is JWithinOp) { return withinOperationToCeylon(operatorExpression); }
}

"Compiles the given [[code]] for an Operation
 into an [[Operation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared Operation? compileOperation(String code) {
    if (is JOperatorExpression jExpression = createParser(code).assignmentExpression()) {
        return operationToCeylon(jExpression);
    } else {
        return null;
    }
}
