import ceylon.ast.core {
    Subscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    subscriptToCeylon,
    compileSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementOrRange=ElementOrRange
    }
}

shared object subscript satisfies AbstractTest<Subscript,JElementOrRange> {
    compile = compileSubscript;
    fromCeylon = RedHatTransformer.transformSubscript;
    toCeylon = subscriptToCeylon;
    
    tests = [keySubscript, rangeSubscript];
}
