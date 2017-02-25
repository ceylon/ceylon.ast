"A tuple pattern, that is,
 several [[patterns|elementPatterns]],
 including optionally a trailing [[variadic|variadicElementPattern]] one,
 separated by commas and enclosed in brackets.
 
 (There must be at least one total pattern, i. e.,
 the [[element patterns|elementPatterns]] may only be empty
 if the [[variadic element pattern|variadicElementPattern]] is present.)
 
 Examples:
 
     [x, y, z]
     [first, *rest]"
see (`class Tuple`)
shared class TuplePattern(elementPatterns, variadicElementPattern = null)
        extends Pattern() {
    
    "The element patterns.
     
     (Does not include the [[variadic pattern|variadicElementPattern]]
     if it’s present.)"
    shared [Pattern*] elementPatterns;
    "The trailing variadic element pattern, if present."
    shared VariadicVariable? variadicElementPattern;
    
    "Must have at least one pattern"
    assert (elementPatterns nonempty || variadicElementPattern exists);
    
    shared actual <Pattern|VariadicVariable>[] children
            = concatenate(elementPatterns, emptyOrSingleton(variadicElementPattern));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTuplePattern(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTuplePattern(this);
    
    shared actual Boolean equals(Object that) {
        if (is TuplePattern that) {
            if (exists variadicElementPattern) {
                if (exists variadicElementPattern_ = that.variadicElementPattern) {
                    if (variadicElementPattern != variadicElementPattern_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.variadicElementPattern exists) {
                return false;
            }
            return elementPatterns == that.elementPatterns;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (elementPatterns.hash + 31 * (variadicElementPattern?.hash else 0));
    
    shared TuplePattern copy([Pattern*] elementPatterns = this.elementPatterns, VariadicVariable? variadicElementPattern = this.variadicElementPattern) {
        value ret = TuplePattern(elementPatterns, variadicElementPattern);
        copyExtraInfoTo(ret);
        return ret;
    }
}
