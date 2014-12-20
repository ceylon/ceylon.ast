"A `let` expression, that is,
 the keyword ‘`let`’, followed by a [[list of values|letValues]]
 and an [[expression]] that can involve these values.
 
 The expression is parsed with a precedence
 just below the [[`then`|ThenOperation]] and [[`else`|ElseOperation]] operations,
 to avoid ambiguity with these.
 Alternatively, it may be an [[`if`/`then`/`else` expression|IfElseExpression]]
 or a [[`let` expression|LetExpression]].
 
 Examples:
 
     let (dist = sqrt(x^2 + y^2)) [x / dist, y / dist]
     let (c = other.a, d = other.b) Complex(a*c - b*d, a*d + b*c)"
shared class LetExpression(letValues, expression)
        extends Expression() {
    
    "The values that the `let` expression introduces."
    shared LetValueList letValues;
    "The expression."
    shared DisjoiningExpression|IfElseExpression|LetExpression expression;
    
    shared actual [LetValueList, DisjoiningExpression|IfElseExpression|LetExpression] children = [letValues, expression];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLetExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is LetExpression that) {
            return letValues == that.letValues && expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (letValues.hash + 31 * expression.hash);
    
    shared LetExpression copy(LetValueList letValues = this.letValues, DisjoiningExpression|IfElseExpression|LetExpression expression = this.expression) {
        value ret = LetExpression(letValues, expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
