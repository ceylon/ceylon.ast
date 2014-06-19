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
        => testConversion(RedHatTransformer.transformIntegerLiteral, integerLiteralToCeylon,
    IntegerLiteral("1138"),
    IntegerLiteral("#7EA_BABE"),
    IntegerLiteral("$101010")
);

test
shared void compileIntegerLiteral()
        => testCompilation(compile, for (text in { "1138", "#7EA_BABE", "$101010" }) text->IntegerLiteral(text));
