"Abstract superclass of all AST nodes.
 
 Note that nodes are not [[Identifiable]]: as they are immutable,
 the identity of a particular instance is meaningless."
shared abstract class Node(children) extends Object() {
    
    "The child nodes of this node."
    shared Node[] children;
    
    "Visit this node with the given [[visitor]].
     Calls the appropriate `visitX` method on the visitor."
    shared formal void visit(Visitor visitor);
    "Visit the children of this node with the given [[visitor]].
     Calls [[visit]] on each [[child node|children]]."
    shared void visitChildren(Visitor visitor) {
        for (child in children) {
            child.visit(visitor);
        }
    }
    
    // force subclasses to define equals…
    shared actual formal Boolean equals(Object other);
    // … and hashcode
    shared actual formal Integer hash;
}
