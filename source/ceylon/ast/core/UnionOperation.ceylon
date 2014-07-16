"A set union expression.
 
 Defined via [[Set.union]]. Left-associative.
 
 Examples:
 
     ints|floats
     x1&y1|x2&y2"
shared class UnionOperation(leftOperand_, rightOperand_)
        extends SetOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728; remove!
    Precedence5Expression leftOperand_;
    Precedence4Expression rightOperand_;
    
    "The left unioned set."
    shared actual Precedence5Expression leftOperand = leftOperand_;
    "The right unioned set."
    shared actual Precedence4Expression rightOperand = rightOperand_;
    
    shared actual [Precedence5Expression, Precedence4Expression] children = [leftOperand, rightOperand];
    
    operator = "|";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformUnionOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is UnionOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared UnionOperation copy(Precedence5Expression leftOperand = this.leftOperand, Precedence4Expression rightOperand = this.rightOperand) {
        value ret = UnionOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
