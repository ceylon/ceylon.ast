import ceylon.collection {
    HashMap
}
"""Abstract superclass of all AST nodes.
   
   Note that nodes are not [[Identifiable]]: as they are immutable,
   the identity of a particular instance is meaningless.
   
   ### Additional information
   
   You can attach additional information to individual AST nodes
   using the [[put]] and [[get]] methods. Usage example:
   ~~~
   // toplevel
   shared Key<Token[]> tokensKey
       = ScopedKey<Token[]>(`module my.parser`, "tokens");
   
   // in the parser
   node.put(tokensKey, tokens);
   
   // somewhere else
   assert (exists tokens = node.get(tokensKey));
   ~~~"""
shared abstract class Node()
        of Expression | Statement | Declaration | Annotation | Annotations | Parameter | TypeParameter | TypeParameters | CaseTypes | SatisfiedTypes | TypeConstraint | PackageDescriptor | ModuleImport | ModuleBody | ModuleDescriptor | ImportAlias | ImportWildcard | ImportElement | ImportElements | Import | AnyCompilationUnit | Condition | Conditions | IfClause | ElseClause | ExtendedType | ClassSpecifier | TypeSpecifier | Variable | ForIterator | ForClause | FailClause | ComprehensionClause | FinallyClause | CatchClause | Resource | Resources | TryClause | CaseItem | CaseClause | SwitchCases | SwitchClause | TypeIsh | Identifier | FullPackageName | ArgumentList | SpreadArgument | Arguments | NamedArgument | AnySpecifier | Parameters | Bound | Modifier | Body | Comprehension | Subscript | DecQualifier | AnyMemberOperator | Pattern | SpecifiedPattern | PatternList | CaseExpression | ExtensionOrConstruction
        extends Object() {
    
    "The child nodes of this node."
    shared formal Node[] children;
    
    /*
     TODO
     [Performance tests][gist] seem to indicate that
     the a HashMap with string keys performs worse
     than a HashMap with keys that wrap a string (here: Key).
     This is probably because the string is often wrapped
     and unwrapped between java.lang.String and
     ceylon.language.String.
     
     This requires more investigation. If the String (un)wrapping
     really is the cause of the worsened performance, the
     compiler probably needs to learn to optimize that,
     as a HashMap keyed by strings is probably not uncommon.
     
     [gist]: https://gist.github.com/lucaswerkmeister/b95470259328dea550ad
     */
    HashMap<String,Object> extraInfo = HashMap<String,Object>();
    
    "Returns the additional information attached to this node
     using the given [[key]], if any."
    see (`function put`)
    shared Type? get<out Type>(Key<out Type> key)
            given Type satisfies Object {
        if (exists ret = extraInfo[key.id]) {
            assert (is Type ret);
            return ret;
        } else {
            return null;
        }
    }
    
    "Attaches the given [[additional information|item]]
     to this node using the given [[key]].
     If other information was attached
     with the same key previously, it is returned.
     
     If you don’t care about the previously attached information,
     you might want to use [[set]] instead."
    see (`function set`, `function get`, `function remove`)
    shared Type? put<Type>(Key<Type> key, Type item)
            given Type satisfies Object {
        assert (is Type? ret = extraInfo.put(key.id, item));
        return ret;
    }
    
    "Attaches the given [[additional information|item]]
     to this node using the given [[key]].
     
     Unlike [[put]], this method discards any previously attached information;
     this makes it possible to declare the type parameter of [[key]]
     contravariant, enabling users to abstract over keys of different types."
    see (`function put`, `function get`, `function remove`)
    shared void set<in Type>(Key<in Type> key, Type item)
            given Type satisfies Object
            => extraInfo.put(key.id, item);
    
    "Removes the additional information attached to
     this node using the given [[key]] from this node,
     returning it."
    see (`function put`)
    shared Type? remove<Type>(Key<out Type> key)
            given Type satisfies Object {
        assert (is Type? ret = extraInfo.remove(key.id));
        return ret;
    }
    
    "Copies this node’s additional information to the [[other]] node."
    see (`function put`, `function get`)
    shared void copyExtraInfoTo(Node other) {
        other.extraInfo.clear();
        other.extraInfo.putAll(extraInfo);
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
    shared void visitChildren(Visitor visitor) {
        for (child in children) {
            child.visit(visitor);
        }
    }
    
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
