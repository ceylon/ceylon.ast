import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.core {
    baseExpression,
    positionalArguments,
    thisInstance,
    ArgumentList,
    PositionalArguments,
    SpreadArgument
}

test
shared void positionalArgumentsFunction() {
    assertEquals {
        actual = positionalArguments();
        expected = PositionalArguments(ArgumentList());
    };
    assertEquals {
        actual = positionalArguments(thisInstance, SpreadArgument(baseExpression("others")));
        expected = PositionalArguments(ArgumentList([thisInstance], SpreadArgument(baseExpression("others"))));
    };
}
