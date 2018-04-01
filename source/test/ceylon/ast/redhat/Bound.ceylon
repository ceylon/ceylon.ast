import ceylon.ast.core {
    Bound
}
import ceylon.ast.redhat {
    RedHatTransformer,
    boundToCeylon
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JBound=Bound
    }
}

shared object bound satisfies AbstractConversionTest<Bound,JBound> {
    fromCeylon = RedHatTransformer.transformBound;
    toCeylon = boundToCeylon;
    
    tests = [openBound, closedBound];
}
