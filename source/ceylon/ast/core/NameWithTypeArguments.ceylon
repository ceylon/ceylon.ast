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
