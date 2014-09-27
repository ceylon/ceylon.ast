import ceylon.ast.core {
    AddingExpression,
    SpanToSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[SpanToSubscript]]."
shared SpanToSubscript spanToSubscriptToCeylon(JElementRange spanToSubscript) {
    assert (exists jTo = spanToSubscript.upperBound,
        !spanToSubscript.lowerBound exists,
        !spanToSubscript.length exists);
    "Check precedence"
    assert (is AddingExpression to = expressionToCeylon(jTo));
    return SpanToSubscript(to);
}

"Compiles the given [[code]] for a Span To Subscript
 into a [[SpanToSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared SpanToSubscript? compileSpanToSubscript(String code) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.upperBound exists,
        !jElementOrRange.lowerBound exists,
        !jElementOrRange.length exists) {
        return spanToSubscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
