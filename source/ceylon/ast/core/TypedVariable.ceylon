"A typed inline variable declaration.
 
 Examples:
     Integer|Float num
     String name"
shared class TypedVariable(name, type, specifier = null)
        extends Variable() {
    
    shared actual MemberName name;
    "The type of the variable (required)."
    shared actual Type type;
    shared actual Specifier? specifier;
    
    shared actual [Type, LIdentifier, Specifier=] children = [type, name, *emptyOrSingleton(specifier)];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypedVariable(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypedVariable that) {
            if (exists specifier) {
                if (exists specifier_ = that.specifier) {
                    return specifier == specifier_ && name == that.name && type == that.type;
                } else {
                    return false;
                }
            } else {
                if (!(that.specifier exists)) {
                    return name == that.name && type == that.type;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type.hash + 31 * (specifier?.hash else 0)));
    
    shared TypedVariable copy(LIdentifier name = this.name, Type type = this.type, Specifier? specifier = this.specifier) {
        value ret = TypedVariable(name, type, specifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
