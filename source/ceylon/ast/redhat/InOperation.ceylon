import ceylon.ast.core {
    InOperation,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInOp=InOp
    }
}

"Converts a RedHat AST [[InOp|JInOp]] to a `ceylon.ast` [[InOperation]]."
shared InOperation inOperationToCeylon(JInOp inOperation) {
    "Check precedence"
    assert (is Precedence10Expression left = expressionToCeylon(inOperation.leftTerm),
        is Precedence10Expression right = expressionToCeylon(inOperation.rightTerm));
    return InOperation(left, right);
}

"Compiles the given [[code]] for an In Operation
 into an [[InOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared InOperation? compileInOperation(String code) {
    if (is JInOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return inOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
