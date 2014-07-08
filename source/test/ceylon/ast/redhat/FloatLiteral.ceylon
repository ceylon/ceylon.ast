import ceylon.ast.core {
    FloatLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    floatLiteralToCeylon,
    compileFloatLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFloatLiteral=FloatLiteral
    }
}

shared object floatLiteral satisfies ConcreteTest<FloatLiteral,JFloatLiteral> {
    
    String->FloatLiteral construct(String text)
            => text->FloatLiteral(text);
    
    shared String->FloatLiteral oPointOFortyTwoKFloatLiteral = construct("0.042k");
    shared String->FloatLiteral tenPointOneOhOneOhFloatLiteral = construct("10.1010");
    
    shared actual FloatLiteral? compile(String code) => compileFloatLiteral(code);
    shared actual JFloatLiteral fromCeylon(RedHatTransformer transformer)(FloatLiteral node) => transformer.transformFloatLiteral(node);
    shared actual FloatLiteral toCeylon(JFloatLiteral node) => floatLiteralToCeylon(node);
    codes = [oPointOFortyTwoKFloatLiteral, tenPointOneOhOneOhFloatLiteral];
}
