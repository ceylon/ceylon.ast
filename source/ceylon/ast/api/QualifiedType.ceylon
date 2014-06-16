shared class QualifiedType(qualifyingType, TypeNameWithArguments nameAndArgs)
        extends SimpleType(nameAndArgs) {
    
    shared SimpleType qualifyingType;
    
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
    
    shared QualifiedType copy(SimpleType qualifyingtype = this.qualifyingType, TypeNameWithArguments nameAndArgs = this.nameAndArgs)
            => QualifiedType(qualifyingType, nameAndArgs);
}
