"A comparison expression.
 
 No associativity.
 
 This is the abstract superclass of expressions like `a <= b` and `x > 3`;
 not to be confused with [[CompareOperation]], the concrete class representing expressions like `first <=> second`!"
shared abstract class ComparisonOperation()
        of LargerOperation | SmallerOperation | LargeAsOperation | SmallAsOperation
        extends BinaryOperation() {
    
    shared actual formal ExistsNonemptyExpression leftOperand;
    shared actual formal ExistsNonemptyExpression rightOperand;
    
    shared actual formal [ExistsNonemptyExpression, ExistsNonemptyExpression] children;
}
