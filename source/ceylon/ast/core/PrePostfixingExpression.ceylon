"An expression on or above the precedence level of arithmetic pre- or postfix expressions.
 
 (This is the highest precedence level for operators; only [[primary expressions|Primary]]
 rank higher.)"
shared alias PrePostfixingExpression
        => Primary|PrefixOperation|PostfixOperation;
