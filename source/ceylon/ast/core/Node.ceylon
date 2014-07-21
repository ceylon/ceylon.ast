"Abstract superclass of all AST nodes.
 
 Note that nodes are not [[Identifiable]]: as they are immutable,
 the identity of a particular instance is meaningless."
shared abstract class Node()
        of ExpressionIsh | Statement | CompilationUnit | Annotation | Annotations // TODO other case types
        extends Object() {
    
    "The child nodes of this node."
    shared formal Node[] children;
    
    "Additional information that’s attached to this node.
     
     This allows users of the AST to add additional information to some nodes;
     for example, a parser might add tokens, a compiler typing information, etc.
     
     The extra information is *not* considered part of the node;
     [[equals]] and [[hash]] don’t use it."
    shared variable Anything extraInfo = null;
    
    "Copies this node’s [[extraInfo]] to the [[other]] node."
    shared void copyExtraInfoTo(Node other) {
        other.extraInfo = extraInfo;
    }
    
    "Transform this node with the given [[transformer]] by calling the appropriate
     `transformX` method on the transformer.
     
     If you have a `Node node` that’s actually an [[LIdentifier]] instance, then the
     runtime will call `LIdentifier.transform`; therefore, this method is by nature *narrowing*.
     This means that if [[transformer]] is a [[NarrowingTransformer]], calling
     `node.transform(transformer)` is equivalent to calling `transformer.transformNode(node)`.
     On the other hand, if [[transformer]] is a [[WideningTransformer]], then the two
     operations are very different."
    see (`interface NarrowingTransformer`, `interface WideningTransformer`)
    shared formal Result transform<out Result>(Transformer<Result> transformer);
    "Transform all [[child nodes|children]] by calling their [[transform]] methods."
    shared Result[] transformChildren<out Result>(Transformer<Result> transformer) => [
        for (child in children)
            child.transform(transformer)
    ];
    
    "Visit this node with the given [[visitor]].
     Calls the appropriate `visitX` method on the visitor."
    shared void visit(Visitor visitor) => transform(visitor);
    "Visit the children of this node with the given [[visitor]].
     Calls [[visit]] on each [[child node|children]]."
    shared void visitChildren(Visitor visitor) => transformChildren(visitor);
    
    "A developer-friendly string representing the instance.
     
     At the moment, this is a Ceylon expression (created by [[CeylonExpressionTransformer]]), but this may change in the future;
     for anything other than diagnostic information, use [[CeylonExpressionTransformer]] or one of the other attributes directly."
    shared actual String string {
        // TODO investigate performance for big nodes. Should we cache the result?
        // (not all that useful since CET won’t use the cached result for sub-nodes.)
        return transform(CeylonExpressionTransformer());
        // (using the same CET every time might also improve performance)
        // (but not across multiple nodes! it carries state in its indentation)
    }
}
