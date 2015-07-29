import ceylon.ast.core {
    ExtendedType,
    PackageQualifier,
    Super,
    TypeNameWithTypeArguments
}

"""Creates an [[ExtendedType]] from its [[name]], [[arguments]], and optionally [[qualifier]].
   
   Note: this only supports [[extension|ceylon.ast.core::Extension]].
   If you want to delegate to a [[constructor|ceylon.ast.core::Construction]], do it manually.
   
   Usage examples:
   
       extendedType("Sup")
       extendedType {
           name = "Point";
           baseExpression("x"),
           baseExpression("y")
       }"""
shared ExtendedType extendedType(name, qualifier = null, arguments = {}) {
    IdentifierIsh|TypeNameWithTypeArguments name;
    PackageQualifier|Super? qualifier;
    {PositionalArgumentIsh*} arguments;
    
    return ExtendedType(extension(name, qualifier, arguments));
}
