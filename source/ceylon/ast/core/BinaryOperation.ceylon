"A binary operator expression.
 
 Binary operations can be left-associative (`a X b X c` means `(a X b) X c`)
 or right-associative (`a X b X c` means `a X (b X c)`).
 To represent this in the type system, the left and right children
 of concrete classes usually have different types:
 One has the type of the current precedence level (see the `PrecedenceXOperation` aliases),
 one has the type of the precedence level below.
 
 (Some binary operations have no precedence because they can’t be nested
 (for example, `a == b == c` is never allowed); in this case,
 both children have the type of the precedence level below.)"
shared abstract class BinaryOperation()
        of ArithmeticOperation | SetOperation | ScaleOperation | SpanOperation | MeasureOperation | EntryOperation | InOperation | ComparisonOperation | CompareOperation
        extends Operation() {
    
    "The left child expression."
    shared formal ValueExpression leftChild;
    "The right child expression."
    shared formal ValueExpression rightChild;
    
    shared actual formal [ValueExpression, ValueExpression] children;
}
