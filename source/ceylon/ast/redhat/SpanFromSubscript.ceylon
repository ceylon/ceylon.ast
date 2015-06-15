import ceylon.ast.core {
    AddingExpression,
    Node,
    SpanFromSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[SpanFromSubscript]]."
shared SpanFromSubscript spanFromSubscriptToCeylon(JElementRange spanFromSubscript, Anything(JNode,Node) update = noop) {
    assert (exists jFrom = spanFromSubscript.lowerBound,
        !spanFromSubscript.upperBound exists,
        !spanFromSubscript.length exists);
    "Check precedence"
    assert (is AddingExpression from = expressionToCeylon(jFrom, update));
    value result = SpanFromSubscript(from);
    update(spanFromSubscript, result);
    return result;
}

"Compiles the given [[code]] for a Span From Subscript
 into a [[SpanFromSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared SpanFromSubscript? compileSpanFromSubscript(String code, Anything(JNode,Node) update = noop) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.lowerBound exists,
        !jElementOrRange.length exists,
        !jElementOrRange.upperBound exists) {
        return spanFromSubscriptToCeylon(jElementOrRange, update);
    } else {
        return null;
    }
}
