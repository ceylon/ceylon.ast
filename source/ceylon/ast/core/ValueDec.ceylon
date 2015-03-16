"A value reference expression, that is,
 the [[name]] of a value, qualified by a (possibly empty) [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the member keyword `value` and surrounded by backticks.
 
 Examples:
 
     `value null`
     `value Iterable.first`"
shared class ValueDec(name, qualifier = DecQualifier())
        extends MemberDec() {
    
    shared actual LIdentifier name;
    shared actual DecQualifier qualifier;
    
    keyword = "value";
    
    shared actual <DecQualifier|LIdentifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueDec that) {
            return name == that.name && that.qualifier == qualifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * qualifier.hash);
    
    shared ValueDec copy(LIdentifier name = this.name, DecQualifier qualifier = this.qualifier) {
        value ret = ValueDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
