"Abstract superclass of all AST nodes.
 
 Note that nodes are not [[Identifiable]]: as they are immutable,
 the identity of a particular instance is meaningless."
shared abstract class Node(children) extends Object() {
    
    "The child nodes of this node."
    shared Node[] children;
    
    // force subclasses to define equals…
    shared actual formal Boolean equals(Object other);
    // … and hashcode
    shared actual formal Integer hash;
}
