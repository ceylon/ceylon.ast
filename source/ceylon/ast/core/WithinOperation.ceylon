"A bounded comparison operation,
 also known as “within” operation.
 
 Examples:
 
     0 <= x < 10
     1 <= x <= 31"
shared class WithinOperation(operand, lowerBound, upperBound)
        extends Operation() {
    
    "The expression being tested against the [[lower|lowerBound]]
     and [[upper bound|upperBound]]."
    shared Precedence10Expression operand;
    "The lower bound against which the [[operand]] is tested."
    shared Bound lowerBound;
    "The upper bound against which the [[operand]] is tested."
    shared Bound upperBound;
    
    shared actual [Bound, Bound] children = [lowerBound, upperBound];
    
    shared actual Nothing operator {
        throw AssertionError("The “within” operation doesn’t have one operator!");
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformWithinOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is WithinOperation that) {
            return lowerBound == that.lowerBound && upperBound == that.upperBound;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (lowerBound.hash + 31 * upperBound.hash);
    
    shared WithinOperation copy(Precedence10Expression operand = this.operand, Bound lowerBound = this.lowerBound, Bound upperBound = this.upperBound) {
        value ret = WithinOperation(operand, lowerBound, upperBound);
        copyExtraInfoTo(ret);
        return ret;
    }
}
