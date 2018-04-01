import ceylon.ast.core {
    Subscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    subscriptToCeylon,
    parseSubscript
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JElementOrRange=ElementOrRange
    }
}

shared object subscript satisfies AbstractTest<Subscript,JElementOrRange> {
    parse = parseSubscript;
    fromCeylon = RedHatTransformer.transformSubscript;
    toCeylon = subscriptToCeylon;
    
    tests = [keySubscript, rangeSubscript];
}
