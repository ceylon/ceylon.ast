import ceylon.test {
    test
}
import ceylon.ast.api {
    FloatLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    floatLiteralToCeylon,
    compile=compileFloatLiteral
}

test
shared void floatLiteral()
        => testConversion(RedHatTransformer.transformFloatLiteral, floatLiteralToCeylon,
    FloatLiteral("0.042k"),
    FloatLiteral("10.1010")
);

test
shared void compileFloatLiteral()
        => testCompilation(compile, for (text in { "0.042k", "10.1010" }) text->FloatLiteral(text));
