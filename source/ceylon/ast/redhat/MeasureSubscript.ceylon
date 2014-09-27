import ceylon.ast.core {
    MeasureSubscript,
    AddingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[MeasureSubscript]]."
shared MeasureSubscript measureSubscriptToCeylon(JElementRange measureSubscript) {
    assert (exists jFrom = measureSubscript.lowerBound,
        exists jLength = measureSubscript.length,
        !measureSubscript.upperBound exists);
    "Check precedence"
    assert (is AddingExpression from = expressionToCeylon(jFrom),
        is AddingExpression length = expressionToCeylon(jLength));
    return MeasureSubscript(from, length);
}

"Compiles the given [[code]] for a Measure Subscript
 into a [[MeasureSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared MeasureSubscript? compileMeasureSubscript(String code) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange,
        jElementOrRange.lowerBound exists,
        jElementOrRange.length exists,
        !jElementOrRange.upperBound exists) {
        return measureSubscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
