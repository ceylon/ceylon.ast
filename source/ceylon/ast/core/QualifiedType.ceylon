"A qualified type, consisting of a [[qualifying type|qualifyingType]] and
 a [[type name with arguments|nameAndArgs]], separated by a member operator.
 
 ~~~
 Foo.Bar // Foo is the qualifying type, Bar the type name
 X<A>.Y<B>.Z<C> // X<A>.Y<B> is the qualifying type – another qualified type –, Z the type name and B the type arguments
 ~~~"
shared class QualifiedType(qualifyingType, nameAndArgs)
        extends SimpleType() {
    
    "The qualifying type (the part before the member operator)."
    shared SimpleType|GroupedType qualifyingType;
    shared actual TypeNameWithArguments nameAndArgs;
    
    shared actual [TypeNameWithArguments, SimpleType|GroupedType] children = [nameAndArgs, qualifyingType];
    
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
    
    shared QualifiedType copy(SimpleType|GroupedType qualifyingtype = this.qualifyingType, TypeNameWithArguments nameAndArgs = this.nameAndArgs) {
        value ret = QualifiedType(qualifyingType, nameAndArgs);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
