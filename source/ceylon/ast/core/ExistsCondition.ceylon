"An existence condition, that is,
 the keyword ‘`exists`’, followed by either an (optionally typed) specified variable or an (untyped) member name.
 
 Examples:
 
     exists name
     exists firstItem = first?.item"
shared class ExistsCondition(variable)
        extends ExistsOrNonemptyCondition() {
    
    shared actual SpecifiedVariable|MemberName variable;
    
    shared actual [SpecifiedVariable|LIdentifier] children = [variable];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsCondition that) {
            return variable == that.variable;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * variable.hash;
    
    shared ExistsCondition copy(SpecifiedVariable|MemberName variable = this.variable) {
        value ret = ExistsCondition(variable);
        copyExtraInfoTo(ret);
        return ret;
    }
}
