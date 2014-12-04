"A constraint upon a type parameter.
 
 Examples:
 
     given Key satisfies Object
     given Printable of String | Integer | Float
     given T of T1|T2|T3 satisfies U"
shared class TypeConstraint(parameterName, caseTypes = null, satisfiedTypes = null)
        extends Node() {
    
    "The name of the type parameter to which the constraint applies."
    shared UIdentifier parameterName;
    "The type(s) that the type argument must be a case of."
    shared CaseTypes? caseTypes;
    "The type(s) that the type argument must satisfy."
    shared SatisfiedTypes? satisfiedTypes;
    
    shared actual [UIdentifier]|[UIdentifier, CaseTypes]|[UIdentifier, SatisfiedTypes]|[UIdentifier, CaseTypes, SatisfiedTypes] children;
    if (exists caseTypes) {
        if (exists satisfiedTypes) {
            children = [parameterName, caseTypes, satisfiedTypes];
        } else {
            children = [parameterName, caseTypes];
        }
    } else {
        if (exists satisfiedTypes) {
            children = [parameterName, satisfiedTypes];
        } else {
            children = [parameterName];
        }
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeConstraint(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeConstraint that) {
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
            return parameterName == that.parameterName;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (parameterName.hash + 31 * ((caseTypes?.hash else 0) + 31 * (satisfiedTypes?.hash else 0)));
    
    shared TypeConstraint copy(UIdentifier parameterName = this.parameterName, CaseTypes? caseTypes = this.caseTypes, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes) {
        value ret = TypeConstraint(parameterName, caseTypes, satisfiedTypes);
        copyExtraInfoTo(ret);
        return ret;
    }
}
