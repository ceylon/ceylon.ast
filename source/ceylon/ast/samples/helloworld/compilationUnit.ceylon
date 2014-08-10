import ceylon.ast.core {
    CompilationUnit,
    FunctionDefinition,
    LIdentifier,
    VoidModifier,
    Parameters,
    Block,
    InvocationStatement,
    Invocation,
    BaseExpression,
    MemberNameWithTypeArguments,
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
                            invoked = BaseExpression(MemberNameWithTypeArguments(LIdentifier("print")));
                            arguments = PositionalArguments(ArgumentList([StringLiteral("Hello, World!")]));
                        })
                ]);
        }
    ]);
