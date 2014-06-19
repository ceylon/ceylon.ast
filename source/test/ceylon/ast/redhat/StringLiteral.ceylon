import ceylon.test {
    test
}
import ceylon.ast.api {
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    stringLiteralToCeylon,
    compile=compileStringLiteral
}

test
shared void stringLiteral()
        => testConversion(RedHatTransformer.transformStringLiteral, stringLiteralToCeylon,
    StringLiteral("\{LATIN CAPITAL LETTER C}", false),
    StringLiteral("\\{LATIN CAPITAL LETTER C}", false),
    StringLiteral("\{LATIN CAPITAL LETTER C}", true),
    StringLiteral("\\{LATIN CAPITAL LETTER C}", true)
);

test
shared void compileStringLiteral()
        => testCompilation(compile, for (text in { "\{LATIN CAPITAL LETTER C}", "\\{LATIN CAPITAL LETTER C}" }) for (isVerbatim in { true, false }) (isVerbatim then "\"\"\"``text``\"\"\"" else "\"``text``\"")->StringLiteral(text, isVerbatim));
