"A type name and, optionally, type arguments."
see (`class BaseType`, `class QualifiedType`)
shared class TypeNameWithArguments(name, arguments = null)
        extends TypeIsh([name, *(arguments else [])]) {
    "The type name."
    shared TypeName name;
    "The type arguments, if any."
    shared TypeArguments? arguments;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeNameWithArguments(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeNameWithArguments that) {
            if (exists arguments) {
                if (exists args = that.arguments) {
                    return name == that.name && arguments == args;
                } else {
                    return false;
                }
            } else {
                return !(that.arguments exists) && name == that.name;
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash {
        variable value hash = 1;
        hash = 31 * hash + name.hash;
        hash = 31 * hash + (arguments?.hash else 0);
        return hash;
    }
    
    shared TypeNameWithArguments copy(TypeName name = this.name, TypeArguments? arguments = this.arguments) {
        value ret = TypeNameWithArguments(name, arguments);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
