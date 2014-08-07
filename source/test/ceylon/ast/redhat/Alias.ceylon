import ceylon.ast.core {
    Alias
}
import ceylon.ast.redhat {
    RedHatTransformer,
    aliasToCeylon,
    compileAlias
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAlias=Alias
    }
}

shared object \ialias satisfies AbstractTest<Alias,JAlias> {
    compile = compileAlias;
    fromCeylon = RedHatTransformer.transformAlias;
    toCeylon = aliasToCeylon;
    
    tests = [typeAlias, functionValueAlias];
}
