"A function reference expression, that is,
 the [[name]] of a function or method, optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the member keyword `function` and surrounded by backticks.
 
 Examples:
 
     `function concatenate`
     `function Iterable.chain`"
shared class FunctionDec(name, qualifier = null)
        extends MemberDec() {
    
    shared actual LIdentifier name;
    shared actual DecQualifier? qualifier;
    
    keyword = "function";
    
    shared actual <DecQualifier|LIdentifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is FunctionDec that) {
            if (exists qualifier) {
                if (exists qualifier_ = that.qualifier) {
                    return qualifier == qualifier_ && name == that.name;
                } else {
                    return false;
                }
            } else {
                if (!(that.qualifier exists)) {
                    return name == that.name;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (qualifier?.hash else 0));
    
    shared FunctionDec copy(LIdentifier name = this.name, DecQualifier? qualifier = this.qualifier) {
        value ret = FunctionDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
