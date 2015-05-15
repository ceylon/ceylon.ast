import ceylon.ast.core {
    Identifier,
    LIdentifier,
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    Primary,
    QualifiedExpression,
    Type,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}

"""A utility function to create a [[QualifiedExpression]] directly from some strings,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   This function is not suitable in all cases; if the following restrictions affect you,
   you should instead use the regular constructors:
   
   - the type arguments will all be invariant, use-site variance is unavailable
   - empty [[typeArguments]] mean the absence of a type argument list;
     an empty but present [[type argument list|TypeArguments]] is unavailable
   
   Usage examples:
   
       qualifiedExpression("x", "Y") // x.Y
       qualifiedExpression(qualifiedExpression(baseExpression("process"), "arguments"), "first") // process.arguments.first"""
shared QualifiedExpression qualifiedExpression(IdentifierIsh|Primary receiverExpression, IdentifierIsh name, IdentifierIsh|Type* typeArguments) {
    Type toType(IdentifierIsh|Type typeArgument) {
        switch (typeArgument)
        case (is IdentifierIsh) { return baseType(typeArgument); }
        case (is Type) { return typeArgument; }
    }
    Primary toPrimary(IdentifierIsh|Primary receiverExpression) {
        switch (receiverExpression)
        case (is IdentifierIsh) { return baseExpression(receiverExpression); }
        case (is Primary) { return receiverExpression; }
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
    case (is UIdentifier) { na = TypeNameWithTypeArguments(uidentifier(name), args); }
    case (is LIdentifier) { na = MemberNameWithTypeArguments(lidentifier(name), args); }
    return QualifiedExpression(toPrimary(receiverExpression), na);
}
