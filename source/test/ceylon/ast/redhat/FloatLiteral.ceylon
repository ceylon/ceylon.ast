import ceylon.ast.core {
    FloatLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    floatLiteralToCeylon,
    parseFloatLiteral
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JFloatLiteral=FloatLiteral
    }
}

shared object floatLiteral satisfies ConcreteTest<FloatLiteral,JFloatLiteral> {
    
    String->FloatLiteral construct(String text)
            => text -> FloatLiteral(text);
    
    shared String->FloatLiteral oPointOFortyTwoKFloatLiteral = construct("0.042k");
    shared String->FloatLiteral tenPointOneOhOneOhFloatLiteral = construct("10.1010");
    
    // not tested directly, but used by other tests
    shared String->FloatLiteral oPointOFloatLiteral = construct("0.0");
    
    parse = parseFloatLiteral;
    fromCeylon = RedHatTransformer.transformFloatLiteral;
    toCeylon = floatLiteralToCeylon;
    codes = [oPointOFortyTwoKFloatLiteral, tenPointOneOhOneOhFloatLiteral];
}
