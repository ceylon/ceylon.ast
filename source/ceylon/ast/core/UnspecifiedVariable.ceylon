"An unspecified inline variable declaration.
 
 The value of the variable is assigned by the surrounding construct, e. g. the current iteration result, or the caught exception.
 
 Examples:
 
     element
     AssertionError ae"
shared class UnspecifiedVariable(name, type = null)
        extends Variable() {
    
    shared actual MemberName name;
    shared actual Type|ValueModifier? type;
    "An unspecified variable has no specifier."
    shared actual Null specifier => null;
    
    shared actual [Type|ValueModifier, LIdentifier]|[LIdentifier] children;
    if (exists type) {
        children = [type, name];
    } else {
        children = [name];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUnspecifiedVariable(this);
    
    shared actual Boolean equals(Object that) {
        if (is UnspecifiedVariable that) {
            if (exists type) {
                if (exists type_ = that.type) {
                    if (type != type_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.type exists) {
                return false;
            }
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type?.hash else 0));
    
    shared UnspecifiedVariable copy(LIdentifier name = this.name, Type|ValueModifier? type = this.type) {
        value ret = UnspecifiedVariable(name, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
