import ceylon.ast.core {
    RangeSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[RangeSubscript]]."
shared RangeSubscript rangeSubscriptToCeylon(JElementRange rangeSubscript) {
    // the missing existence and non-existence assertions are done in the individual toCeylon functions
    if (rangeSubscript.lowerBound exists) {
        if (rangeSubscript.upperBound exists) {
            return spanSubscriptToCeylon(rangeSubscript);
        } else if (rangeSubscript.length exists) {
            return measureSubscriptToCeylon(rangeSubscript);
        } else {
            return spanFromSubscriptToCeylon(rangeSubscript);
        }
    } else {
        return spanToSubscriptToCeylon(rangeSubscript);
    }
}

"Compiles the given [[code]] for a Range Subscript
 into a [[RangeSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared RangeSubscript? compileRangeSubscript(String code) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange) {
        return rangeSubscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
