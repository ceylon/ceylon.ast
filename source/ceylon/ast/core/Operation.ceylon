"An operator expression.
 
 Operations combine [[Primaries|Primary]], as well as other operations, depending on precedence.
 Operator precedence and associativity is represented in the AST through the child types of the nodes;
 an AST that would violate associativity (for example, using a sum expression as the direct child of a
 product expression – without wrapping it in a [[GroupedExpression]]) isn’t well-typed.
 
 This class is called `Operation` rather than `OperatorExpression` to avoid overly long names
 of the subtypes; for the same reason, subtypes are only suffixed `-Operation` rather than `-BinaryOperation`
 or `-UnaryOperation`.
 
 The specification also lists expressions like `\"Hello\"[...3]` under operators;
 in `ceylon.ast`, they are called [[ElementOrSubrangeExpression]],
 and [[primaries|Primary]]."
shared abstract class Operation()
        of UnaryIshOperation | BinaryOperation | WithinOperation
        extends ValueExpression() {
    
    "The text of the operator."
    shared formal String operator;
    
    shared actual formal <ValueExpression|Type|Bound>[] children;
}
