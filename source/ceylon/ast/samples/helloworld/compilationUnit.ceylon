import ceylon.ast.core {
    baseExpression,
    CompilationUnit,
    FunctionDefinition,
    LIdentifier,
    VoidModifier,
    Parameters,
    Block,
    InvocationStatement,
    Invocation,
    PositionalArguments,
    ArgumentList,
    StringLiteral,
    stringTemplate,
    qualifiedExpression,
    ElseOperation
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
