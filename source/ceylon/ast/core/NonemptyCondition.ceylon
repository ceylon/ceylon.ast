"A nonemptiness condition, that is,
 the keyword ‘`nonempty`’, followed by either
 a specified pattern or a member name referencing an existing value.
 
 Examples:
 
     nonempty employees
     nonempty persons = people.sequence()"
shared class NonemptyCondition(tested)
        extends ExistsOrNonemptyCondition() {
    
    shared actual SpecifiedPattern|MemberName tested;
    
    shared actual [SpecifiedPattern|LIdentifier] children = [tested];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNonemptyCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is NonemptyCondition that) {
            return tested == that.tested;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * tested.hash;
    
    shared NonemptyCondition copy(SpecifiedPattern|MemberName tested = this.tested) {
        value ret = NonemptyCondition(tested);
        copyExtraInfoTo(ret);
        return ret;
    }
}
