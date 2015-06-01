import ceylon.ast.core {
    IntegerLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    integerLiteralToCeylon,
    compileIntegerLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNaturalLiteral=NaturalLiteral
    }
}

shared object integerLiteral satisfies ConcreteTest<IntegerLiteral,JNaturalLiteral> {
    
    String->IntegerLiteral construct(String text)
            => text->IntegerLiteral(text);
    
    shared String->IntegerLiteral _1138IntegerLiteral = construct("1138");
    /*
     TODO add #7EA_BABE, $101010
     */
    
    // not tested directly, but used by other tests
    shared String->IntegerLiteral oneIntegerLiteral = construct("1");
    shared String->IntegerLiteral _0IntegerLiteral = construct("0");
    shared String->IntegerLiteral _2IntegerLiteral = construct("2");
    shared String->IntegerLiteral _8IntegerLiteral = construct("8");
    
    compile = compileIntegerLiteral;
    fromCeylon = RedHatTransformer.transformIntegerLiteral;
    toCeylon = integerLiteralToCeylon;
    codes = [_1138IntegerLiteral];
}
