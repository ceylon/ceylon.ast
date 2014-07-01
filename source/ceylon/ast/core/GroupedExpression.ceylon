"A grouped, or parenthesized expression.
 
 Examples:
 
     (1 + 2) * 3
     \"Hello, \" + (process.arguments.first else \"World\")"
shared class GroupedExpression(innerExpression)
        extends Atom() {
    
    // TODO document!
    shared Expression innerExpression;
    
    shared actual [Expression] children = [innerExpression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformGroupedExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is GroupedExpression that) {
            return innerExpression == that.innerExpression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * innerExpression.hash;
    
    shared GroupedExpression copy(Expression innerExpression = this.innerExpression) {
        value ret = GroupedExpression(innerExpression);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
