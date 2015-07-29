import ceylon.ast.core {
    ClassSpecifier,
    PackageQualifier,
    Super,
    TypeNameWithTypeArguments
}

"""Creates a [[ClassSpecifier]] from its [[name]], [[arguments]], and optionally [[qualifier]].
   
   Note: this only supports [[extension|ceylon.ast.core::Extension]].
   If you want to delegate to a [[constructor|ceylon.ast.core::Construction]], do it manually.
   
   Usage examples:
   
       classSpecifier("Object")
       classSpecifier {
           name = "Point";
           baseExpression("y"),
           baseExpression("x")
       }"""
shared ClassSpecifier classSpecifier(name, qualifier = null, arguments = {}) {
    IdentifierIsh|TypeNameWithTypeArguments name;
    PackageQualifier|Super? qualifier;
    {PositionalArgumentIsh*} arguments;
    
    return ClassSpecifier(extension(name, qualifier, arguments));
}
