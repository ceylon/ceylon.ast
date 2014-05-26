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
    
    "Edit this node with the given [[editor]], and return the edited copy.
     Calls the appropriate `editX` method on the editor and returns its result."
    shared formal Node edit(Editor editor);
    "Edit the children of this node with the given [[editor]].
     Calls [[edit]] on each [[child node|children]]."
    shared Node[] editChildren(Editor editor)
            => children.collect((Node node) => node.edit(editor));
    
    "Returns a Ceylon expression that evaluates to a copy of this node.
     
     Note: do not call this method directly, as it can be expensive;
     instead, use [[ceylonExpression]], which caches the result
     after it has been calculated once."
    see (`value ceylonExpression`)
    shared formal String toCeylonExpression();
    "Cache of [[toCeylonExpression]] for [[ceylonExpression]]."
    see (`function toCeylonExpression`, `value ceylonExpression`)
    variable String? ceylonExpression_cache = null;
    "A Ceylon expression that evaluates to a copy of this node."
    see (`function toCeylonExpression`)
    shared String ceylonExpression {
        if (exists cache = ceylonExpression_cache) {
            return cache;
        }
        value expression = toCeylonExpression();
        ceylonExpression_cache = expression;
        return expression;
    }
    "A developer-friendly string representing the instance.
     
     At the moment, this is [[ceylonExpression]], but this may change in the future;
     for anything other than diagnostic information, use [[ceylonExpression]] or one of the other attributes directly."
    shared actual String string => ceylonExpression;
    
    // force subclasses to define equals…
    shared actual formal Boolean equals(Object other);
    // … and hashcode
    shared actual formal Integer hash;
}
