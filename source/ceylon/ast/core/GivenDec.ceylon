"""A type parameter reference expression, that is,
   the name of a type parameter, prefixed by the type keyword “given” and surrounded by backticks.
   
   Note that the type parameter may not be qualified (i. e., `` `given Entry.Key` `` is not allowed),
   because a type parameter is not considered visible outside the declaration with the type parameter.
   For more information, see [ceylon/ceylon-spec#1002](https://github.com/ceylon/ceylon-spec/issues/1002)."""
shared class GivenDec(typeParameter)
        extends TypeDec() {
    
    "The name of the referenced type parameter."
    shared TypeName typeParameter;
    
    keyword = "given";
    
    shared actual [TypeName] children = [typeParameter];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformGivenDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is GivenDec that) {
            return typeParameter == that.typeParameter;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * typeParameter.hash;
    
    shared GivenDec copy(TypeName typeParameter = this.typeParameter) {
        value ret = GivenDec(typeParameter);
        copyExtraInfoTo(ret);
        return ret;
    }
}
