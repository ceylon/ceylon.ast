"An expression on or above the precedence level of assignment.
 
 This contains all “Layer 4” operators, that is, all operators total."
shared alias AssigningExpression
        => ThenElseExpression|AssignmentOperation;
