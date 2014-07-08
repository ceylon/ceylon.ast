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
    
    shared String->IntegerLiteral oneOneThreeEightIntegerLiteral = construct("1138");
    /*
     TODO add #7EA_BABE, $101010
     */
    
    // not tested directly, but used by other tests
    shared String->IntegerLiteral oneIntegerLiteral = construct("1");
    
    shared actual IntegerLiteral? compile(String code) => compileIntegerLiteral(code);
    shared actual JNaturalLiteral fromCeylon(RedHatTransformer transformer)(IntegerLiteral node) => transformer.transformIntegerLiteral(node);
    shared actual IntegerLiteral toCeylon(JNaturalLiteral node) => integerLiteralToCeylon(node);
    codes = [oneOneThreeEightIntegerLiteral];
}
