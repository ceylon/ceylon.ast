"A nullsafe member operator, ‘`?.`’.
 
 Technically, the nullsafe attribute operator and the
 nullsafe method operator are two different operators,
 since a nullsafe invocation is not the same as an invocation
 of a nullsafely accessed method attribute;
 however, that distinction is only semantical, not syntactical,
 and therefore does not belong in the AST."
shared class SafeMemberOperator()
        extends AnyMemberOperator() {
    
    text = "?.";
    
    shared actual [] children = [];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSafeMemberOperator(this);
    
    shared actual Boolean equals(Object that) {
        return that is SafeMemberOperator;
    }
    
    shared actual Integer hash
            => text.hash;
    
    shared SafeMemberOperator copy() {
        value ret = SafeMemberOperator();
        copyExtraInfoTo(ret);
        return ret;
    }
}
