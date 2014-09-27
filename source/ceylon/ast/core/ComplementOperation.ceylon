"A set complement expression.
 
 Defined via [[Set.complement]]. Left-associative.
 
 Examples:
 
     receivers~blocked
     primes ~ HashSet { 2 }"
see (`class ComplementAssignmentOperation`)
shared class ComplementOperation(leftOperand_, rightOperand_)
        extends SetOperation() {
    
    // TODO leftOperand_, rightOperand_ are a workaround for ceylon-compiler#1728; remove!
    UnioningExpression leftOperand_;
    IntersectingExpression rightOperand_;
    
    "The “this” set, from which elements for the result set are taken."
    shared actual UnioningExpression leftOperand = leftOperand_;
    "The “other” set, the elements of which are not present in the result set."
    shared actual IntersectingExpression rightOperand = rightOperand_;
    
    shared actual [UnioningExpression, IntersectingExpression] children = [leftOperand, rightOperand];
    
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
    
    shared ComplementOperation copy(UnioningExpression leftOperand = this.leftOperand, IntersectingExpression rightOperand = this.rightOperand) {
        value ret = ComplementOperation(leftOperand, rightOperand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
