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
    
    shared actual GivenDec? compile(String code) => compileGivenDec(code);
    shared actual JTypeParameterLiteral fromCeylon(RedHatTransformer transformer)(GivenDec node) => transformer.transformGivenDec(node);
    shared actual GivenDec toCeylon(JTypeParameterLiteral node) => givenDecToCeylon(node);
    codes = [keyGivenDec, lowercaseKeyGivenDec];
}
