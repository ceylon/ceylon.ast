import ceylon.ast.core {
    Annotations,
    Declaration,
    DynamicModifier,
    FunctionDefinition,
    FunctionModifier,
    Parameter,
    Parameters,
    Statement,
    Type,
    TypeConstraint,
    TypeParameters,
    VoidModifier
}

"""Creates a function definition.
   
   Usage example:
   
       functionDefinition {
           name = "myFunction";
           type = VoidModifier();
           parameters = {
               ValueParameter {
                   type = baseType("String");
                   name = lidentifier("name");
               }
           };
           typeParameters = { "Element" };
           annotations = annotations {
               "My function does something.
                
                It’s the most amazing function ever.";
               "shared", "actual", "default"
           };
           
           invocationStatement { invoked = "print"; StringLiteral("Hello, World!") }
       }"""
shared FunctionDefinition functionDefinition(
    name,
    type,
    parameters = [Parameters()],
    block = [],
    typeParameters = null,
    typeConstraints = [],
    annotations = Annotations()) {
    
    IdentifierIsh name;
    Type|VoidModifier|FunctionModifier|DynamicModifier type;
    {Parameters+}|Parameters|{Parameter*} parameters;
    {TypeParameterIsh*}|TypeParameters? typeParameters;
    {TypeConstraint*} typeConstraints;
    Annotations annotations;
    {Declaration|Statement*} block;
    
    return FunctionDefinition {
        name = lidentifier(name);
        type = type;
        parameterLists = parameterLists_internal(parameters);
        definition = package.block(block);
        typeParameters = typeParameters_internal(typeParameters);
        typeConstraints = typeConstraints.sequence();
        annotations = annotations;
    };
}
