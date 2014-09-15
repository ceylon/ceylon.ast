import ceylon.ast.samples.bodyReturnRewrite {
    hasEarlyReturns
}
import ceylon.ast.core {
    baseExpression,
    positionalArguments,
    Block,
    BooleanCondition,
    Conditions,
    ElseClause,
    IfClause,
    IfElse,
    Invocation,
    InvocationStatement,
    Return,
    StringLiteral,
    While
}
import ceylon.test {
    test,
    assertFalse,
    assertTrue
}

test
shared void testHasEarlyReturns() {
    
    value trueConditions = Conditions([BooleanCondition(baseExpression("true"))]);
    value returnBlock = Block([Return()]);
    value nonReturnBlock = Block([InvocationStatement(Invocation(
                    baseExpression("print"),
                    positionalArguments(StringLiteral("Hello, World!")
                    )))]);
    
    assertFalse {
        hasEarlyReturns(Block([]));
        message = "Empty block";
    };
    assertFalse {
        hasEarlyReturns(nonReturnBlock);
        message = "Block with a single non-return statement";
    };
    assertFalse {
        hasEarlyReturns(returnBlock);
        message = "Block with a single return statement";
    };
    assertFalse {
        hasEarlyReturns(Block([
                    IfElse {
                        ifClause = IfClause(trueConditions, returnBlock);
                        elseClause = ElseClause(returnBlock);
                    }
                ]));
        message = "Block with an if/else statement where both clauses return";
    };
    
    assertTrue {
        hasEarlyReturns(Block([
                    IfElse {
                        ifClause = IfClause(trueConditions, returnBlock);
                        elseClause = null;
                    },
                    nonReturnBlock.children.first else nothing
                ]));
        message = "Block with an if statement and a return afterwards";
    };
    assertTrue {
        hasEarlyReturns(Block([While(trueConditions, returnBlock)]));
        message = "Block with a while loop containing a return";
    };
}
