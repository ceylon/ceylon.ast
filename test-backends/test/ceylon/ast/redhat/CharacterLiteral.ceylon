import ceylon.test {
    test
}
import ceylon.ast.api {
    CharacterLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    characterLiteralToCeylon,
    compile=compileCharacterLiteral
}

test
shared void characterLiteral()
        => testConversion(RedHatTransformer.transformCharacterLiteral, characterLiteralToCeylon,
    CharacterLiteral("\{LATIN CAPITAL LETTER C}"),
    CharacterLiteral("\\{LATIN CAPITAL LETTER C}")
);

test
shared void compileCharacterLiteral()
        => testCompilation(compile, for (text in { "\{LATIN CAPITAL LETTER C}", "\\{LATIN CAPITAL LETTER C}" }) "'``text``'"->CharacterLiteral(text));
