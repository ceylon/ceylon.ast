"An expression of operator precedence level 11 or lower."
shared alias Precedence11Expression
        => Precedence10Expression|IsOperation|OfOperation|InOperation|ComparisonOperation|CompareOperation|WithinOperation;
