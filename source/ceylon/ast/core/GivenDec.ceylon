"""A type parameter reference expression, that is,
   the name of a type parameter, prefixed by the type keyword `given` and surrounded by backticks.
   
   Note that the type parameter may not be qualified (i. e., `` `given Entry.Key` `` is not allowed),
   because a type parameter is not considered visible outside the declaration with the type parameter.
   For more information, see [ceylon/ceylon-spec#1002](https://github.com/ceylon/ceylon-spec/issues/1002)."""
shared class GivenDec(name)
        extends TypeDec() {
    
    shared actual TypeName name;
    
    "A type parameter may not be qualified."
    shared actual Null qualifier = null; // TODO is this really a syntactical restriction? feels semantical, i. e. we should allow it
    
    keyword = "given";
    
    shared actual [TypeName] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformGivenDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is GivenDec that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared GivenDec copy(TypeName name = this.name) {
        value ret = GivenDec(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
