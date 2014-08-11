"A `throw` directive, with an optional thrown exception."
shared class Throw(result = null)
        extends Directive() {
    
    "The raised exception, if any."
    shared actual Expression? result;
    
    text = "throw";
    
    shared actual [Expression=] children = emptyOrSingleton(result);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformThrow(this);
    
    shared actual Boolean equals(Object that) {
        if (is Throw that) {
            if (exists result) {
                if (exists result_ = that.result) {
                    return result == result_ && true;
                } else {
                    return false;
                }
            } else {
                if (!(that.result exists)) {
                    return true;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (result?.hash else 0);
    
    shared Throw copy(Expression? result = this.result) {
        value ret = Throw(result);
        copyExtraInfoTo(ret);
        return ret;
    }
}
