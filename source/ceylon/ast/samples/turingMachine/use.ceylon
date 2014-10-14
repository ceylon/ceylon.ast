import ceylon.ast.core {
    CompilationUnit,
    Invocation,
    LIdentifier,
    Specifier,
    ValueDefinition,
    ValueModifier,
    VoidModifier
}
import ceylon.ast.create {
    annotations,
    baseExpression,
    baseType,
    functionDefinition,
    invocation,
    qualifiedExpression
}

"Creates a driver for the type system turing machine."
shared CompilationUnit useTuringMachine(String word, Integer iterations, String functionName = "run") {
    
    LIdentifier stateName(Integer iteration)
            => LIdentifier("s" + iteration.string.padLeading(iterations.string.size, '0'));
    
    variable Invocation stack = Invocation(baseExpression("e"));
    for (symbol in word.reversed) {
        stack = invocation {
            "b";
            baseExpression("input_``symbol``_T"), stack // TODO don’t hard-code symbol name
        };
    }
    
    return CompilationUnit([
            functionDefinition {
                name = functionName;
                type = VoidModifier();
                annotations = annotations { "shared" };
                
                *concatenate({
                        ValueDefinition {
                            name = stateName(0);
                            type = ValueModifier();
                            definition = Specifier(invocation { "initial"; stack });
                        },
                        for (i in 1:iterations)
                            ValueDefinition {
                                name = stateName(i);
                                type = ValueModifier();
                                definition = Specifier(invocation {
                                        "t";
                                        baseExpression(stateName(i - 1)),
                                        qualifiedExpression(qualifiedExpression(stateName(i - 1), "second"), "first"),
                                        qualifiedExpression(qualifiedExpression(stateName(i - 1), "second"), "rest"),
                                        qualifiedExpression(qualifiedExpression(stateName(i - 1), "third"), "first"),
                                        qualifiedExpression(qualifiedExpression(stateName(i - 1), "third"), "rest")
                                    });
                            }
                    }, {
                        ValueDefinition {
                            name = LIdentifier("accept");
                            type = baseType("Accept");
                            definition = Specifier(baseExpression(stateName(iterations)));
                        }
                    })
            }
        ]);
}
