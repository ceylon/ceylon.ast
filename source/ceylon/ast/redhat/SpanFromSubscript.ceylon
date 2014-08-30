import ceylon.ast.core {
    Precedence8Expression,
    SpanFromSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[SpanFromSubscript]]."
shared SpanFromSubscript spanFromSubscriptToCeylon(JElementRange spanFromSubscript) {
    assert (exists jFrom = spanFromSubscript.lowerBound,
        !spanFromSubscript.upperBound exists,
        !spanFromSubscript.length exists);
    "Check precedence"
    assert (is Precedence8Expression from = expressionToCeylon(jFrom));
    return SpanFromSubscript(from);
}

"Compiles the given [[code]] for a Span From Subscript
 into a [[SpanFromSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared SpanFromSubscript? compileSpanFromSubscript(String code) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.lowerBound exists,
        !jElementOrRange.length exists,
        !jElementOrRange.upperBound exists) {
        return spanFromSubscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
