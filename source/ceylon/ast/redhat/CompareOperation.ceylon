import ceylon.ast.core {
    CompareOperation,
    Precedence10Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompareOp=CompareOp
    }
}

"Converts a RedHat AST [[CompareOp|JCompareOp]] to a `ceylon.ast` [[CompareOperation]]."
shared CompareOperation compareOperationToCeylon(JCompareOp compareOperation) {
    "Check precedence"
    assert (is Precedence10Expression left = expressionToCeylon(compareOperation.leftTerm),
        is Precedence10Expression right = expressionToCeylon(compareOperation.rightTerm));
    return CompareOperation(left, right);
}

"Compiles the given [[code]] for a Compare Operation
 into a [[CompareOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared CompareOperation? compileCompareOperation(String code) {
    if (is JCompareOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return compareOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
