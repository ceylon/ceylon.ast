"An expression specifier, that is, an expression prefixed by a specification operator ‘`=`’.
 
 Examples:
 
     = 1
     = nothing"
shared class Specifier(expression)
        extends AnySpecifier() {
    
    shared actual Expression expression;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpecifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpecifier(this);

    shared actual Boolean equals(Object that) {
        if (is Specifier that) {
            return expression == that.expression;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * expression.hash;
    
    shared Specifier copy(Expression expression = this.expression) {
        value ret = Specifier(expression);
        copyExtraInfoTo(ret);
        return ret;
    }
}
