"A nonemptiness condition, that is,
 the keyword ‘`nonempty`’, followed by either
 a specified pattern or a member name referencing an existing value.
 
 Examples:
 
     nonempty employees
     nonempty persons = people.sequence()"
shared class NonemptyCondition(tested, negated = false)
        extends ExistsOrNonemptyCondition() {
    
    shared actual SpecifiedPattern|MemberName tested;
    "Whether the condition is negated or not.
     
     If the condition is negated, the ‘`nonempty`’ keyword
     is prefixed by a negation operator ‘`!`’."
    shared actual Boolean negated;
    
    shared actual [SpecifiedPattern|LIdentifier] children = [tested];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNonemptyCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is NonemptyCondition that) {
            return tested == that.tested && negated == that.negated;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (tested.hash + 31 * negated.hash);
    
    shared NonemptyCondition copy(SpecifiedPattern|MemberName tested = this.tested, Boolean negated = this.negated) {
        value ret = NonemptyCondition(tested, negated);
        copyExtraInfoTo(ret);
        return ret;
    }
}
