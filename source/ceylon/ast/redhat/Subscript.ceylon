import ceylon.ast.core {
    Subscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElement=Element,
        JElementOrRange=ElementOrRange,
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementOrRange|JElementOrRange]] to a `ceylon.ast` [[Subscript]]."
shared Subscript subscriptToCeylon(JElementOrRange subscript) {
    assert (is JElement|JElementRange subscript);
    switch (subscript)
    case (is JElement) { return keySubscriptToCeylon(subscript); }
    case (is JElementRange) { return rangeSubscriptToCeylon(subscript); }
}

"Compiles the given [[code]] for a Subscript
 into a [[Subscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared Subscript? compileSubscript(String code) {
    if (exists jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange) {
        return subscriptToCeylon(jElementOrRange);
    } else {
        return null;
    }
}
