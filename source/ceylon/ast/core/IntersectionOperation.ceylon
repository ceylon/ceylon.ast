"A set intersection expression.
 
 Defined via [[Set.intersection]]. Left-associative.
 
 Examples:
 
     persistents&printables&identifiables
     x1&y1"
shared class IntersectionOperation(leftOperand_, rightOperand_)
        extends SetOperation() {
    
    // TODO these are workarounds for ceylon-compiler#1728; remove!
    Precedence4Expression leftOperand_;
    Precedence3Expression rightOperand_;
    
    "The left intersected set."
    shared actual Precedence4Expression leftOperand = leftOperand_;
    "The right intersected set."
    shared actual Precedence3Expression rightOperand = rightOperand_;
    
    shared actual [Precedence4Expression, Precedence3Expression] children = [leftOperand, rightOperand];
    
    operator = "&";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIntersectionOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is IntersectionOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared IntersectionOperation copy(Precedence4Expression leftOperand = this.leftOperand, Precedence3Expression rightOperand = this.rightOperand) {
        value ret = IntersectionOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
