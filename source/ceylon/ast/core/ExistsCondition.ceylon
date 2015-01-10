"An existence condition, that is,
 the keyword ‘`exists`’, followed by either
 a specified pattern or a member name referencing an existing value.
 
 Examples:
 
     exists name
     exists firstItem = first?.item"
shared class ExistsCondition(tested)
        extends ExistsOrNonemptyCondition() {
    
    shared actual SpecifiedPattern|MemberName tested;
    
    shared actual [SpecifiedPattern|LIdentifier] children = [tested];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsCondition that) {
            return tested == that.tested;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * tested.hash;
    
    shared ExistsCondition copy(SpecifiedPattern|MemberName tested = this.tested) {
        value ret = ExistsCondition(tested);
        copyExtraInfoTo(ret);
        return ret;
    }
}
