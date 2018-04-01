import ceylon.ast.core {
    Atom
}
import ceylon.ast.redhat {
    RedHatTransformer,
    atomToCeylon,
    parseAtom
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAtom=Atom
    }
}

shared object atom satisfies AbstractTest<Atom,JAtom> {
    parse = parseAtom;
    fromCeylon = RedHatTransformer.transformAtom;
    toCeylon = atomToCeylon;
    
    tests = [literal, stringTemplate, selfReference, groupedExpression, iterable, tuple, dynamicValue];
}
