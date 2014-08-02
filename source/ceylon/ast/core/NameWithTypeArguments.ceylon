"A name and, optionally, type arguments."
shared abstract class NameWithTypeArguments()
        of TypeNameWithTypeArguments | MemberNameWithTypeArguments
        extends TypeIsh() {
    
    "The name."
    shared formal Identifier name;
    "The type arguments, if any."
    shared formal TypeArguments? typeArguments;
    
    shared actual formal [Identifier, TypeArguments=] children;
}

"Convenience function to create either a [[MemberNameWithTypeArguments]]
 or a [[TypeNameWithTypeArguments]], depending on the type of [[name]]."
shared NameWithTypeArguments nameWithTypeArguments(Identifier name, TypeArguments? typeArguments) {
    switch (name)
    case (is TypeName) { return TypeNameWithTypeArguments(name, typeArguments); }
    case (is MemberName) { return MemberNameWithTypeArguments(name, typeArguments); }
}
