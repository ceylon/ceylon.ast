"A set intersection expression.
 
 Defined via [[Set.intersection]]. Left-associative.
 
 Examples:
 
     persistents&printables&identifiables
     x1&y1"
see (`class IntersectAssignmentOperation`)
shared class IntersectionOperation(leftOperand, rightOperand)
        extends SetOperation() {
    
    "The left intersected set."
    shared actual IntersectingExpression leftOperand;
    "The right intersected set."
    shared actual InvertingExpression rightOperand;
    
    shared actual [IntersectingExpression, InvertingExpression] children = [leftOperand, rightOperand];
    
    operator = "&";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIntersectionOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIntersectionOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IntersectionOperation that) {
            return leftOperand==that.leftOperand && rightOperand==that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31*rightOperand.hash);
    
    shared IntersectionOperation copy(IntersectingExpression leftOperand = this.leftOperand, InvertingExpression rightOperand = this.rightOperand) {
        value ret = IntersectionOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
