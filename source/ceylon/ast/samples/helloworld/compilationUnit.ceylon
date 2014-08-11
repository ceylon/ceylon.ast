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
    StringLiteral
}

shared CompilationUnit helloWorldCompilationUnit = CompilationUnit([
        FunctionDefinition {
            name = LIdentifier("run");
            type = VoidModifier();
            parameterLists = [Parameters()];
            definition = Block([
                    InvocationStatement(Invocation {
                            invoked = baseExpression("print");
                            arguments = PositionalArguments(ArgumentList([StringLiteral("Hello, World!")]));
                        })
                ]);
        }
    ]);
