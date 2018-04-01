import ceylon.ast.core {
    Dec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    decToCeylon,
    parseDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JMetaLiteral=MetaLiteral
    }
}
import test.ceylon.ast.redhat {
    AbstractTest,
    moduleDec,
    packageDec
}

shared object dec satisfies AbstractTest<Dec,JMetaLiteral> {
    parse = parseDec;
    fromCeylon = RedHatTransformer.transformDec;
    toCeylon = decToCeylon;
    
    tests = [typeDec, memberDec, constructorDec, packageDec, moduleDec];
}
