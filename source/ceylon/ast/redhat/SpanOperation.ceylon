import ceylon.ast.core {
    Precedence8Expression,
    SpanOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JRangeOp=RangeOp
    }
}

"Converts a RedHat AST [[RangeOp|JRangeOp]] to a `ceylon.ast` [[SpanOperation]]."
shared SpanOperation spanOperationToCeylon(JRangeOp spanOperation) {
    "Check precedence"
    assert (is Precedence8Expression left = expressionToCeylon(spanOperation.leftTerm),
        is Precedence8Expression right = expressionToCeylon(spanOperation.rightTerm));
    return SpanOperation(left, right);
}

"Compiles the given [[code]] for a Span Operation
 into a [[SpanOperation]] using the Ceylon compiler
 (more specifically, the rule for an `entryRangeExpression`)."
shared SpanOperation? compileSpanOperation(String code) {
    if (is JRangeOp jEntryRangeExpression = createParser(code).entryRangeExpression()) {
        return spanOperationToCeylon(jEntryRangeExpression);
    } else {
        return null;
    }
}
