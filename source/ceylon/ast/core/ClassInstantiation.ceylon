"A class instantiation, used in an `extends` clause and in a class alias.
 
 (This node is only used as child of [[ExtendedType]] and [[ClassSpecifier]];
 for normal instantiations of a class, use a regular [[Invocation]]
 with a [[BaseExpression]] for the class name.)
 
 The class name may optionally be qualified with `super.`.
 
 Examples:
 
     Node()
     super.Entry<Key, Item>(key, item)"
shared class ClassInstantiation(name, arguments, qualifier = null)
        extends Node() {
    
    "The type name (and type arguments)
     of the instantiated class."
    shared TypeNameWithTypeArguments name;
    "The arguments to the instantiation."
    shared PositionalArguments arguments;
    "The `super` qualifier of the instantiation, if present."
    shared Super? qualifier;
    
    shared actual Node[] children;
    // TODO use more precise type when backend bug is fixed!
    //shared actual [TypeNameWithTypeArguments, PositionalArguments]|[Super, TypeNameWithTypeArguments, PositionalArguments] children;
    if (exists qualifier) {
        children = [qualifier, name, arguments];
    } else {
        children = [name, arguments];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassInstantiation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ClassInstantiation that) {
            if (exists qualifier) {
                if (exists qualifier_ = that.qualifier) {
                    return qualifier == qualifier_ && name == that.name && arguments == that.arguments;
                } else {
                    return false;
                }
            } else {
                if (!(that.qualifier exists)) {
                    return name == that.name && arguments == that.arguments;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (arguments.hash + 31 * (qualifier?.hash else 0)));
    
    shared ClassInstantiation copy(TypeNameWithTypeArguments name = this.name, PositionalArguments arguments = this.arguments, Super? qualifier = this.qualifier) {
        value ret = ClassInstantiation(name, arguments, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
