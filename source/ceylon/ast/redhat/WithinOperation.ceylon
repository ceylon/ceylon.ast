import ceylon.ast.core {
    WithinOperation,
    ExistsNonemptyExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JWithinOp=WithinOp
    }
}

"Converts a RedHat AST [[WithinOp|JWithinOp]] to a `ceylon.ast` [[WithinOperation]]."
shared WithinOperation withinOperationToCeylon(JWithinOp withinOperation) {
    "Check precedence"
    assert (is ExistsNonemptyExpression operand = expressionToCeylon(withinOperation.term));
    return WithinOperation(operand, boundToCeylon(withinOperation.lowerBound), boundToCeylon(withinOperation.upperBound));
}

"Compiles the given [[code]] for a Within Operation
 into a [[WithinOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared WithinOperation? compileWithinOperation(String code) {
    if (is JWithinOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return withinOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
