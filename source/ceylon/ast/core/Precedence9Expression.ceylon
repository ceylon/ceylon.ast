"An expression of operator precedence level 9 or lower.
 
 This contains all “Layer 1” operators."
shared alias Precedence9Expression
        => Precedence8Expression|SpanOperation|MeasureOperation|EntryOperation;
