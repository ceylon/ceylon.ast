"A `let` expression, that is,
 the keyword ‘`let`’, followed by a [[list of patterns|patterns]]
 and an [[expression]] that can involve these patterns’ variables.
 
 The expression is parsed with a precedence
 just below the [[`then`|ThenOperation]] and [[`else`|ElseOperation]] operations,
 to avoid ambiguity with these.
 Alternatively, it may be an [[`if`/`then`/`else` expression|IfElseExpression]]
 or a [[`let` expression|LetExpression]].
 
 Examples:
 
     let ([x,y] = loc, dist = sqrt(x^2 + y^2)) [x / dist, y / dist]
     let (c = other.a, d = other.b) Complex(a*c - b*d, a*d + b*c)"
shared class LetExpression(patterns, expression)
        extends Expression() {
    
    "The patterns that the `let` expression introduces."
    shared PatternList patterns;
    "The expression."
    shared DisjoiningExpression|IfElseExpression|LetExpression expression;
    
    shared actual [PatternList, DisjoiningExpression|IfElseExpression|LetExpression] children = [patterns, expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLetExpression(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitLetExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is LetExpression that) {
            return patterns==that.patterns && expression==that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (patterns.hash + 31*expression.hash);
    
    shared LetExpression copy(PatternList patterns = this.patterns, DisjoiningExpression|IfElseExpression|LetExpression expression = this.expression) {
        value ret = LetExpression(patterns, expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
