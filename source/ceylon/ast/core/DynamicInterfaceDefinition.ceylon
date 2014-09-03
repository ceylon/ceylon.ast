"A dynamic interface definition.
 
 A dynamic interface definition has the following components:
 - [[annotations]],
 - the `dynamic` keyword,,
 - the [[name]],
 - the [[type parameters|typeParameters]], if present,
 - the [[case types|caseTypes]], if present,
 - the [[satisfied types|satisfiedTypes]], if present,
 - the [[type constraints|typeConstraints]], if present, and
 - the [[body]].
 
 Examples (multi-line):
 
     shared dynamic Document {
         shared formal String xmlVersion;
         shared formal StyleSheetList styleSheets;
         shared formal String documentURI;
         // ...
     }
 
     shared dynamic Promise {
         shared formal Promise \\ithen(void onFulfilled(dynamic result) => noop(), void onRejected(dynamic error) => noop());
         shared formal Promise catch(void onRejected(dynamic error) => noop());
     }"
shared class DynamicInterfaceDefinition(name, body, caseTypes = null, satisfiedTypes = null, typeParameters = null, typeConstraints = [], annotations = Annotations())
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
        emptyOrSingleton(typeParameters),
        typeConstraints,
        [body]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDynamicInterfaceDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is DynamicInterfaceDefinition that) {
            if (exists caseTypes) {
                if (exists caseTypes_ = that.caseTypes) {
                    if (exists satisfiedTypes) {
                        if (exists satisfiedTypes_ = that.satisfiedTypes) {
                            if (exists typeParameters) {
                                if (exists typeParameters_ = that.typeParameters) {
                                    return caseTypes == caseTypes_ && satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            }
                        } else {
                            return false;
                        }
                    } else {
                        if (!(that.satisfiedTypes exists)) {
                            if (exists typeParameters) {
                                if (exists typeParameters_ = that.typeParameters) {
                                    return typeParameters == typeParameters_ && name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            }
                        } else {
                            return false;
                        }
                    }
                } else {
                    return false;
                }
            } else {
                if (!(that.caseTypes exists)) {
                    if (exists satisfiedTypes) {
                        if (exists satisfiedTypes_ = that.satisfiedTypes) {
                            if (exists typeParameters) {
                                if (exists typeParameters_ = that.typeParameters) {
                                    return satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            }
                        } else {
                            return false;
                        }
                    } else {
                        if (!(that.satisfiedTypes exists)) {
                            if (exists typeParameters) {
                                if (exists typeParameters_ = that.typeParameters) {
                                    return typeParameters == typeParameters_ && name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            }
                        } else {
                            return false;
                        }
                    }
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (body.hash + 31 * ((caseTypes?.hash else 0) + 31 * ((satisfiedTypes?.hash else 0) + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))))));
    
    shared DynamicInterfaceDefinition copy(UIdentifier name = this.name, InterfaceBody body = this.body, CaseTypes? caseTypes = this.caseTypes, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = DynamicInterfaceDefinition(name, body, caseTypes, satisfiedTypes, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
