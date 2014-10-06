import ceylon.ast.core {
    MemberName,
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    TypeArguments,
    TypeName,
    TypeNameWithTypeArguments
}

"Convenience function to create either a [[MemberNameWithTypeArguments]]
 or a [[TypeNameWithTypeArguments]], depending on the kind of [[name]]."
shared NameWithTypeArguments nameWithTypeArguments(IdentifierIsh name, TypeArguments? typeArguments = null) {
    value id = identifier(name);
    switch (id)
    case (is TypeName) { return TypeNameWithTypeArguments(id, typeArguments); }
    case (is MemberName) { return MemberNameWithTypeArguments(id, typeArguments); }
}
