"A specified inline variable declaration.
 
 Examples:
 
     num = parseFloat(numString)
     String name = person.name"
shared class SpecifiedVariable(name, specifier, type = null)
        extends Variable() {
    
    shared actual MemberName name;
    "The specifier of the variable (required)."
    shared actual Specifier specifier;
    shared actual Type|ValueModifier? type;
    
    shared actual [Type|ValueModifier, LIdentifier, Specifier]|[LIdentifier, Specifier] children;
    if (exists type) {
        children = [type, name, specifier];
    } else {
        children = [name, specifier];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpecifiedVariable(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpecifiedVariable(this);

    shared actual Boolean equals(Object that) {
        if (is SpecifiedVariable that) {
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
            return name == that.name && specifier == that.specifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (specifier.hash + 31 * (type?.hash else 0)));
    
    shared SpecifiedVariable copy(LIdentifier name = this.name, Specifier specifier = this.specifier, Type|ValueModifier? type = this.type) {
        value ret = SpecifiedVariable(name, specifier, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
