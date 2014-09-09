import ceylon.ast.core {
    InlineDefinitionArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    inlineDefinitionArgumentToCeylon,
    compileInlineDefinitionArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypedArgument=TypedArgument
    }
}

shared object inlineDefinitionArgument satisfies AbstractTest<InlineDefinitionArgument,JTypedArgument> {
    compile = compileInlineDefinitionArgument;
    fromCeylon = RedHatTransformer.transformInlineDefinitionArgument;
    toCeylon = inlineDefinitionArgumentToCeylon;
    
    tests = [valueArgument, objectArgument];
}
