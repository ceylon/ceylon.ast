"""A receiver expression, followed by a member operator ('.')
   and an (unqualified) identifier with optional type arguments.
   
   Examples:
   
       ", ".join
       process.arguments.first"""
shared class QualifiedExpression(receiverExpression, nameAndArgs)
        extends Primary() {
    
    "The receiver expression."
    shared Primary receiverExpression;
    "The name and, if any, type arguments."
    shared NameWithTypeArguments nameAndArgs;
    
    shared actual [Primary, NameWithTypeArguments] children = [receiverExpression, nameAndArgs];
    
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
    
    shared QualifiedExpression copy(Primary receiverExpression = this.receiverExpression, NameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = QualifiedExpression(receiverExpression, nameAndArgs);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
