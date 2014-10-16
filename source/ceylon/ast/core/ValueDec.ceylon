"A value reference expression, that is,
 the [[name]] of a value, optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the member keyword `value` and surrounded by backticks.
 
 Examples:
 
     `value null`
     `value Iterable.first`"
shared class ValueDec(name, qualifier = null)
        extends MemberDec() {
    
    shared actual LIdentifier name;
    shared actual DecQualifier? qualifier;
    
    keyword = "value";
    
    shared actual <DecQualifier|LIdentifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueDec that) {
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
    
    shared ValueDec copy(LIdentifier name = this.name, DecQualifier? qualifier = this.qualifier) {
        value ret = ValueDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
