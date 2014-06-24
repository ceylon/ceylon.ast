import ceylon.test {
    test
}
import ceylon.ast.core {
    CharacterLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    characterLiteralToCeylon,
    compile=compileCharacterLiteral
}

test
shared void characterLiteral()
        => doTest(compile, RedHatTransformer.transformCharacterLiteral, characterLiteralToCeylon,
    for (text in { "\{LATIN CAPITAL LETTER C}", "\\{LATIN CAPITAL LETTER C}" }) "'``text``'"->CharacterLiteral(text));
