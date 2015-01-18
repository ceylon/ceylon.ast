import ceylon.ast.core {
    ExtendedType,
    Super,
    TypeNameWithTypeArguments
}

"""Creates an [[ExtendedType]] from its [[name]], [[arguments]], and optionally [[qualifier]].
   
   Usage examples:
   
       extendedType("Sup")
       extendedType {
           name = "Point";
           baseExpression("x"),
           baseExpression("y")
       }"""
shared ExtendedType extendedType(name, qualifier = null, arguments = {}) {
    IdentifierIsh|TypeNameWithTypeArguments name;
    Super|IdentifierIsh|TypeNameWithTypeArguments? qualifier;
    {PositionalArgumentIsh*} arguments;
    
    return ExtendedType(classInstantiation(name, qualifier, arguments));
}
