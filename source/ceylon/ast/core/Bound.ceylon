"A lower or upper bound of a [[bounded comparison operation|WithinOperation]]."
shared abstract class Bound()
        of OpenBound | ClosedBound
        extends Node() {
    
    "The endpoint of the bound, against which
     the [[operand|WithinOperation.operand]] is compared."
    shared formal ExistsNonemptyExpression endpoint;
    
    shared actual formal [ExistsNonemptyExpression] children;
}
