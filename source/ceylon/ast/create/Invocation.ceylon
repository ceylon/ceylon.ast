import ceylon.ast.core {
    Invocation,
    InvocationStatement,
    Primary
}

"""Creates an [[Invocation]] using [[positional arguments|ceylon.ast.core::PositionalArguments]].
   
   Usage example:
   
       invocation {
           "printAll";
           StringLiteral("Hello, World!"), StringLiteral("Goodbye, World!")
       }"""
shared Invocation invocation(Primary|IdentifierIsh invoked, {PositionalArgumentIsh*} arguments) {
    return Invocation {
        value invoked {
            switch (invoked)
            case (is Primary) { return invoked; }
            case (is IdentifierIsh) { return baseExpression(invoked); }
        }
        arguments = positionalArguments(*arguments);
    };
}

"""Creates an [[InvocationStatement]] using [[positional arguments|ceylon.ast.core::PositionalArguments]].
   
   Usage example:
   
       invocationStatement {
           "printAll";
           StringLiteral("Hello, World!"), StringLiteral("Goodbye, World!")
       }"""
shared InvocationStatement invocationStatement(Primary|IdentifierIsh invoked, {PositionalArgumentIsh*} arguments)
        => InvocationStatement(invocation(invoked, arguments));
