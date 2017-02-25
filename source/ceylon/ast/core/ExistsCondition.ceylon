"An existence condition, that is,
 the keyword ‘`exists`’, followed by either
 a specified pattern or a member name referencing an existing value.
 
 Examples:
 
     exists name
     exists firstItem = first?.item"
shared class ExistsCondition(tested, negated = false)
        extends ExistsOrNonemptyCondition() {
    
    shared actual SpecifiedPattern|MemberName tested;
    "Whether the condition is negated or not.
     
     If the condition is negated, the ‘`exists`’ keyword
     is prefixed by a negation operator ‘`!`’."
    shared actual Boolean negated;
    
    shared actual [SpecifiedPattern|LIdentifier] children = [tested];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsCondition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitExistsCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsCondition that) {
            return tested==that.tested && negated==that.negated;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (tested.hash + 31*negated.hash);
    
    shared ExistsCondition copy(SpecifiedPattern|MemberName tested = this.tested, Boolean negated = this.negated) {
        value ret = ExistsCondition(tested, negated);
        copyExtraInfoTo(ret);
        return ret;
    }
}
