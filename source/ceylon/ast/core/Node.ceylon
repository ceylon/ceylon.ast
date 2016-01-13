import ceylon.collection {
    HashMap
}
"""Abstract superclass of all AST nodes.
   
   Note that nodes are not [[Identifiable]]: as they are immutable,
   the identity of a particular instance is meaningless.
   
   ### Additional information
   
   You can attach additional information to individual AST nodes using typed keys.
   Two sets of methods are available for this;
   [[get]], [[put]] and [[remove]] offer more type safety and information,
   while [[getObject]], [[set]] and [[delete]] can be slightly faster.
   
   - [[get]] and [[getObject]] retrieve a piece of attached information,
   - [[put]] and [[set]] store a piece of attached information, and
   - [[remove]] and [[delete]] discard a piece of attached information.
   
   Usage example:
   ~~~
   // toplevel
   shared Key<Token[]> tokensKey
       = ScopedKey<Token[]>(`module my.parser`, "tokens");
   
   // in the parser
   node.put(tokensKey, tokens);
   
   // somewhere else
   assert (exists tokens = node.get(tokensKey)); // tokens has type Token[]
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
    
    // extra info; more typesafety: get, put, remove
    
    "Returns the additional information attached to this node
     using the given [[key]], if any.
     
     If you don’t care about the return type,
     you might want to use [[getObject]] instead,
     which might perform better."
    see (`function getObject`)
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
     you might want to use [[set]] instead,
     which has a more convenient signature and might perform better."
    see (`function set`)
    shared Type? put<Type>(Key<Type> key, Type item)
            given Type satisfies Object {
        assert (is Type? ret = extraInfo.put(key.id, item));
        return ret;
    }
    
    "Removes the additional information attached to
     this node using the given [[key]] from this node,
     returning it.
     
     If you don’t care about the returned information,
     you might want to use [[delete]] instead,
     which might perform better."
    see (`function delete`)
    shared Type? remove<Type>(Key<out Type> key)
            given Type satisfies Object {
        assert (is Type? ret = extraInfo.remove(key.id));
        return ret;
    }
    
    // extra info; less typesafety: getObject, set, delete
    
    "Returns the additional information attached to this node
     using the given [[key]], if any.
     
     Unlike [[get]], this method doesn’t return any particular type;
     this makes it possible to accept keys of any type (`out Anything`),
     enabling users to abstract over keys of different types.
     Internally, this also eliminates one reified type test within the method
     (as well as one reified type parameter),
     so `getObject` is usually faster than `get` too."
    see (`function get`)
    shared Object? getObject(Key<out Anything> key)
            => extraInfo[key.id];
    
    "Attaches the given [[additional information|item]]
     to this node using the given [[key]].
     
     Unlike [[put]], this method discards any previously attached information;
     this makes it possible to declare the type parameter of [[key]]
     contravariant, enabling users to abstract over keys of different types.
     Internally, this also eliminates one reified type test within the method,
     so `set` is usually faster than `put` too."
    see (`function set`)
    shared void set<in Type>(Key<in Type> key, Type item)
            given Type satisfies Object
            => extraInfo.put(key.id, item);
    
    "Removes the additional information attached to
     this node using the given [[key]] from this node.
     
     Unlike [[remove]], this method discards the previously attached information;
     this makes it possible to accept keys of any type (`out Anything`),
     enabling users to abstract over keys of different types.
     Internally, this also eliminates one reified type test within the method
     (as well as one reified type parameter),
     so `delete` is usually faster than `remove` too."
    see (`function remove`)
    shared void delete(Key<out Anything> key)
            => extraInfo.remove(key.id);
    
    "Copies this node’s additional information to the [[other]] node."
    shared void copyExtraInfoTo(Node other) {
        other.extraInfo.clear();
        other.extraInfo.putAll(extraInfo);
        other.data = data;
    }
    
    "An additional field for any extra data
     that an application may want to attach to a node.
     
     Use of this field is **strongly discouraged**.
     Instead, use [[get]], [[put]], and [[remove]] with [[keys|Key]],
     which offers the following advantages:
     
     - full type safety,
     - the ability to attach arbitrarily many pieces of information
       by using multiple keys, and
     - isolation of information attached by different modules.
     
     In other words, this field is not typesafe,
     only allows for a single object to be attached,
     and offers no protection against multiple modules each attempting to register information here,
     overwriting each other’s information.
     
     To mitigate the last point, it is **extremely strongly recommended**
     that this field only be used by applications, never by libraries.
     There should only be one application at runtime,
     so this application would be in a position to know that it is exclusively accessing this field on any given node.
     Libraries on the other hand have no such guarantee,
     since they might be used together with other libraries
     without knowing whether those use this field.
     
     It is emphasized again that you should **not** use this field
     unless you absolutely need the performance benefit it brings."
    shared variable Anything data = null;
    
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
