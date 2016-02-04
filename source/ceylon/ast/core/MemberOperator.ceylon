"A regular member operator, ‘`.`’."
shared class MemberOperator()
        extends AnyMemberOperator() {
    
    text = ".";
    
    shared actual [] children = [];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMemberOperator(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitMemberOperator(this);

    shared actual Boolean equals(Object that) {
        return that is MemberOperator;
    }
    
    shared actual Integer hash
            => text.hash;
    
    shared MemberOperator copy() {
        value ret = MemberOperator();
        copyExtraInfoTo(ret);
        return ret;
    }
}
