import ceylon.ast.core {
    Extension,
    PackageQualifier,
    Super,
    TypeNameWithTypeArguments
}

"""Creates an [[Extension]] from its [[name]], [[arguments]], and optionally [[qualifier]].
   
   Note: this function does not support [[null]] [[arguments|Extension.arguments]].
   If you want to define a class with constructors, do it manually.
   
   Usage examples:
   
       extension("Object")
       extension {
           name = "Point";
           baseExpression("y"),
           baseExpression("x")
       }"""
shared Extension extension(name, qualifier = null, arguments = {}) {
    IdentifierIsh|TypeNameWithTypeArguments name;
    PackageQualifier|Super? qualifier;
    {PositionalArgumentIsh*} arguments;
    
    TypeNameWithTypeArguments nameAndArgs;
    switch (name)
    case (is IdentifierIsh) { nameAndArgs = TypeNameWithTypeArguments(uidentifier(name)); }
    case (is TypeNameWithTypeArguments) { nameAndArgs = name; }
    
    return Extension(nameAndArgs, positionalArguments(*arguments), qualifier);
}
