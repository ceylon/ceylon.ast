import ceylon.ast.core {
    NamedArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    namedArgumentToCeylon,
    compileNamedArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNamedArgument=NamedArgument
    }
}

shared object namedArgument satisfies AbstractTest<NamedArgument,JNamedArgument> {
    compile = compileNamedArgument;
    fromCeylon = RedHatTransformer.transformNamedArgument;
    toCeylon = namedArgumentToCeylon;
    
    tests = [anonymousArgument];
}
