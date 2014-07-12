import ceylon.ast.core {
    Dec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    decToCeylon,
    compileDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMetaLiteral=MetaLiteral
    }
}

shared object dec satisfies AbstractTest<Dec,JMetaLiteral> {
    compile = compileDec;
    fromCeylon = RedHatTransformer.transformDec;
    toCeylon = decToCeylon;
    
    tests = [givenDec];
}
