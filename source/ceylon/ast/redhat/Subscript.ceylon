import ceylon.ast.core {
    Node,
    Subscript
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JElement=Element,
        JElementOrRange=ElementOrRange,
        JElementRange=ElementRange
    }
}

"Converts a RedHat AST [[ElementOrRange|JElementOrRange]] to a `ceylon.ast` [[Subscript]]."
shared Subscript subscriptToCeylon(JElementOrRange subscript, Anything(JNode, Node) update = noop) {
    assert (is JElement|JElementRange subscript);
    switch (subscript)
    case (is JElement) { return keySubscriptToCeylon(subscript, update); }
    case (is JElementRange) { return rangeSubscriptToCeylon(subscript, update); }
}

"Parses the given [[code]] for a Subscript
 into a [[Subscript]] using the Ceylon compiler
 (more specifically, the rule for an `indexOrIndexRange`)."
shared Subscript? parseSubscript(String code, Anything(JNode, Node) update = noop) {
    if (exists jElementOrRange = createParser("[``code``]").indexOrIndexRange().elementOrRange) {
        return subscriptToCeylon(jElementOrRange, update);
    } else {
        return null;
    }
}
