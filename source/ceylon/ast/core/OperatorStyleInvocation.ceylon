"An operator-style method invocation, that is,
 a receiver expression, followed by a method name with optional type arguments and then a single argument.
 
 Examples:
 
     val and #3FFF
     text map Character.uppercased
     0..max by step
     set subset otherSet
     text filter (c) => c.integer < 128"
shared class OperatorStyleInvocation(receiverExpression, nameAndArgs, argument)
        extends OperatorStyleExpression() {
    
    "The receiver expression."
    shared ThenElseExpression receiverExpression;
    "The name of the invoked method, optionally with type arguments."
    shared MemberNameWithTypeArguments nameAndArgs;
    "The single argument to the invoked method."
    shared Expression argument;
    
    shared actual [ThenElseExpression, MemberNameWithTypeArguments, Expression] children = [receiverExpression, nameAndArgs, argument];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOperatorStyleInvocation(this);
    
    shared actual Boolean equals(Object that) {
        if (is OperatorStyleInvocation that) {
            return receiverExpression == that.receiverExpression && nameAndArgs == that.nameAndArgs && argument == that.argument;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (receiverExpression.hash + 31 * (nameAndArgs.hash + 31 * argument.hash));
    
    shared OperatorStyleInvocation copy(ThenElseExpression receiverExpression = this.receiverExpression, MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs, Expression argument = this.argument) {
        value ret = OperatorStyleInvocation(receiverExpression, nameAndArgs, argument);
        copyExtraInfoTo(ret);
        return ret;
    }
}
