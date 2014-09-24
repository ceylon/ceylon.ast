"An interface alias definition.
 
 An interface alias definition has the following components:
 - [[annotations]],
 - the ‘`interface`’ keyword,
 - the [[name]],
 - the [[type parameters|typeParameters]], if present,
 - the [[case types|caseTypes]], if present,
 - the [[satisfied types|satisfiedTypes]], if present,
 - the [[type constraints|typeConstraints]], if present,
 - the [[specifier]], and
 - a terminating semicolon.
 
 (While semantically, an interface alias may never have [[case types|caseTypes]]
 or [[satisfy|satisfiedTypes]] other types, these nodes may syntactically still be present.)
 
 Examples:
 
     shared interface People => {Person*};
     shared interface Compare<Value> => Comparison(Value,Value);"
shared class InterfaceAliasDefinition(name, specifier, caseTypes = null, satisfiedTypes = null, typeParameters = null, typeConstraints = [], annotations = Annotations())
        extends AnyInterface() {
    
    "The name of the interface."
    shared actual UIdentifier name;
    "The specifier of the interface."
    shared TypeSpecifier specifier;
    "The case types of the interface, if present.
     
     (In fact, a class alias may never have case types,
     but nevertheless it’s syntactically valid.)"
    shared actual CaseTypes? caseTypes;
    "The satisfied types of the interface, if present."
    shared actual SatisfiedTypes? satisfiedTypes;
    "The type parameters of the interface, if present."
    shared actual TypeParameters? typeParameters;
    "The type constraints of the interface, if any."
    shared actual TypeConstraint[] typeConstraints;
    "The annotations of the interface."
    shared actual Annotations annotations;
    
    shared actual <Annotations|UIdentifier|TypeParameters|CaseTypes|SatisfiedTypes|TypeConstraint|TypeSpecifier>[] children
            = concatenate(
        [annotations],
        [name],
        emptyOrSingleton(typeParameters),
        emptyOrSingleton(caseTypes),
        emptyOrSingleton(satisfiedTypes),
        emptyOrSingleton(typeParameters),
        typeConstraints,
        [specifier]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInterfaceAliasDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is InterfaceAliasDefinition that) {
            if (exists caseTypes) {
                if (exists caseTypes_ = that.caseTypes) {
                    if (exists satisfiedTypes) {
                        if (exists satisfiedTypes_ = that.satisfiedTypes) {
                            if (exists typeParameters) {
                                if (exists typeParameters_ = that.typeParameters) {
                                    return caseTypes == caseTypes_ && satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                    return typeParameters == typeParameters_ && name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                    return satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                    return typeParameters == typeParameters_ && name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                } else {
                                    return false;
                                }
                            } else {
                                if (!(that.typeParameters exists)) {
                                    return name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
            => 31 * (name.hash + 31 * (specifier.hash + 31 * ((caseTypes?.hash else 0) + 31 * ((satisfiedTypes?.hash else 0) + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))))));
    
    shared InterfaceAliasDefinition copy(UIdentifier name = this.name, TypeSpecifier specifier = this.specifier, CaseTypes? caseTypes = this.caseTypes, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = InterfaceAliasDefinition(name, specifier, caseTypes, satisfiedTypes, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
