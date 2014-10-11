import ceylon.ast.core {
    thisInstance,
    ArgumentList,
    PositionalArguments,
    SpreadArgument
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
        actual = createPositionalArguments(thisInstance, SpreadArgument(createBaseExpression("others")));
        expected = PositionalArguments(ArgumentList([thisInstance], SpreadArgument(createBaseExpression("others"))));
    };
}
