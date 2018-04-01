import ceylon.ast.core {
    NamedArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    namedArgumentToCeylon,
    parseNamedArgument
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JNamedArgument=NamedArgument
    }
}

shared object namedArgument satisfies AbstractTest<NamedArgument,JNamedArgument> {
    parse = parseNamedArgument;
    fromCeylon = RedHatTransformer.transformNamedArgument;
    toCeylon = namedArgumentToCeylon;
    
    tests = [anonymousArgument, specifiedArgument, inlineDefinitionArgument];
}
