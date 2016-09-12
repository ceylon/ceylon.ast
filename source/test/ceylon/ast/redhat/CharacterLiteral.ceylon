import ceylon.ast.core {
    CharacterLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    characterLiteralToCeylon,
    parseCharacterLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCharLiteral=CharLiteral
    }
}

shared object characterLiteral satisfies ConcreteTest<CharacterLiteral,JCharLiteral> {
    
    String->CharacterLiteral construct(String text)
            => "'``text``'"->CharacterLiteral(text);
    
    shared String->CharacterLiteral capitalCCharacterLiteral = construct("\{LATIN CAPITAL LETTER C}");
    shared String->CharacterLiteral namedCapitalCCharacterLiteral = construct("\\{LATIN CAPITAL LETTER C}");
    
    parse = parseCharacterLiteral;
    fromCeylon = RedHatTransformer.transformCharacterLiteral;
    toCeylon = characterLiteralToCeylon;
    codes = [capitalCCharacterLiteral, namedCapitalCCharacterLiteral];
}
