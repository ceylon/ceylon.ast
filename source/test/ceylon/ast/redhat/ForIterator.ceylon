import ceylon.ast.core {
    ForIterator
}
import ceylon.ast.redhat {
    RedHatTransformer,
    forIteratorToCeylon,
    compileForIterator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JForIterator=ForIterator
    }
}

shared object forIterator satisfies AbstractTest<ForIterator,JForIterator> {
    compile = compileForIterator;
    fromCeylon = RedHatTransformer.transformForIterator;
    toCeylon = forIteratorToCeylon;
    
    tests = [valueIterator, keyValueIterator];
}
