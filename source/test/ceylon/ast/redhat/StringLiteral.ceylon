import ceylon.ast.core {
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    stringLiteralToCeylon,
    parseStringLiteral
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JStringLiteral=StringLiteral
    }
}

shared object stringLiteral satisfies ConcreteTest<StringLiteral,JStringLiteral> {
    
    String->StringLiteral construct(String text, Boolean verbatim = false)
            => let (quotes = verbatim then "\"\"\"" else "\"") (quotes + text + quotes) -> StringLiteral(text, verbatim);
    
    shared String->StringLiteral capitalCStringLiteral = construct("\{LATIN CAPITAL LETTER C}");
    shared String->StringLiteral namedCapitalCStringLiteral = construct("\\{LATIN CAPITAL LETTER C}");
    shared String->StringLiteral emptyStringLiteral = construct("");
    shared String->StringLiteral verbatimStringLiteral = construct("verbatim", true);
    shared String->StringLiteral quoteStringLiteral = construct("""\"""", false);
    shared String->StringLiteral quoteVerbatimStringLiteral = construct(""""""", true);
    shared String->StringLiteral emptyVerbatimStringLiteral = construct("", true);
    
    // not tested directly, but used by other tests
    shared String->StringLiteral helloStringLiteral = construct("Hello, ");
    shared String->StringLiteral worldStringLiteral = construct("World");
    shared String->StringLiteral bangStringLiteral = construct("!");
    shared String->StringLiteral lucasStringLiteral = construct("Lucas");
    shared String->StringLiteral _100VersionStringLiteral = construct("1.0.0");
    shared String->StringLiteral commaStringLiteral = construct(", ");
    shared String->StringLiteral commonsCodecStringLiteral = construct("commons-codec");
    shared String->StringLiteral _14VersionStringLiteral = construct("1.4");
    shared String->StringLiteral _211VersionStringLiteral = construct("2.1.1");
    shared String->StringLiteral hibernateCoreStringLiteral = construct("hibernate-core");
    shared String->StringLiteral classifierStringLiteral = construct("classifier");
    shared String->StringLiteral _133VersionStringLiteral = construct("1.3.3");
    
    parse = parseStringLiteral;
    fromCeylon = RedHatTransformer.transformStringLiteral;
    toCeylon = stringLiteralToCeylon;
    codes = [capitalCStringLiteral, namedCapitalCStringLiteral, emptyStringLiteral, verbatimStringLiteral, quoteStringLiteral, quoteVerbatimStringLiteral, emptyVerbatimStringLiteral];
}
