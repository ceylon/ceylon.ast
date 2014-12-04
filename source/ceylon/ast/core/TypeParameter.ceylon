"A type parameter of a class, method or function.
 
 The type parameter may optionally declare a type [[variance]]
 (without one, it is *invariant*) and/or a default type argument
 (used when the use-site declares some but not all type arguments).
 
 Examples:
 
     out Element
     out Absent=Null"
shared class TypeParameter(parameterName, variance = null, defaultArgument = null)
        extends Node() {
    
    "The name of the type parameter."
    shared TypeName parameterName;
    "The variance of the type parameter,
     or [[null]] for an invariant type parameter."
    shared Variance? variance;
    "The default type argument for the type parameter,
     or [[null]] if there is no default type argument."
    shared Type? defaultArgument;
    
    shared actual [Variance, UIdentifier, Type=]|[UIdentifier, Type=] children;
    if (exists variance) {
        children = [variance, parameterName, *emptyOrSingleton(defaultArgument)];
    } else {
        children = [parameterName, *emptyOrSingleton(defaultArgument)];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeParameter(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeParameter that) {
            if (exists variance) {
                if (exists variance_ = that.variance) {
                    if (variance != variance_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.variance exists) {
                return false;
            }
            if (exists defaultArgument) {
                if (exists defaultArgument_ = that.defaultArgument) {
                    if (defaultArgument != defaultArgument_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.defaultArgument exists) {
                return false;
            }
            return parameterName == that.parameterName;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (parameterName.hash + 31 * ((variance?.hash else 0) + 31 * (defaultArgument?.hash else 0)));
    
    shared TypeParameter copy(TypeName parameterName = this.parameterName, Variance? variance = this.variance, Type? defaultArgument = this.defaultArgument) {
        value ret = TypeParameter(parameterName, variance, defaultArgument);
        copyExtraInfoTo(ret);
        return ret;
    }
}
