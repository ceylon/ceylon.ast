"A lazy expression specifier, that is, an expression prefixed by a computation operator ‘`=>`’.
 
 Examples:
 
     => text.uppercased
     => nothing"
shared class LazySpecifier(expression)
        extends AnySpecifier() {
    
    shared actual Expression expression;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLazySpecifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitLazySpecifier(this);

    shared actual Boolean equals(Object that) {
        if (is LazySpecifier that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared LazySpecifier copy(Expression expression = this.expression) {
        value ret = LazySpecifier(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
