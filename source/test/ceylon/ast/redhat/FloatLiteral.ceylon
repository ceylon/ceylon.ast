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
    
    compile = compileFloatLiteral;
    fromCeylon = RedHatTransformer.transformFloatLiteral;
    toCeylon = floatLiteralToCeylon;
    codes = [oPointOFortyTwoKFloatLiteral, tenPointOneOhOneOhFloatLiteral];
}
