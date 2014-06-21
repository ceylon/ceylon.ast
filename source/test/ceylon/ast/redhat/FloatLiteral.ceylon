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
        => doTest(compile, RedHatTransformer.transformFloatLiteral, floatLiteralToCeylon,
    for (text in { "0.042k", "10.1010" }) text->FloatLiteral(text));
