"A scale expression.
 
 Defined via [[Scalable.scale]]. Right-associative.
 
 Examples:
 
     2 ** vector
     brakeFactor ** velocity
 
 The scale operation is special because the receiver of the method invocation by which it is defined
 is the [[right-hand side|rightOperand]], not the [[left-hand side|leftOperand]]. In other words,
 `lhs ** rhs` corresponds to
 
     rhs.scale(lhs)
 
 while e. g. `lhs * rhs` corresponds to
 
     lhs.times(rhs)
 
 (the qualifier and argument swapped places)."
shared class ScaleOperation(factor, scalable)
        extends BinaryOperation() {
    
    "The factor by which the [[scalable]] is scaled"
    shared Precedence6Expression factor;
    "The [[Scalable]] being scaled"
    shared Precedence7Expression scalable;
    
    "The factor by which the [[scalable]] is scaled"
    see (`value factor`)
    shared actual Precedence6Expression leftOperand = factor;
    "The [[Scalable]] being scaled"
    see (`value scalable`)
    shared actual Precedence7Expression rightOperand = scalable;
    
    shared actual [Precedence6Expression, Precedence7Expression] children = [leftOperand, rightOperand];
    
    operator = "**";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformScaleOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ScaleOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ScaleOperation copy(Precedence6Expression leftOperand = this.leftOperand, Precedence7Expression rightOperand = this.rightOperand) {
        value ret = ScaleOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
