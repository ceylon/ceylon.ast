"An unqualified identifier with an optional list of type arguments.
 
 A base expression can refer to either:
 * a toplevel function, value, or class,
 * a function, value, or class in the current scope, or
 * a function, value, or class in the current block.
 
 Examples:
 
     null
     max<Integer,Nothing>"
shared class BaseExpression(nameAndArgs)
        extends Primary() {
    
    "The name and, if any, arguments."
    shared NameWithTypeArguments nameAndArgs;
    
    shared actual [NameWithTypeArguments] children = [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is BaseExpression that) {
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * nameAndArgs.hash;
    
    shared BaseExpression copy(NameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = BaseExpression(nameAndArgs);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
