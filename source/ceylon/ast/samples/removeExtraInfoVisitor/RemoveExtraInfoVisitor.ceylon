import ceylon.ast.core {
    Visitor,
    Key,
    Node
}

"A [[Visitor]] that removes additional information from nodes."
see (`class Node`)
shared class RemoveExtraInfoVisitor(Key<out Object>+ keys)
        satisfies Visitor {
    shared actual void visitNode(Node that) {
        for (key in keys) {
            that.remove(key);
        }
        that.visitChildren(this);
    }
}
