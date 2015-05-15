import ceylon.ast.core {
    BaseType,
    GroupedType,
    QualifiedType,
    SimpleType,
    Type,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments
}

"""A utility function to create a [[QualifiedType]] directly from a string,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   This function is not suitable in all cases; if the following restrictions affect you,
   you should instead use the regular constructors:
   
   - the type arguments will all be invariant, use-site variance is unavailable
   - empty [[typeArguments]] mean the absence of a type argument list;
     an empty but present [[type argument list|TypeArguments]] is unavailable
   
   Usage examples:
   
       qualifiedType("X", "Y") // X.Y
       qualifiedType(qualifiedType(baseType("X", "A"), "Y", "B"), "Z", "C") //X<A>.Y<B>.Z<C>"""
shared QualifiedType qualifiedType(IdentifierIsh|SimpleType|GroupedType qualifyingType, IdentifierIsh name, IdentifierIsh|Type* typeArguments) {
    BaseType|OtherType toType<OtherType>(IdentifierIsh|OtherType typeArgument)
            given OtherType satisfies Type {
        switch (typeArgument)
        case (is IdentifierIsh) { return baseType(typeArgument); }
        case (is OtherType) { return typeArgument; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType<Type>).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    return QualifiedType(toType(qualifyingType), TypeNameWithTypeArguments(uidentifier(name), args));
}
