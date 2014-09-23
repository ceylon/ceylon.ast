"An operator-style member expression, that is,
 a receiver expression, followed by an identifier with optional type arguments,
 *not* separated by a member operator (‘`.`’).
 
 Examples:
 
     name uppercased
     header length"
shared class OperatorStyleMemberExpression(receiverExpression, nameAndArgs)
        extends OperatorStyleExpression() {
    
    "The receiver expression.
     
     (Unlike [[QualifiedExpression.receiverExpression]], this may be almost any expression.)"
    shared Precedence16Expression receiverExpression;
    "The member name and, if present, type arguments."
    shared MemberNameWithTypeArguments nameAndArgs;
    
    shared actual [Precedence16Expression, MemberNameWithTypeArguments] children = [receiverExpression, nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformOperatorStyleMemberExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is OperatorStyleMemberExpression that) {
            return receiverExpression == that.receiverExpression && nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (receiverExpression.hash + 31 * nameAndArgs.hash);
    
    shared OperatorStyleMemberExpression copy(Precedence16Expression receiverExpression = this.receiverExpression, MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = OperatorStyleMemberExpression(receiverExpression, nameAndArgs);
        copyExtraInfoTo(ret);
        return ret;
    }
}
