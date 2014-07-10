import ceylon.ast.core {
    GivenDec,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    givenDecToCeylon,
    compileGivenDec
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeParameterLiteral=TypeParameterLiteral
    }
}

shared object givenDec satisfies ConcreteTest<GivenDec,JTypeParameterLiteral> {
    shared String->GivenDec keyGivenDec = "`given Key`"->GivenDec(UIdentifier("Key"));
    shared String->GivenDec lowercaseKeyGivenDec = "`given \\Ikey`"->GivenDec(UIdentifier("key"));
    
    compile = compileGivenDec;
    fromCeylon = RedHatTransformer.transformGivenDec;
    toCeylon = givenDecToCeylon;
    codes = [keyGivenDec, lowercaseKeyGivenDec];
}
