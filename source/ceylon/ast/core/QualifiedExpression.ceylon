"""A [[receiver expression|receiverExpression]],
   followed by a [[member operator|memberOperator]] (usually ‘`.`’)
   and an (unqualified) [[identifier with optional type arguments|nameAndArgs]].
   
   (To create a `QualifiedExpression`, consider using the [[qualifiedExpression]]
   utility function in order to make your code more readable.)
   
   Examples:
   
       ", ".join
       process.arguments.first
       people*.name
       sort(people, byAscending(Person.salary)).first?.salary"""
see (`function qualifiedExpression`)
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

"""A utility function to create a [[QualifiedExpression]] directly from a string,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   (The type arguments will all be invariant; if you want to use use-site variance,
   you have to construct the [[TypeArgument]] objects yourself.)
   
   Usage examples:
   
       qualifiedExpression("x", "Y") // x.Y
       qualifiedExpression(qualifiedExpression(baseExpression("process"), "arguments"), "first") // process.arguments.first"""
shared QualifiedExpression qualifiedExpression(String|Primary receiverExpression, String name, String|Type* typeArguments) {
    Type toType(String|Type typeArgument) {
        switch (typeArgument)
        case (is String) { return baseType(typeArgument); }
        case (is Type) { return typeArgument; }
    }
    Primary toPrimary(String|Primary receiverExpression) {
        switch (receiverExpression)
        case (is String) { return baseExpression(receiverExpression); }
        case (is Primary) { return receiverExpression; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    NameWithTypeArguments na;
    if (name.first?.uppercase else false) {
        na = TypeNameWithTypeArguments(uidentifier(name), args);
    } else {
        na = MemberNameWithTypeArguments(lidentifier(name), args);
    }
    return QualifiedExpression(toPrimary(receiverExpression), na);
}
