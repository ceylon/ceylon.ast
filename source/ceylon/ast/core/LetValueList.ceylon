"A list of `let` values, enclosed in parentheses.
 
 Examples:
 
     (dist = sqrt(x^2 + y^2))
     (c = other.a, d = other.b)"
shared class LetValueList(letValues)
        extends Node() {
    
    "The individual values."
    shared [SpecifiedVariable+] letValues;
    
    shared actual [SpecifiedVariable+] children = letValues;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLetValueList(this);
    
    shared actual Boolean equals(Object that) {
        if (is LetValueList that) {
            return letValues == that.letValues;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * letValues.hash;
    
    shared LetValueList copy([SpecifiedVariable+] letValues = this.letValues) {
        value ret = LetValueList(letValues);
        copyExtraInfoTo(ret);
        return ret;
    }
}
