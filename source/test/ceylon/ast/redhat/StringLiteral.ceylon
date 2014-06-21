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
        => doTest(compile, RedHatTransformer.transformStringLiteral, stringLiteralToCeylon,
    for (text in { "\{LATIN CAPITAL LETTER C}", "\\{LATIN CAPITAL LETTER C}" }) for (isVerbatim in { true, false }) (isVerbatim then "\"\"\"``text``\"\"\"" else "\"``text``\"")->StringLiteral(text, isVerbatim));
