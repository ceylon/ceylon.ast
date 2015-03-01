"A [[value parameter|ValueParameter]], along with a default value for the parameter.
 
 Examples:
 
     Integer length = text.size
     Boolean discounted = false"
see (`class ValueParameter`)
shared class DefaultedValueParameter(parameter, specifier)
        extends DefaultedParameter() {
    
    "The parameter."
    shared actual ValueParameter parameter;
    "The default value."
    shared actual Specifier specifier;
    
    shared actual [ValueParameter, Specifier] children = [parameter, specifier];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDefaultedValueParameter(this);
    
    shared actual Boolean equals(Object that) {
        if (is DefaultedValueParameter that) {
            return parameter == that.parameter && specifier == that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (parameter.hash + 31 * specifier.hash);
    
    shared DefaultedValueParameter copy(ValueParameter parameter = this.parameter, Specifier specifier = this.specifier) {
        value ret = DefaultedValueParameter(parameter, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
