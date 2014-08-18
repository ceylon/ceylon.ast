import ceylon.ast.core {
    baseExpression,
    positionalArguments,
    qualifiedExpression,
    stringTemplate,
    Block,
    CompilationUnit,
    ElseOperation,
    FunctionDefinition,
    Invocation,
    InvocationStatement,
    LIdentifier,
    Parameters,
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
                            arguments = positionalArguments(
                                stringTemplate(
                                    StringLiteral("Hello, "),
                                    ElseOperation {
                                        optionalValue = qualifiedExpression(qualifiedExpression("process", "arguments"), "first");
                                        defaultValue = StringLiteral("World");
                                    },
                                    StringLiteral("!"))
                            );
                        })
                ]);
        }
    ]);
