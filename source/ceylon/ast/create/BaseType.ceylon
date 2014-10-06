import ceylon.ast.core {
    BaseType,
    Type,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
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
