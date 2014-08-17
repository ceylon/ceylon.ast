"A specified inline variable declaration.
 
 Examples:
 
     num = parseFloat(numString)
     String name = person.name"
shared class SpecifiedVariable(name, specifier, type)
        extends Variable() {
    
    shared actual MemberName name;
    "The specifier of the variable (required)."
    shared actual Specifier specifier;
    shared actual Type? type;
    
    //shared actual [Type, LIdentifier, Specifier]|[LIdentifier, Specifier] children;
    // TODO use above more precise type when backend bug is fixed
    shared actual Node[] children;
    if (exists type) {
        children = [type, name, specifier];
    } else {
        children = [name, specifier];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpecifiedVariable(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpecifiedVariable that) {
            if (exists type) {
                if (exists type_ = that.type) {
                    return type == type_ && name == that.name && specifier == that.specifier;
                } else {
                    return false;
                }
            } else {
                if (!(that.type exists)) {
                    return name == that.name && specifier == that.specifier;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (specifier.hash + 31 * (type?.hash else 0)));
    
    shared SpecifiedVariable copy(LIdentifier name = this.name, Specifier specifier = this.specifier, Type? type = this.type) {
        value ret = SpecifiedVariable(name, specifier, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
