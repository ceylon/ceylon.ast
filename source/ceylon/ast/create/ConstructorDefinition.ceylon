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
   
       TODO"""
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
