import ceylon.ast.core {
    BaseExpression,
    Identifier,
    LIdentifier,
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    Type,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}

"""A utility function to create a [[BaseExpression]] directly from a string,
   without having to use [[NameWithTypeArguments]] (a rather verbose name).
   
   This function is not suitable in all cases; if the following restrictions affect you,
   you should instead use the regular constructors:
   
   - the type arguments will all be invariant, use-site variance is unavailable
   - empty [[typeArguments]] mean the absence of a type argument list;
     an empty but present [[type argument list|TypeArguments]] is unavailable
   
   Usage examples:
   
       baseExpression("null") // null
       baseExpression("String") // String; not to be confused with baseType("String")!
       baseExpression("emptyOrSingleton", "Integer") // emptyOrSingleton<Integer>"""
shared BaseExpression baseExpression(IdentifierIsh name, IdentifierIsh|Type* typeArguments) {
    Type toType(IdentifierIsh|Type typeArgument) {
        switch (typeArgument)
        case (is IdentifierIsh) { return baseType(typeArgument); }
        case (is Type) { return typeArgument; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    Identifier id = identifier(name);
    NameWithTypeArguments na;
    switch (id)
    case (is LIdentifier) { na = MemberNameWithTypeArguments(id, args); }
    case (is UIdentifier) { na = TypeNameWithTypeArguments(id, args); }
    return BaseExpression(na);
}
