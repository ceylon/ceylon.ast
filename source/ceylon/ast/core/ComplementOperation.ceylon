"A set complement expression.
 
 Defined via [[Set.complement]]. Left-associative.
 
 Examples:
 
     receivers~blocked
     primes ~ HashSet { 2 }"
shared class ComplementOperation(leftOperand_, rightOperand_)
        extends SetOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728; remove!
    Precedence5Expression leftOperand_;
    Precedence4Expression rightOperand_;
    
    "The “this” set, from which elements for the result set are taken."
    shared actual Precedence5Expression leftOperand = leftOperand_;
    "The “other” set, the elements of which are not present in the result set."
    shared actual Precedence4Expression rightOperand = rightOperand_;
    
    shared actual [Precedence5Expression, Precedence4Expression] children = [leftOperand, rightOperand];
    
    operator = "~";
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformComplementOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ComplementOperation that) {
            return leftOperand == that.leftOperand && rightOperand == that.rightOperand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (leftOperand.hash + 31 * rightOperand.hash);
    
    shared ComplementOperation copy(Precedence5Expression leftOperand = this.leftOperand, Precedence4Expression rightOperand = this.rightOperand) {
        value ret = ComplementOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
