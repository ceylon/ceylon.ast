import ceylon.ast.core {
    ClassInstantiation,
    Super,
    TypeNameWithTypeArguments
}

"""Creates a [[ClassInstantiation]] from its [[name]], [[arguments]], and optionally [[qualifier]].
   
   Keep in mind that [[ClassInstantiation]] appears only as child node of [[ceylon.ast.core::ExtendedType]]
   and [[ceylon.ast.core::ClassSpecifier]], for which you should just use [[extendedType]] / [[classSpecifier]]
   instead. A normal class instantiation is just a regular [[ceylon.ast.core::Invocation]].
   
   Usage examples:
   
       classInstantiation("Sup")
       classInstantiation {
           name = "Point";
           baseExpression("x"),
           baseExpression("y")
       }"""
// TODO perhaps we should just not share this function?
shared ClassInstantiation classInstantiation(name, qualifier = null, arguments = {}) {
    IdentifierIsh|TypeNameWithTypeArguments name;
    Super|IdentifierIsh|TypeNameWithTypeArguments? qualifier;
    {PositionalArgumentIsh*} arguments;
    
    TypeNameWithTypeArguments tna;
    switch (name)
    case (is IdentifierIsh) { tna = TypeNameWithTypeArguments(uidentifier(name)); }
    case (is TypeNameWithTypeArguments) { tna = name; }
    
    Super|TypeNameWithTypeArguments? q;
    switch (qualifier)
    case (is IdentifierIsh) { q = TypeNameWithTypeArguments(uidentifier(qualifier)); }
    case (is TypeNameWithTypeArguments) { q = qualifier; }
    case (is Super) { q = qualifier; }
    case (null) { q = null; }
    
    return ClassInstantiation(tna, positionalArguments(*arguments), q);
}
