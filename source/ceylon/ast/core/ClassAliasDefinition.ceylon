"A class alias definition.
 
 A class alias definition has the following components:
 - [[annotations]],
 - the ‘`class`’ keyword,
 - the [[name]],
 - the [[type parameters|typeParameters]], if present,
 - the [[parameters]],
 - the [[case types|caseTypes]], if present,
 - the [[extended type|extendedType]], if present,
 - the [[satisfied types|satisfiedTypes]], if present,
 - the [[type constraints|typeConstraints]], if present,
 - the [[specifier]], and
 - a terminating semicolon.
 
 (While semantically, a class alias may never have [[case types|caseTypes]]
 or [[extend|extendedType]] or [[satisfy|satisfiedTypes]] other types,
 these nodes may syntactically still be present.)
 
 Examples:
 
     shared class VariadicString(Character* characters) => String(characters);
     shared class MemberName(String name) => LIdentifier(name);"
shared class ClassAliasDefinition(name, parameters, specifier, caseTypes, extendedType, satisfiedTypes, typeParameters, typeConstraints, annotations)
        extends AnyClass() {
    
    "The name of the class."
    shared actual UIdentifier name;
    "The parameters of the class."
    shared actual Parameters parameters;
    "The specifier of the class."
    shared ClassSpecifier specifier;
    "The case types of the class.
     
     (In fact, a class alias may never have case types,
     but nevertheless it’s syntactically valid.)"
    shared actual CaseTypes? caseTypes;
    "The extended type of the class.
     
     (In fact, a class alias may never extend a class,
     but nevertheless it’s syntactically valid.)"
    shared actual ExtendedType? extendedType;
    "The satisfied types of the class.
     
     (In fact, a class alias may never satisfy types,
     but nevertheless it’s syntactically valid.)"
    shared actual SatisfiedTypes? satisfiedTypes;
    "The type parameters of the class."
    shared actual TypeParameters? typeParameters;
    "The type constraints on the class’ [[type parameters|typeParameters]]."
    shared actual TypeConstraint[] typeConstraints;
    "The annotations of the class."
    shared actual Annotations annotations;
    
    shared actual <Annotations|UIdentifier|TypeParameters|Parameters|CaseTypes|ExtendedType|SatisfiedTypes|TypeConstraint|ClassSpecifier>[] children
            = concatenate(
        [annotations],
        [name],
        emptyOrSingleton(typeParameters),
        [parameters],
        emptyOrSingleton(caseTypes),
        emptyOrSingleton(extendedType),
        emptyOrSingleton(satisfiedTypes),
        emptyOrSingleton(typeParameters),
        typeConstraints,
        [specifier]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassAliasDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is ClassAliasDefinition that) {
            if (exists caseTypes) {
                if (exists caseTypes_ = that.caseTypes) {
                    if (exists extendedType) {
                        if (exists extendedType_ = that.extendedType) {
                            if (exists satisfiedTypes) {
                                if (exists satisfiedTypes_ = that.satisfiedTypes) {
                                    if (exists typeParameters) {
                                        if (exists typeParameters_ = that.typeParameters) {
                                            return caseTypes == caseTypes_ && extendedType == extendedType_ && satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                            return typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                        if (!(that.extendedType exists)) {
                            if (exists satisfiedTypes) {
                                if (exists satisfiedTypes_ = that.satisfiedTypes) {
                                    if (exists typeParameters) {
                                        if (exists typeParameters_ = that.typeParameters) {
                                            return satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                            return typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
            } else {
                if (!(that.caseTypes exists)) {
                    if (exists extendedType) {
                        if (exists extendedType_ = that.extendedType) {
                            if (exists satisfiedTypes) {
                                if (exists satisfiedTypes_ = that.satisfiedTypes) {
                                    if (exists typeParameters) {
                                        if (exists typeParameters_ = that.typeParameters) {
                                            return extendedType == extendedType_ && satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                            return typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                        if (!(that.extendedType exists)) {
                            if (exists satisfiedTypes) {
                                if (exists satisfiedTypes_ = that.satisfiedTypes) {
                                    if (exists typeParameters) {
                                        if (exists typeParameters_ = that.typeParameters) {
                                            return satisfiedTypes == satisfiedTypes_ && typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
                                            return typeParameters == typeParameters_ && name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
                                        } else {
                                            return false;
                                        }
                                    } else {
                                        if (!(that.typeParameters exists)) {
                                            return name == that.name && parameters == that.parameters && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
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
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (parameters.hash + 31 * (specifier.hash + 31 * ((caseTypes?.hash else 0) + 31 * ((extendedType?.hash else 0) + 31 * ((satisfiedTypes?.hash else 0) + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))))))));
    
    shared ClassAliasDefinition copy(UIdentifier name = this.name, Parameters parameters = this.parameters, ClassSpecifier specifier = this.specifier, CaseTypes? caseTypes = this.caseTypes, ExtendedType? extendedType = this.extendedType, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = ClassAliasDefinition(name, parameters, specifier, caseTypes, extendedType, satisfiedTypes, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
