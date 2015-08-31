import ceylon.ast.core {
    Annotations,
    ConstructorDefinition,
    Declaration,
    ExtendedType,
    Parameter,
    Parameters,
    Statement
}

"""Creates a constructor definition.
   
   Usage example:
   
       constructorDefinition {
           name = "rgb";
           parameters = {
               ValueParameter {
                   type = baseType("Integer");
                   name = lidentifier("rgb");
               }
           };
           annotations = annotations {
               "Constructs a color, taking the red, green, and blue values
                from the argument integer.";
               "shared"
           };
           
           ValueSpecification {
               qualifier = This();
               name = lidentifier("rgb");
               specifier = Specifier(baseExpression("rgb"));
           }
       }"""
shared ConstructorDefinition constructorDefinition(
    name,
    parameters = Parameters(),
    block = [],
    extendedType = null,
    annotations = Annotations()) {
    
    IdentifierIsh name;
    Parameters|{Parameter*} parameters;
    {Declaration|Statement*} block;
    ExtendedType? extendedType;
    Annotations annotations;
    
    return ConstructorDefinition {
        name = lidentifier(name);
        block = package.block(block);
        parameters = parameters_internal(parameters);
        extendedType = extendedType;
        annotations = annotations;
    };
}
