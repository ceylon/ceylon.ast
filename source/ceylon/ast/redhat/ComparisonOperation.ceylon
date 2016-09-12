import ceylon.ast.core {
    ComparisonOperation,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JComparisonOp=ComparisonOp,
        JLargeAsOp=LargeAsOp,
        JLargerOp=LargerOp,
        JSmallAsOp=SmallAsOp,
        JSmallerOp=SmallerOp
    }
}

"Converts a RedHat AST [[ComparisonOp|JComparisonOp]] to a `ceylon.ast` [[ComparisonOperation]]."
shared ComparisonOperation comparisonOperationToCeylon(JComparisonOp comparisonOperation, Anything(JNode,Node) update = noop) {
    assert (is JLargerOp|JSmallerOp|JLargeAsOp|JSmallAsOp comparisonOperation);
    switch (comparisonOperation)
    case (is JLargerOp) { return largerOperationToCeylon(comparisonOperation, update); }
    case (is JSmallerOp) { return smallerOperationToCeylon(comparisonOperation, update); }
    case (is JLargeAsOp) { return largeAsOperationToCeylon(comparisonOperation, update); }
    case (is JSmallAsOp) { return smallAsOperationToCeylon(comparisonOperation, update); }
}

"Parses the given [[code]] for a Comparison Operation
 into a [[ComparisonOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared ComparisonOperation? parseComparisonOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JComparisonOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return comparisonOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
