import ceylon.ast.core {
    TypeDec
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeDecToCeylon,
    parseTypeDec
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeLiteral=TypeLiteral
    }
}

shared object typeDec satisfies AbstractTest<TypeDec,JTypeLiteral> {
    parse = parseTypeDec;
    fromCeylon = RedHatTransformer.transformTypeDec;
    toCeylon = typeDecToCeylon;
    
    tests = [classDec, interfaceDec, aliasDec, givenDec];
}
