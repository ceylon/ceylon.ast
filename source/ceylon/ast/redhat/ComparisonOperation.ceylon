import ceylon.ast.core {
    ComparisonOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComparisonOp=ComparisonOp,
        JLargeAsOp=LargeAsOp,
        JLargerOp=LargerOp,
        JSmallAsOp=SmallAsOp,
        JSmallerOp=SmallerOp
    }
}

"Converts a RedHat AST [[ComparisonOp|JComparisonOp]] to a `ceylon.ast` [[ComparisonOperation]]."
shared ComparisonOperation comparisonOperationToCeylon(JComparisonOp comparisonOperation) {
    assert (is JLargerOp|JSmallerOp|JLargeAsOp|JSmallAsOp comparisonOperation);
    switch (comparisonOperation)
    case (is JLargerOp) { return largerOperationToCeylon(comparisonOperation); }
    case (is JSmallerOp) { return smallerOperationToCeylon(comparisonOperation); }
    case (is JLargeAsOp) { return largeAsOperationToCeylon(comparisonOperation); }
    case (is JSmallAsOp) { return smallAsOperationToCeylon(comparisonOperation); }
}

"Compiles the given [[code]] for a Comparison Operation
 into a [[ComparisonOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared ComparisonOperation? compileComparisonOperation(String code) {
    if (is JComparisonOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return comparisonOperationToCeylon(jComparisonExpression);
    } else {
        return null;
    }
}
