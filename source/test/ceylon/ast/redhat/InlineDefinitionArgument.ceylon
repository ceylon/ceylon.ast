import ceylon.ast.core {
    InlineDefinitionArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    inlineDefinitionArgumentToCeylon,
    parseInlineDefinitionArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypedArgument=TypedArgument
    }
}

shared object inlineDefinitionArgument satisfies AbstractTest<InlineDefinitionArgument,JTypedArgument> {
    parse = parseInlineDefinitionArgument;
    fromCeylon = RedHatTransformer.transformInlineDefinitionArgument;
    toCeylon = inlineDefinitionArgumentToCeylon;
    
    tests = [valueArgument, functionArgument, objectArgument];
}
