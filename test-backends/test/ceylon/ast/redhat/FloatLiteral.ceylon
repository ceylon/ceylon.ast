import ceylon.test {
    test
}
import ceylon.ast.api {
    FloatLiteral
}
import ceylon.ast.redhat {
    floatLiteralToCeylon,
    floatLiteralFromCeylon,
    compile=compileFloatLiteral
}

test
shared void floatLiteral()
        => testConversion(floatLiteralFromCeylon, floatLiteralToCeylon,
    FloatLiteral("0.042k"),
    FloatLiteral("10.1010")
);

test
shared void compileFloatLiteral()
        => testCompilation(compile, for (text in { "0.042k", "10.1010" }) text->FloatLiteral(text));
