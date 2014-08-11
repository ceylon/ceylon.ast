import ceylon.ast.core {
    baseExpression,
    qualifiedExpression,
    stringTemplate,
    ArgumentList,
    Block,
    CompilationUnit,
    ElseOperation,
    FunctionDefinition,
    Invocation,
    InvocationStatement,
    LIdentifier,
    Parameters,
    PositionalArguments,
    StringLiteral,
    VoidModifier
}

shared CompilationUnit helloWorldCompilationUnit = CompilationUnit([
        FunctionDefinition {
            name = LIdentifier("run");
            type = VoidModifier();
            parameterLists = [Parameters()];
            definition = Block([
                    InvocationStatement(Invocation {
                            invoked = baseExpression("print");
                            arguments = PositionalArguments(ArgumentList([
                                        stringTemplate(
                                            StringLiteral("Hello, "),
                                            ElseOperation {
                                                optionalValue = qualifiedExpression(qualifiedExpression("process", "arguments"), "first");
                                                defaultValue = StringLiteral("World");
                                            },
                                            StringLiteral("!"))
                                    ]));
                        })
                ]);
        }
    ]);
