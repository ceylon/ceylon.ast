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
    
    compile = compileStringLiteral;
    fromCeylon = RedHatTransformer.transformStringLiteral;
    toCeylon = stringLiteralToCeylon;
    codes = [capitalCStringLiteral, namedCapitalCStringLiteral];
}
