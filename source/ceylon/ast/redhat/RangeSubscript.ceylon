import ceylon.ast.core {
    Node,
    RangeSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementRange|JElementRange]] to a `ceylon.ast` [[RangeSubscript]]."
shared RangeSubscript rangeSubscriptToCeylon(JElementRange rangeSubscript, Anything(JNode,Node) update = noop) {
    // the missing existence and non-existence assertions are done in the individual toCeylon functions
    RangeSubscript result;
    if (rangeSubscript.lowerBound exists) {
        if (rangeSubscript.upperBound exists) {
            result = spanSubscriptToCeylon(rangeSubscript, update);
        } else if (rangeSubscript.length exists) {
            result = measureSubscriptToCeylon(rangeSubscript, update);
        } else {
            result = spanFromSubscriptToCeylon(rangeSubscript, update);
        }
    } else {
        result = spanToSubscriptToCeylon(rangeSubscript, update);
    }
    update(rangeSubscript, result);
    return result;
}

"Parses the given [[code]] for a Range Subscript
 into a [[RangeSubscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared RangeSubscript? parseRangeSubscript(String code, Anything(JNode,Node) update = noop) {
    if (is JElementRange jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange) {
        return rangeSubscriptToCeylon(jElementOrRange, update);
    } else {
        return null;
    }
}
