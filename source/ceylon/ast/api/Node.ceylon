"Abstract superclass of all AST nodes.
 
 Note that nodes are not [[Identifiable]]: as they are immutable,
 the identity of a particular instance is meaningless."
shared abstract class Node(children) extends Object()
/* TODO case types */ {
    
    "The child nodes of this node."
    shared default Node[] children;
    
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
    
    "Edit this node with the given [[editor]], and return the edited copy.
     Calls the appropriate `editX` method on the editor and returns its result."
    shared formal Node edit(Editor editor);
    "Edit the children of this node with the given [[editor]].
     Calls [[edit]] on each [[child node|children]]."
    shared Node[] editChildren(Editor editor)
            => children.collect((Node node) => node.edit(editor));
    
    "A developer-friendly string representing the instance.
     
     At the moment, this is a Ceylon expression (created by [[CeylonExpressionVisitor]]), but this may change in the future;
     for anything other than diagnostic information, use [[CeylonExpressionVisitor]] or one of the other attributes directly."
    shared actual String string {
        // TODO investigate performance for big nodes. Should we cache the result?
        // (not all that useful since CEV won’t use the cached result for sub-nodes.)
        value cev = CeylonExpressionVisitor();
        visit(cev);
        return cev.string;
    }
}
