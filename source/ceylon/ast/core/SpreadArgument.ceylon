"A spread argument.
 
 Used in [[argument lists|ArgumentList]] to “spread” a sequential value
 over multiple arguments.
 
 (The spread “operator” `*` looks like a prefix [[unary operator|UnaryOperation]],
 but because it produces multiple values, not just one, a spread argument is not an expression.)
 
 Examples:
 
     *args
     *values.collect(Object.string)
     *[]"
shared class SpreadArgument(argument)
        extends ExpressionIsh() {
    
    "The expression being spread.
     
     (Note that even though the spread operator is no true operator,
     it has the same precedence as the [[product operator|ProductOperation]],
     whose symbol it shares.)"
    shared UnioningExpression argument;
    
    shared actual [UnioningExpression] children = [argument];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpreadArgument(this);
    
    shared actual Boolean equals(Object that) {
        if (is SpreadArgument that) {
            return argument == that.argument;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * argument.hash;
    
    shared SpreadArgument copy(UnioningExpression argument = this.argument) {
        value ret = SpreadArgument(argument);
        copyExtraInfoTo(ret);
        return ret;
    }
}
