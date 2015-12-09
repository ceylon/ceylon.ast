import ceylon.ast.core {
    Annotations,
    CallableConstructorDefinition,
    Declaration,
    ExtendedType,
    Parameter,
    Parameters,
    Statement
}

"""Creates a callable constructor definition.
   
   Usage example:
   
       callableConstructorDefinition {
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
shared CallableConstructorDefinition callableConstructorDefinition(
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
    
    return CallableConstructorDefinition {
        name = lidentifier(name);
        block = package.block(block);
        parameters = parameters_internal(parameters);
        extendedType = extendedType;
        annotations = annotations;
    };
}
