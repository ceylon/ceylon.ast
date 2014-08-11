"A type name with optional type arguments.
 
 (To create a `BaseType`, consider using the [[baseType]]
 utility function in order to make your code more readable.)"
see (`function baseType`)
shared class BaseType(nameAndArgs)
        extends SimpleType() {
    
    shared actual TypeNameWithTypeArguments nameAndArgs;
    
    shared actual [TypeNameWithTypeArguments] children = [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseType(this);
    
    shared actual Boolean equals(Object that) {
        if (is BaseType that) {
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => nameAndArgs.hash;
    
    shared BaseType copy(TypeNameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = BaseType(nameAndArgs);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A utility function to create a [[BaseType]] directly from a string,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   (The type arguments will all be invariant; if you want to use use-site variance,
   you have to construct the [[TypeArgument]] objects yourself.)
   
   Usage examples:
   
       baseType("String") // String
       baseType("Sequence", "Integer") // Sequence<Integer>"""
shared BaseType baseType(String name, String|Type* typeArguments) {
    Type toType(String|Type typeArgument) {
        switch (typeArgument)
        case (is String) { return baseType(typeArgument); }
        case (is Type) { return typeArgument; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    return BaseType(TypeNameWithTypeArguments(UIdentifier(name), args));
}
