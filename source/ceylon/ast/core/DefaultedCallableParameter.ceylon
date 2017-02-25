"A [[callable parameter|CallableParameter]], along with a default implementation for the parameter.
 
 Examples:
 
     Float weight(Item item) => item.cost
     void log(String message) => process.writeErrorLine(message);"
see (`class CallableParameter`)
shared class DefaultedCallableParameter(parameter, specifier)
        extends DefaultedParameter() {
    
    "The parameter."
    shared actual CallableParameter parameter;
    "The default implementation."
    shared actual LazySpecifier specifier;
    
    shared actual [CallableParameter, LazySpecifier] children = [parameter, specifier];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDefaultedCallableParameter(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitDefaultedCallableParameter(this);
    
    shared actual Boolean equals(Object that) {
        if (is DefaultedCallableParameter that) {
            return parameter==that.parameter && specifier==that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (parameter.hash + 31*specifier.hash);
    
    shared DefaultedCallableParameter copy(CallableParameter parameter = this.parameter, LazySpecifier specifier = this.specifier) {
        value ret = DefaultedCallableParameter(parameter, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
