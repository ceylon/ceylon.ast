"The name of a parameter declared in the body of the function or class,
 along with a default value for the parameter.
 
 Examples:
 
     length = text.size
     status = ok"
see (`class ParameterReference`)
shared class DefaultedParameterReference(parameter, specifier)
        extends DefaultedParameter() {
    
    "The parameter reference."
    shared actual ParameterReference parameter;
    "The default value."
    shared actual Specifier specifier;
    
    shared actual [ParameterReference, Specifier] children = [parameter, specifier];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDefaultedParameterReference(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitDefaultedParameterReference(this);
    
    shared actual Boolean equals(Object that) {
        if (is DefaultedParameterReference that) {
            return parameter==that.parameter && specifier==that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (parameter.hash + 31*specifier.hash);
    
    shared DefaultedParameterReference copy(ParameterReference parameter = this.parameter, Specifier specifier = this.specifier) {
        value ret = DefaultedParameterReference(parameter, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
