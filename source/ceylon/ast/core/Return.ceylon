"A `return` directive, with an optional returned expression."
shared class Return(result = null)
        extends Directive() {
    
    "The returned expression, if any."
    shared actual Expression? result;
    
    text = "return";
    
    shared actual [Expression=] children = emptyOrSingleton(result);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformReturn(this);
    
    shared actual Boolean equals(Object that) {
        if (is Return that) {
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
    
    shared Return copy(Expression? result = this.result) {
        value ret = Return(result);
        copyExtraInfoTo(ret);
        return ret;
    }
}
