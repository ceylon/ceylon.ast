import ceylon.ast.core {
    MeasureSubscript,
    AddingExpression,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[MeasureSubscript]]."
shared MeasureSubscript measureSubscriptToCeylon(JElementRange measureSubscript, Anything(JNode, Node) update = noop) {
    assert (exists jFrom = measureSubscript.lowerBound,
        exists jLength = measureSubscript.length,
        !measureSubscript.upperBound exists);
    "Check precedence"
    assert (is AddingExpression from = expressionToCeylon(jFrom, update),
        is AddingExpression length = expressionToCeylon(jLength, update));
    value result = MeasureSubscript(from, length);
    update(measureSubscript, result);
    return result;
}

"Parses the given [[code]] for a Measure Subscript
 into a [[MeasureSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared MeasureSubscript? parseMeasureSubscript(String code, Anything(JNode, Node) update = noop) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.lowerBound exists,
        jElementOrRange.length exists,
        !jElementOrRange.upperBound exists) {
        return measureSubscriptToCeylon(jElementOrRange, update);
    } else {
        return null;
    }
}
