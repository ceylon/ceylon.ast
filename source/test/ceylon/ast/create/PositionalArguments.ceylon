import ceylon.ast.core {
    ArgumentList,
    PositionalArguments,
    SpreadArgument,
    This
}
import ceylon.ast.create {
    createBaseExpression=baseExpression,
    createPositionalArguments=positionalArguments
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void positionalArguments() {
    assertEquals {
        actual = createPositionalArguments();
        expected = PositionalArguments(ArgumentList());
    };
    assertEquals {
        actual = createPositionalArguments(This(), SpreadArgument(createBaseExpression("others")));
        expected = PositionalArguments(ArgumentList([This()], SpreadArgument(createBaseExpression("others"))));
    };
}
