import ceylon.test {
    test
}
import ceylon.ast.api {
    StringLiteral,
    CharacterLiteral,
    IntegerLiteral,
    FloatLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    literalToCeylon,
    compile=compileLiteral
}

test
shared void literal()
        => doTest(compile, RedHatTransformer.transformLiteral, literalToCeylon,
    "\"Hello, World!\""->StringLiteral("Hello, World!"),
    "\"\\{WHITE SMILING FACE}\""->StringLiteral("\\{WHITE SMILING FACE}"),
    "\"\"\"ceylon.ast\"\"\""->StringLiteral("ceylon.ast", true),
    "'a'"->CharacterLiteral("a"),
    "#7EA_BABE"->IntegerLiteral("#7EA_BABE"),
    "1.138k"->FloatLiteral("1.138k")
);
