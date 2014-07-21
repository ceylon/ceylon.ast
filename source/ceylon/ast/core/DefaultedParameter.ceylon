"A defaulted parameter.
 
 Examples:
 
     length = text.size
     Comparison comparing(Element x, Element y) => x.hash <=> y.hash"
shared abstract class DefaultedParameter()
        of DefaultedParameterReference
        extends Parameter() {
    
    "The parameter."
    shared formal RequiredParameter parameter;
    "The default value."
    shared formal Specifier specifier; // TODO Specifier|LazySpecifier, or perhaps AnySpecifier?
    
    shared actual formal [RequiredParameter, Specifier] children;
}
