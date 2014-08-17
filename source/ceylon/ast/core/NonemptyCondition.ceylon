"A nonemptiness condition, that is,
 the keyword ‘`nonempty`’, followed by either an (optionally typed) specified variable or an (untyped) member name.
 
 Examples:
 
     nonempty employees
     nonempty persons = people.sequence()"
shared class NonemptyCondition(variable)
        extends ExistsOrNonemptyCondition() {
    
    shared actual SpecifiedVariable|MemberName variable;
    
    shared actual [SpecifiedVariable|LIdentifier] children = [variable];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNonemptyCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is NonemptyCondition that) {
            return variable == that.variable;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * variable.hash;
    
    shared NonemptyCondition copy(SpecifiedVariable|MemberName variable = this.variable) {
        value ret = NonemptyCondition(variable);
        copyExtraInfoTo(ret);
        return ret;
    }
}
