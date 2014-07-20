import ceylon.ast.core {
    Atom
}
import ceylon.ast.redhat {
    RedHatTransformer,
    atomToCeylon,
    compileAtom
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAtom=Atom
    }
}

shared object atom satisfies AbstractTest<Atom,JAtom> {
    compile = compileAtom;
    fromCeylon = RedHatTransformer.transformAtom;
    toCeylon = atomToCeylon;
    
    tests = [literal, selfReference, groupedExpression, iterable, tuple, dynamicValue];
}
