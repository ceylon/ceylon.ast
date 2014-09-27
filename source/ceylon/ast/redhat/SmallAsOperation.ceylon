import ceylon.ast.core {
    ExistsNonemptyExpression,
    SmallAsOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSmallAsOp=SmallAsOp
    }
}

"Converts a RedHat AST [[SmallAsOp|JSmallAsOp]] to a `ceylon.ast` [[SmallAsOperation]]."
shared SmallAsOperation smallAsOperationToCeylon(JSmallAsOp smallAsOperation) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(smallAsOperation.leftTerm),
        is ExistsNonemptyExpression right = expressionToCeylon(smallAsOperation.rightTerm));
    return SmallAsOperation(left, right);
}

"Compiles the given [[code]] for a Small As Operation
 into a [[SmallAsOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared SmallAsOperation? compileSmallAsOperation(String code) {
    if (is JSmallAsOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return smallAsOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
