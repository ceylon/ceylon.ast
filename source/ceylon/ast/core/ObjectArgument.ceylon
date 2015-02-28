"An object argument definition.
 
 Examples (multi-line):
 
     object destroyable satisfies Destroyable {
         shared actual void destroy(Anything error) => process.exit(1);
     }
 
     object items satisfies Iterable<Integer> {
         variable Integer accesses = 0;
         shared actual Iterator<Integer> iterator() => (0..(++accesses)).iterator();
     }"
shared class ObjectArgument(name, body, extendedType = null, satisfiedTypes = null)
        extends InlineDefinitionArgument() {
    
    "The name of the object,
     as well as of the parameter it’s assigned to."
    shared actual LIdentifier name;
    "The body of the associated anonymous class."
    shared ClassBody body;
    "The extended type of the associated anonymous class, if present."
    shared ExtendedType? extendedType;
    "The satisfied types of the associated anonymous class, if present."
    shared SatisfiedTypes? satisfiedTypes;
    
    shared actual <LIdentifier|ExtendedType|SatisfiedTypes|ClassBody>[] children
            = concatenate(
        [name],
        emptyOrSingleton(extendedType),
        emptyOrSingleton(satisfiedTypes),
        [body]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformObjectArgument(this);
    
    shared actual Boolean equals(Object that) {
        if (is ObjectArgument that) {
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
            return name == that.name && body == that.body;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (body.hash + 31 * ((extendedType?.hash else 0) + 31 * (satisfiedTypes?.hash else 0))));
    
    shared ObjectArgument copy(LIdentifier name = this.name, ClassBody body = this.body, ExtendedType? extendedType = this.extendedType, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes) {
        value ret = ObjectArgument(name, body, extendedType, satisfiedTypes);
        copyExtraInfoTo(ret);
        return ret;
    }
}
