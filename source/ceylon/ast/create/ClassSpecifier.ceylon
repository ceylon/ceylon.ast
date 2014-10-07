import ceylon.ast.core {
    ClassSpecifier,
    Super,
    TypeNameWithTypeArguments
}

"""Creates a [[ClassSpecifier]] from its [[name]], [[arguments]], and optionally [[qualifier]].
   
   Usage examples:
   
       classSpecifier("Object")
       classSpecifier {
           name = "Point";
           baseExpression("y"),
           baseExpression("x")
       }"""
shared ClassSpecifier classSpecifier(name, qualifier = null, arguments = {}) {
    IdentifierIsh|TypeNameWithTypeArguments name;
    Super? qualifier;
    {PositionalArgumentIsh*} arguments;
    
    return ClassSpecifier(classInstantiation(name, qualifier, arguments));
}
