"A spread member operator, ‘`*.`’.
 
 Technically, the spread attribute operator and the
 spread method operator are two different operators,
 since a spread invocation is not the same as an invocation
 of a spread accessed method attribute;
 however, that distinction is only semantical, not syntactical,
 and therefore does not belong in the AST."
shared class SpreadMemberOperator()
        extends AnyMemberOperator() {
    
    text = "*.";
    
    shared actual [] children = [];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpreadMemberOperator(this);
    
    shared actual Boolean equals(Object that) {
        return that is SpreadMemberOperator;
    }
    
    shared actual Integer hash
            => text.hash;
    
    shared SpreadMemberOperator copy() {
        value ret = SpreadMemberOperator();
        copyExtraInfoTo(ret);
        return ret;
    }
}
