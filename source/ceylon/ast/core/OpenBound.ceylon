"An open lower or upper bound of a [[bounded comparison operation|WithinOperation]].
 
 In an open bound, the [[endpoint]] is not a part of the designated interval;
 therefore, when dealing with real numbers, the interval has no minimum / maximum value,
 as you can get infinitely close to the endpoint without reaching it.
 
 For example, in the interval `0 < x < 1`, the values 0.9, 0.99, 0.999, etc. for `x`
 are all within the interval."
shared class OpenBound(endpoint)
        extends Bound() {
    
    shared actual Precedence10Expression endpoint;
    
    shared actual [Precedence10Expression] children = [endpoint];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOpenBound(this);
    
    shared actual Boolean equals(Object that) {
        if (is OpenBound that) {
            return endpoint == that.endpoint;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * endpoint.hash;
    
    shared OpenBound copy(Precedence10Expression endpoint = this.endpoint) {
        value ret = OpenBound(endpoint);
        copyExtraInfoTo(ret);
        return ret;
    }
}
