"A regular interface definition.
 
 An interface definition has the following components:
 - [[annotations]],
 - the `interface` keyword,
 - the [[name]],
 - the [[type parameters|typeParameters]], if present,
 - the [[case types|caseTypes]], if present,
 - the [[satisfied types|satisfiedTypes]], if present,
 - the [[type constraints|typeConstraints]], if present, and
 - the [[body]].
 
 Examples (multi-line):
 
     shared interface Printable {
         shared default void print() => package.print(this);
     }
 
     shared interface Numeric<Other> of Other
             satisfies Invertible<Other>
             given Other satisfies Numeric<Other> {
         shared formal Other times(other);
         shared formal Other divided(other);
     }"
shared class InterfaceDefinition(name, body, caseTypes = null, satisfiedTypes = null, typeParameters = null, typeConstraints = [], annotations = Annotations())
        extends AnyInterfaceDefinition() {
    
    "The name of the interface."
    shared actual UIdentifier name;
    "The body of the interface."
    shared actual InterfaceBody body;
    "The case types of the interface, if present."
    shared actual CaseTypes? caseTypes;
    "The satisfied types of the interface, if present."
    shared actual SatisfiedTypes? satisfiedTypes;
    "The type parameters of the interface, if present."
    shared actual TypeParameters? typeParameters;
    "The type constraints of the interface, if any."
    shared actual TypeConstraint[] typeConstraints;
    "The annotations of the interface."
    shared actual Annotations annotations;
    
    shared actual <Annotations|UIdentifier|TypeParameters|CaseTypes|SatisfiedTypes|TypeConstraint|InterfaceBody>[] children
            = concatenate(
        [annotations],
        [name],
        emptyOrSingleton(typeParameters),
        emptyOrSingleton(caseTypes),
        emptyOrSingleton(satisfiedTypes),
        typeConstraints,
        [body]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInterfaceDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is InterfaceDefinition that) {
            if (exists caseTypes) {
                if (exists caseTypes_ = that.caseTypes) {
                    if (caseTypes != caseTypes_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.caseTypes exists) {
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
            if (exists typeParameters) {
                if (exists typeParameters_ = that.typeParameters) {
                    if (typeParameters != typeParameters_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.typeParameters exists) {
                return false;
            }
            return name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (body.hash + 31 * ((caseTypes?.hash else 0) + 31 * ((satisfiedTypes?.hash else 0) + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))))));
    
    shared InterfaceDefinition copy(UIdentifier name = this.name, InterfaceBody body = this.body, CaseTypes? caseTypes = this.caseTypes, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = InterfaceDefinition(name, body, caseTypes, satisfiedTypes, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
