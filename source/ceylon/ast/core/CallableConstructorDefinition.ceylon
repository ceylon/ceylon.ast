"A callable constructor definition.
 
 A callable constructor definition has the following components:
 - [[annotations]],
 - the ‘`new`’ keyword,
 - the [[name]], if present,
 - the [[parameters]],
 - the [[extended type|extendedType]], if present, and
 - the [[block]].
 
 Examples (multi-line):
 
     // 2D point
     shared new polar(r, φ) {
         Float r;
         Float φ;
         this.x = r * cos(φ);
         this.y = r * sin(φ);
         this.r = r;
         this.φ = φ;
     }
 
     // 3D location in homogenous coordinates
     shared new cartesian(Float x, Float y, Float z)
             extends super.cartesian(x, y, z, 1.0) {}
     
     // default constructor
     shared new(String name, Date|String dateOfBirth) {
         this.name = name;
         this.dateOfBirth
                 = switch (dateOfBirth)
                   case (is Date) dateOfBirth
                   case (is String) parseDate(dateOfBirth);
     }"
shared class CallableConstructorDefinition(name, parameters, block, extendedType = null, annotations = Annotations())
        extends ConstructorDefinition() {
    
    "The name of the constructor, if present.
     
     The name can also be absent, in which case this is the _default constructor_."
    shared actual LIdentifier? name;
    "The parameters of the constructor."
    shared actual Parameters parameters;
    "The block of the constructor."
    shared actual Block block;
    "The extended type of the constructor, if present."
    shared actual ExtendedType? extendedType;
    "The annotations of the constructor."
    shared actual Annotations annotations;
    
    shared actual <Annotations|LIdentifier|Parameters|ExtendedType|Block>[] children
            = concatenate(
        [annotations],
        emptyOrSingleton(name),
        [parameters],
        emptyOrSingleton(extendedType),
        [block]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCallableConstructorDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is CallableConstructorDefinition that) {
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
            if (exists name) {
                if (exists name_ = that.name) {
                    if (name != name_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.name exists) {
                return false;
            }
            return parameters == that.parameters && block == that.block && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * ((name?.hash else 0) + 31 * (parameters.hash + 31 * (block.hash + 31 * ((extendedType?.hash else 0) + 31 * annotations.hash))));
    
    shared CallableConstructorDefinition copy(LIdentifier? name = this.name, Parameters parameters = this.parameters, Block block = this.block, ExtendedType? extendedType = this.extendedType, Annotations annotations = this.annotations) {
        value ret = CallableConstructorDefinition(name, parameters, block, extendedType, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
