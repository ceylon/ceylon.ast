"""A [[receiver expression|receiverExpression]],
   followed by a [[member operator|memberOperator]] (usually ‘`.`’)
   and an (unqualified) [[identifier with optional type arguments|nameAndArgs]].
   
   Examples:
   
       ", ".join
       process.arguments.first
       people*.name
       sort(people, byAscending(Person.salary)).first?.salary"""
shared class QualifiedExpression(receiverExpression, nameAndArgs, memberOperator = MemberOperator())
        extends Primary() {
    
    "The receiver expression."
    shared Primary receiverExpression;
    "The name and, if any, type arguments."
    shared NameWithTypeArguments nameAndArgs;
    "The member operator; by default, a normal
     [[MemberOperator]], but a [[SafeMemberOperator]]
     or a [[SpreadMemberOperator]] may also be used."
    shared AnyMemberOperator memberOperator;
    
    shared actual [Primary, AnyMemberOperator, NameWithTypeArguments] children = [receiverExpression, memberOperator, nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformQualifiedExpression(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitQualifiedExpression(this);

    shared actual Boolean equals(Object that) {
        if (is QualifiedExpression that) {
            return receiverExpression == that.receiverExpression && nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (receiverExpression.hash + 31 * nameAndArgs.hash);
    
    shared QualifiedExpression copy(Primary receiverExpression = this.receiverExpression, NameWithTypeArguments nameAndArgs = this.nameAndArgs, AnyMemberOperator memberOperator = this.memberOperator) {
        value ret = QualifiedExpression(receiverExpression, nameAndArgs, memberOperator);
        copyExtraInfoTo(ret);
        return ret;
    }
}
