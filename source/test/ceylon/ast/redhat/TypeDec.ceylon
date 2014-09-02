import ceylon.ast.core {
    TypeDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeDecToCeylon,
    compileTypeDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeLiteral=TypeLiteral
    }
}

shared object typeDec satisfies AbstractTest<TypeDec,JTypeLiteral> {
    compile = compileTypeDec;
    fromCeylon = RedHatTransformer.transformTypeDec;
    toCeylon = typeDecToCeylon;
    
    tests = [classDec, givenDec];
}
