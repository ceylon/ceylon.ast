import ceylon.ast.samples.bodyReturnRewrite {
    RewriteReturnsEditor
}
import ceylon.ast.core {
    Block,
    BooleanCondition,
    Conditions,
    ElseClause,
    IfClause,
    IfElse,
    LIdentifier,
    Return,
    Specifier,
    ValueSpecification
}
import ceylon.ast.create {
    baseExpression
}
import ceylon.test {
    test,
    assertEquals
}

LIdentifier returnValueName = LIdentifier("returnValue");
RewriteReturnsEditor rewriter = RewriteReturnsEditor(returnValueName);
void compare(Block input, Block expectedOutput, String? message = null) {
    assertEquals {
        expected = expectedOutput;
        actual = input.transform(rewriter);
        message = message;
    };
}

test
shared void testRewriteReturnsEditor() {
    value trueConditions = Conditions([BooleanCondition(baseExpression("true"))]);
    compare {
        Block([]);
        Block([]);
        "Empty body";
    };
    compare {
        Block([
                IfElse {
                    ifClause = IfClause(trueConditions, Block([
                                Return(baseExpression("a"))
                            ]));
                    elseClause = ElseClause(Block([
                                Return(baseExpression("b"))
                            ]));
                }]);
        Block([
                IfElse {
                    ifClause = IfClause(trueConditions, Block([
                                ValueSpecification(returnValueName, Specifier(baseExpression("a")))
                            ]));
                    elseClause = ElseClause(Block([
                                ValueSpecification(returnValueName, Specifier(baseExpression("b")))
                            ]));
                }]);
    };
}
