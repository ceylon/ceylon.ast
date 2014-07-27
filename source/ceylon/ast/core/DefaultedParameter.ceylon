"A defaulted parameter.
 
 Examples:
 
     length = text.size
     Comparison comparing(Element x, Element y) => x.hash <=> y.hash"
shared abstract class DefaultedParameter()
        of DefaultedValueParameter | DefaultedCallableParameter | DefaultedParameterReference
        extends Parameter() {
    
    "The parameter."
    shared formal RequiredParameter parameter;
    "The default value."
    shared formal AnySpecifier specifier;
    
    shared actual formal [RequiredParameter, AnySpecifier] children;
}
