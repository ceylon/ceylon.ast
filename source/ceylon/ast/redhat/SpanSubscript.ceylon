import ceylon.ast.core {
    Precedence8Expression,
    SpanSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[SpanSubscript]]."
shared SpanSubscript spanSubscriptToCeylon(JElementRange spanSubscript) {
    assert (exists jFrom = spanSubscript.lowerBound,
        exists jTo = spanSubscript.upperBound,
        !spanSubscript.length exists);
    "Check precedence"
    assert (is Precedence8Expression from = expressionToCeylon(jFrom),
        is Precedence8Expression to = expressionToCeylon(jTo));
    return SpanSubscript(from, to);
}

"Compiles the given [[code]] for a Span Subscript
 into a [[SpanSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared SpanSubscript? compileSpanSubscript(String code) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.lowerBound exists,
        jElementOrRange.upperBound exists,
        !jElementOrRange.length exists) {
        return spanSubscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
