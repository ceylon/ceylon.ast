"A tuple pattern, that is,
 several [[patterns|elementPatterns]],
 including optionally a trailing [[variadic|variadicElementPattern]] one,
 separated by commas and enclosed in brackets.
 
 Examples:
 
     [x, y, z]
     [first, *rest]"
see (`class Tuple`)
shared class TuplePattern(elementPatterns, variadicElementPattern = null)
        extends Pattern() {
    
    "The element patterns.
     
     (Does not include the [[variadic pattern|variadicElementPattern]]
     if it’s present.)"
    shared [Pattern+] elementPatterns;
    "The trailing variadic element pattern, if present."
    shared VariadicVariable? variadicElementPattern;
    
    shared actual <Pattern|VariadicVariable>[] children
            = concatenate(elementPatterns, emptyOrSingleton(variadicElementPattern));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTuplePattern(this);
    
    shared actual Boolean equals(Object that) {
        if (is TuplePattern that) {
            if (exists variadicElementPattern) {
                if (exists variadicElementPattern_ = that.variadicElementPattern) {
                    return variadicElementPattern == variadicElementPattern_ && elementPatterns == that.elementPatterns;
                } else {
                    return false;
                }
            } else {
                if (!(that.variadicElementPattern exists)) {
                    return elementPatterns == that.elementPatterns;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (elementPatterns.hash + 31 * (variadicElementPattern?.hash else 0));
    
    shared TuplePattern copy([Pattern+] elementPatterns = this.elementPatterns, VariadicVariable? variadicElementPattern = this.variadicElementPattern) {
        value ret = TuplePattern(elementPatterns, variadicElementPattern);
        copyExtraInfoTo(ret);
        return ret;
    }
}
