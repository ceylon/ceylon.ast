import ceylon.ast.core {
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    Primary,
    QualifiedExpression,
    Type,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments
}

"""A utility function to create a [[QualifiedExpression]] directly from some strings,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   (The type arguments will all be invariant; if you want to use use-site variance,
   you have to construct the [[TypeArgument]] objects yourself.)
   
   Usage examples:
   
       qualifiedExpression("x", "Y") // x.Y
       qualifiedExpression(qualifiedExpression(baseExpression("process"), "arguments"), "first") // process.arguments.first"""
shared QualifiedExpression qualifiedExpression(String|Primary receiverExpression, String name, String|Type* typeArguments) {
    Type toType(String|Type typeArgument) {
        switch (typeArgument)
        case (is String) { return baseType(typeArgument); }
        case (is Type) { return typeArgument; }
    }
    Primary toPrimary(String|Primary receiverExpression) {
        switch (receiverExpression)
        case (is String) { return baseExpression(receiverExpression); }
        case (is Primary) { return receiverExpression; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    NameWithTypeArguments na;
    if (name.first?.uppercase else false) {
        na = TypeNameWithTypeArguments(uidentifier(name), args);
    } else {
        na = MemberNameWithTypeArguments(lidentifier(name), args);
    }
    return QualifiedExpression(toPrimary(receiverExpression), na);
}
