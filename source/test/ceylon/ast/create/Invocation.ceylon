import ceylon.ast.core {
    Invocation,
    InvocationStatement,
    StringLiteral,
    PositionalArguments,
    ArgumentList
}
import ceylon.ast.create {
    createBaseExpression=baseExpression,
    createInvocation=invocation,
    createInvocationStatement=invocationStatement
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void invocation() {
    assertEquals {
        actual = createInvocation {
            "printAll";
            StringLiteral("Hello, World!"), StringLiteral("Goodbye, World!")
        };
        expected = Invocation(createBaseExpression("printAll"), PositionalArguments(ArgumentList([StringLiteral("Hello, World!"), StringLiteral("Goodbye, World!")])));
        message = "Invocation";
    };
}

test
shared void invocationStatement() {
    assertEquals {
        actual = createInvocationStatement {
            "printAll";
            StringLiteral("Hello, World!"), StringLiteral("Goodbye, World!")
        };
        expected = InvocationStatement(Invocation(createBaseExpression("printAll"), PositionalArguments(ArgumentList([StringLiteral("Hello, World!"), StringLiteral("Goodbye, World!")]))));
        message = "InvocationStatement";
    };
}
