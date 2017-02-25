"A type argument, that is, a [[type]] with optional [[variance]] (use-site variance).
 
 (Use-site variance is only rarely used; most of the time, [[variance]] should be [[null]].)
 
 Examples:
 
     String
     out T"
shared class TypeArgument(type, variance = null)
        extends TypeIsh() {
    
    "The argument type."
    shared Type type;
    "The variance of the type, if any."
    shared Variance? variance;
    
    shared actual [Type]|[Variance, Type] children;
    if (exists variance) {
        children = [variance, type];
    } else {
        children = [type];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeArgument(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTypeArgument(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeArgument that) {
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
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (type.hash + 31 * (variance?.hash else 0));
    
    shared TypeArgument copy(Type type = this.type, Variance? variance = this.variance) {
        value ret = TypeArgument(type, variance);
        copyExtraInfoTo(ret);
        return ret;
    }
}
