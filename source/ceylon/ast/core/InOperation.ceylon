"A containment test expression.
 
 Defined via [[Category.contains]].
 
 Examples:
 
     digit in (0..9).by(2)
     user in authorizedUsers
     input in { \"yes\", \"no\" }
 
 The containment operation is special because the receiver of the method invocation by which it is defined
 is the [[right-hand side|rightOperand]], not the [[left-hand side|leftOperand]]. In other words,
 `lhs in rhs` corresponds to
 
     rhs.contains(lhs)
 
 while e. g. `lhs * rhs` corresponds to
 
     lhs.times(rhs)
 
 (the qualifier and argument swapped places)."
shared class InOperation(element, category)
        extends BinaryOperation() {
    
    "The element that’s tested for being in [[category]]."
    shared ExistsNonemptyExpression element;
    "The [[Category]] that is tested for containing [[element]]."
    shared ExistsNonemptyExpression category;
    
    "The element that’s tested for being in [[category]]."
    see (`value element`)
    shared actual ExistsNonemptyExpression leftOperand = element;
    "The [[Category]] that is tested for containing [[element]]."
    see (`value category`)
    shared actual ExistsNonemptyExpression rightOperand = category;
    
    shared actual [ExistsNonemptyExpression, ExistsNonemptyExpression] children = [leftOperand, rightOperand];
    
    operator = "in";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitInOperation(this);

    shared actual Boolean equals(Object that) {
        if (is InOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared InOperation copy(ExistsNonemptyExpression leftOperand = this.leftOperand, ExistsNonemptyExpression rightOperand = this.rightOperand) {
        value ret = InOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
