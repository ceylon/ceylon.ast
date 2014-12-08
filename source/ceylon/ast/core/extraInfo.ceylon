import ceylon.language.meta.declaration {
    AnnotatedDeclaration
}

"A key by which a [[Node]]’s additional information
 can be accessed."
shared class Key<Type>(name)
        given Type satisfies Object {
    "The name of this key. To avoid collisions
     with other keys, some use-site ID should be
     included, e. g. the name of the module that
     uses this key."
    see (`class ScopedKey`)
    String name;
    "A unique ID of this key, composed of
     the [[name]] argument and the [[Type]] type argument."
    shared String id = "`` `Type`.string ``:::``name``";
    string => id;
    shared actual Boolean equals(Object that) {
        if (is Key<Type> that) {
            return id == that.id;
        } else {
            return false;
        }
    }
    hash => id.hash;
}

"A [[Key]] with an explicitly provided scope, to avoid name collisions.
 
 Usage example:
 
     shared Key<Token[]> tokensKey
             = ScopedKey<Token[]>(`class CeylonParser`, \"tokens\");"
shared class ScopedKey<Type>(scope, name)
        extends Key<Type>("``scope.string``:::``name.string``")
        given Type satisfies Object {
    "The scope of this key, that is, the declaration
     of the program element that uses it.
     
     Most commonly the declaration of the enclosing
     class, package or module."
    AnnotatedDeclaration scope;
    "The name of this key.
     
     Unlike [[Key.name]], this name shouldn’t include some
     use-site ID, because that’s already provided by [[scope]]."
    String name;
}
