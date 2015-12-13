"A set union expression.
 
 Defined via [[Set.union]]. Left-associative.
 
 Examples:
 
     ints|floats
     x1&y1|x2&y2"
see (`class UnionAssignmentOperation`)
shared class UnionOperation(leftOperand, rightOperand)
        extends SetOperation() {
    
    "The left unioned set."
    shared actual UnioningExpression leftOperand;
    "The right unioned set."
    shared actual IntersectingExpression rightOperand;
    
    shared actual [UnioningExpression, IntersectingExpression] children = [leftOperand, rightOperand];
    
    operator = "|";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUnionOperation(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitUnionOperation(this);

    shared actual Boolean equals(Object that) {
        if (is UnionOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared UnionOperation copy(UnioningExpression leftOperand = this.leftOperand, IntersectingExpression rightOperand = this.rightOperand) {
        value ret = UnionOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
