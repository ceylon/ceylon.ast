import ceylon.ast.core {
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    stringLiteralToCeylon,
    compileStringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStringLiteral=StringLiteral
    }
}

shared object stringLiteral satisfies ConcreteTest<StringLiteral,JStringLiteral> {
    
    String->StringLiteral construct(String text)
            => "\"``text``\""->StringLiteral(text);
    
    shared String->StringLiteral capitalCStringLiteral = construct("\{LATIN CAPITAL LETTER C}");
    shared String->StringLiteral namedCapitalCStringLiteral = construct("\\{LATIN CAPITAL LETTER C}");
    
    // not tested directly, but used by other tests
    shared String->StringLiteral helloStringLiteral = construct("Hello, ");
    shared String->StringLiteral worldStringLiteral = construct("World");
    shared String->StringLiteral bangStringLiteral = construct("!");
    shared String->StringLiteral lucasStringLiteral = construct("Lucas");
    shared String->StringLiteral _100VersionStringLiteral = construct("1.0.0");
    shared String->StringLiteral commaStringLiteral = construct(", ");
    
    compile = compileStringLiteral;
    fromCeylon = RedHatTransformer.transformStringLiteral;
    toCeylon = stringLiteralToCeylon;
    codes = [capitalCStringLiteral, namedCapitalCStringLiteral];
}
