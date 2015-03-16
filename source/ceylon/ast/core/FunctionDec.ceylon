"A function reference expression, that is,
 the [[name]] of a function or method, qualified by a (possibly empty) [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the member keyword `function` and surrounded by backticks.
 
 Examples:
 
     `function concatenate`
     `function Iterable.chain`"
shared class FunctionDec(name, qualifier = DecQualifier())
        extends MemberDec() {
    
    shared actual LIdentifier name;
    shared actual DecQualifier qualifier;
    
    keyword = "function";
    
    shared actual <DecQualifier|LIdentifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is FunctionDec that) {
            return name == that.name && qualifier == that.qualifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * qualifier.hash);
    
    shared FunctionDec copy(LIdentifier name = this.name, DecQualifier qualifier = this.qualifier) {
        value ret = FunctionDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
