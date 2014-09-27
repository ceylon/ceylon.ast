"An expression on or above the precedence level of comparison, containment,
 assignability and inheritance tests."
shared alias ComparingExpression
        => ExistsNonemptyExpression|IsOperation|OfOperation|InOperation|ComparisonOperation|CompareOperation|WithinOperation;
