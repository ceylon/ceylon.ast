"The basis of the type node hierarchy: A type name with optional type arguments."
shared class TypeNameWithArguments(name, arguments)
        extends Type([name, *(arguments else [])]) {
    
    "The type name."
    shared TypeName name;
    "The type arguments, if any."
    shared TypeArguments? arguments;
    
    shared actual void visit(Visitor visitor) => visitor.visitTypeNameWithArguments(this);
    shared actual Node edit(Editor editor) => editor.editTypeNameWithArguments(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeNameWithArguments that) {
            if (name != that.name) {
                return false;
            }
            if (exists arguments) {
                if (exists args = that.arguments) {
                    return arguments == args;
                } else {
                    return false;
                }
            } else {
                return !(that.arguments exists);
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash {
        variable value hash = 1;
        hash = 31 * hash + name.hash;
        hash = 31 * hash + (arguments else 0).hash;
        return hash;
    }
    
    shared TypeNameWithArguments copy(TypeName name = this.name, TypeArguments? arguments = this.arguments)
            => TypeNameWithArguments(name, arguments);
}