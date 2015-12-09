import ceylon.ast.core {
    Annotations,
    Declaration,
    ExtendedType,
    Statement,
    ValueConstructorDefinition
}

"""Creates a value constructor definition.
   
   Usage example:
   
       valueConstructorDefinition {
           name = "red";
           annotations = annotations {
               "The color red.";
               "shared"
           };
           
           ValueSpecification {
               qualifier = This();
               name = lidentifier("rgb");
               specifier = Specifier(IntegerLiteral("#FF0000"));
           }
       }"""
shared ValueConstructorDefinition valueConstructorDefinition(
    name,
    block = [],
    extendedType = null,
    annotations = Annotations()) {
    
    IdentifierIsh name;
    {Declaration|Statement*} block;
    ExtendedType? extendedType;
    Annotations annotations;
    
    return ValueConstructorDefinition {
        name = lidentifier(name);
        block = package.block(block);
        extendedType = extendedType;
        annotations = annotations;
    };
}
