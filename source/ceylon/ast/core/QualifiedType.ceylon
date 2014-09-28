"A qualified type, consisting of a [[qualifying type|qualifyingType]] and
 a [[type name with arguments|nameAndArgs]], separated by a member operator.
 
 (To create a `QualifiedType`, consider using the [[qualifiedType]]
 utility function in order to make your code more readable.)
 
 ~~~
 Foo.Bar // Foo is the qualifying type, Bar the type name
 X<A>.Y<B>.Z<C> // X<A>.Y<B> is the qualifying type – another qualified type –, Z the type name and C the type arguments
 ~~~"
see (`function qualifiedType`)
shared class QualifiedType(qualifyingType, nameAndArgs)
        extends SimpleType() {
    
    "The qualifying type (the part before the member operator)."
    shared SimpleType|GroupedType qualifyingType;
    shared actual TypeNameWithTypeArguments nameAndArgs;
    
    shared actual [TypeNameWithTypeArguments, SimpleType|GroupedType] children = [nameAndArgs, qualifyingType];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformQualifiedType(this);
    
    shared actual Boolean equals(Object that) {
        if (is QualifiedType that) {
            return nameAndArgs == that.nameAndArgs && qualifyingType == that.qualifyingType;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * nameAndArgs.hash + nameAndArgs.hash;
    
    shared QualifiedType copy(SimpleType|GroupedType qualifyingType = this.qualifyingType, TypeNameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = QualifiedType(qualifyingType, nameAndArgs);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"""A utility function to create a [[QualifiedType]] directly from a string,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   (The type arguments will all be invariant; if you want to use use-site variance,
   you have to construct the [[TypeArgument]] objects yourself.)
   
   Usage examples:
   
       qualifiedType("X", "Y") // X.Y
       qualifiedType(qualifiedType(baseType("X", "A"), "Y", "B"), "Z", "C") //X<A>.Y<B>.Z<C>"""
shared QualifiedType qualifiedType(String|SimpleType|GroupedType qualifyingType, String name, String|Type* typeArguments) {
    BaseType|OtherType toType<OtherType>(String|OtherType typeArgument)
            given OtherType satisfies Type {
        switch (typeArgument)
        case (is String) { return baseType(typeArgument); }
        case (is OtherType) { return typeArgument; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType<Type>).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    return QualifiedType(toType(qualifyingType), TypeNameWithTypeArguments(UIdentifier(name), args));
}
