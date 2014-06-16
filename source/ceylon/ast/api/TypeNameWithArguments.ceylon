"Workaround for [ceylon/ceylon-compiler#1665](https://github.com/ceylon/ceylon-compiler/issues/1665)"
<Type|TypeName>[] bug1665Workaround1(TypeName name, TypeArguments? arguments) => [name, *(arguments else [])];

"A type name and, optionally, type arguments."
see (`class BaseType`/*TODO `class QualifiedType` as well */)
shared class TypeNameWithArguments(name, arguments = null)
        extends Node(bug1665Workaround1(name, arguments)) { // TODO extends Node([name, *(arguments else [])]) {
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
    
    shared TypeNameWithArguments copy(TypeName name = this.name, TypeArguments? arguments = this.arguments)
            => TypeNameWithArguments(name, arguments);
}
