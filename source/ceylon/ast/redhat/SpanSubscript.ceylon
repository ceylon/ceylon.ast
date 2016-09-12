import ceylon.ast.core {
    AddingExpression,
    Node,
    SpanSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[SpanSubscript]]."
shared SpanSubscript spanSubscriptToCeylon(JElementRange spanSubscript, Anything(JNode,Node) update = noop) {
    assert (exists jFrom = spanSubscript.lowerBound,
        exists jTo = spanSubscript.upperBound,
        !spanSubscript.length exists);
    "Check precedence"
    assert (is AddingExpression from = expressionToCeylon(jFrom, update),
        is AddingExpression to = expressionToCeylon(jTo, update));
    value result = SpanSubscript(from, to);
    update(spanSubscript, result);
    return result;
}

"Parses the given [[code]] for a Span Subscript
 into a [[SpanSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared SpanSubscript? parseSpanSubscript(String code, Anything(JNode,Node) update = noop) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.lowerBound exists,
        jElementOrRange.upperBound exists,
        !jElementOrRange.length exists) {
        return spanSubscriptToCeylon(jElementOrRange, update);
    } else {
        return null;
    }
}
