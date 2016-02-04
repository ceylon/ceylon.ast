"An object expression, that is,
 the keyword ‘`object`’, followed by an optional [[extended type|extendedType]]
 and optional [[satisfied types|satisfiedTypes]], and then a [[body]].
 
 Examples:
 
     object satisfies Iterator<Anything> { next() => finished; }"
shared class ObjectExpression(body, extendedType = null, satisfiedTypes = null)
        extends Atom() {
    
    "The body of the associated anonymous class."
    shared ClassBody body;
    "The extended type of the associated anonymous class, if present."
    shared ExtendedType? extendedType;
    "The satisfied types of the associated anonymous class, if present."
    shared SatisfiedTypes? satisfiedTypes;
    
    shared actual <ClassBody|ExtendedType|SatisfiedTypes>[] children
            = concatenate(emptyOrSingleton(extendedType), emptyOrSingleton(satisfiedTypes), [body]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformObjectExpression(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitObjectExpression(this);

    shared actual Boolean equals(Object that) {
        if (is ObjectExpression that) {
            if (exists extendedType) {
                if (exists extendedType_ = that.extendedType) {
                    if (extendedType != extendedType_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.extendedType exists) {
                return false;
            }
            if (exists satisfiedTypes) {
                if (exists satisfiedTypes_ = that.satisfiedTypes) {
                    if (satisfiedTypes != satisfiedTypes_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.satisfiedTypes exists) {
                return false;
            }
            return body == that.body;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (body.hash + 31 * ((extendedType?.hash else 0) + 31 * (satisfiedTypes?.hash else 0)));
    
    shared ObjectExpression copy(ClassBody body = this.body, ExtendedType? extendedType = this.extendedType, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes) {
        value ret = ObjectExpression(body, extendedType, satisfiedTypes);
        copyExtraInfoTo(ret);
        return ret;
    }
}
