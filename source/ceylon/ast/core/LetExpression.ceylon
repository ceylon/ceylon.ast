"A `let` expression, that is,
 the keyword ‘`let`’, followed by a [[list of patterns|patterns]]
 and an [[expression]] that can involve these patterns’ variables.
 
 Examples:
 
     let ([x,y] = loc, dist = sqrt(x^2 + y^2)) [x / dist, y / dist]
     let (c = other.a, d = other.b) Complex(a*c - b*d, a*d + b*c)"
shared class LetExpression(patterns, expression)
        extends Expression() {
    
    "The patterns that the `let` expression introduces."
    shared PatternList patterns;
    "The expression."
    shared Expression expression;
    
    shared actual [PatternList, Expression] children = [patterns, expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLetExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is LetExpression that) {
            return patterns == that.patterns && expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (patterns.hash + 31 * expression.hash);
    
    shared LetExpression copy(PatternList patterns = this.patterns, Expression expression = this.expression) {
        value ret = LetExpression(patterns, expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
