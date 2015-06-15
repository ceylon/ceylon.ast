import ceylon.ast.core {
    AddingExpression,
    Node,
    SpanToSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[SpanToSubscript]]."
shared SpanToSubscript spanToSubscriptToCeylon(JElementRange spanToSubscript, Anything(JNode,Node) update = noop) {
    assert (exists jTo = spanToSubscript.upperBound,
        !spanToSubscript.lowerBound exists,
        !spanToSubscript.length exists);
    "Check precedence"
    assert (is AddingExpression to = expressionToCeylon(jTo, update));
    value result = SpanToSubscript(to);
    update(spanToSubscript, result);
    return result;
}

"Compiles the given [[code]] for a Span To Subscript
 into a [[SpanToSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared SpanToSubscript? compileSpanToSubscript(String code, Anything(JNode,Node) update = noop) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.upperBound exists,
        !jElementOrRange.lowerBound exists,
        !jElementOrRange.length exists) {
        return spanToSubscriptToCeylon(jElementOrRange, update);
    } else {
        return null;
    }
}
