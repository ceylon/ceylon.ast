import ceylon.ast.core {
    Annotations,
    CaseTypes,
    Declaration,
    InterfaceBody,
    InterfaceDefinition,
    SatisfiedTypes,
    TypeConstraint,
    TypeParameters
}

"""Creates an interface definition.
   
   Usage example:
   
       interfaceDefinition {
           name = "MyInterface";
           caseTypes = { "CT1", "CT2" };
           satisfiedTypes = { "Identifiable" };
           typeParameters = { "Element", "Absent" };
           annotations = annotations {
               "My interface does something.
                
                It’s the most amazing interface ever.";
               "shared", "sealed"
           };
           
           functionDefinition {
               // ...
           },
           functionDefinition {
               // ...
           }
       }"""
shared InterfaceDefinition interfaceDefinition(
    name,
    caseTypes = null,
    satisfiedTypes = null,
    typeParameters = null,
    typeConstraints = [],
    annotations = Annotations(),
    body = InterfaceBody([])) {
    
    IdentifierIsh name;
    {CaseTypeIsh*}|CaseTypes? caseTypes;
    {PrimaryTypeIsh*}|SatisfiedTypes? satisfiedTypes;
    {TypeParameterIsh*}|TypeParameters? typeParameters;
    {TypeConstraint*} typeConstraints;
    Annotations annotations;
    {Declaration*}|InterfaceBody body;
    
    return InterfaceDefinition {
        name = uidentifier(name);
        body = interfaceBody(body);
        caseTypes = caseTypes_internal(caseTypes);
        satisfiedTypes = satisfiedTypes_internal(satisfiedTypes);
        typeParameters = typeParameters_internal(typeParameters);
        typeConstraints = typeConstraints.sequence();
        annotations = annotations;
    };
}
