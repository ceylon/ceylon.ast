import ceylon.test {
    test
}
import ceylon.ast.api {
    IntegerLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    integerLiteralToCeylon,
    compile=compileIntegerLiteral
}

test
shared void integerLiteral()
        => doTest(compile, RedHatTransformer.transformIntegerLiteral, integerLiteralToCeylon,
    for (text in { "1138", "#7EA_BABE", "$101010" }) text->IntegerLiteral(text));
