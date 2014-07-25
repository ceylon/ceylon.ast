"A lower or upper bound of a [[bounded comparison operation|WithinOperation]]."
shared abstract class Bound()
        of OpenBound | ClosedBound
        extends ExpressionIsh() {
    
    "The endpoint of the bound, against which
     the [[operand|WithinOperation.operand]] is compared."
    shared formal Precedence10Expression endpoint;
    
    shared actual formal [Precedence10Expression] children;
}
