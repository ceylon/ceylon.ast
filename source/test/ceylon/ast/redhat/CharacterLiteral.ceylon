import ceylon.ast.core {
    CharacterLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    characterLiteralToCeylon,
    compileCharacterLiteral
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
    
    shared actual CharacterLiteral? compile(String code) => compileCharacterLiteral(code);
    shared actual JCharLiteral fromCeylon(RedHatTransformer transformer)(CharacterLiteral node) => transformer.transformCharacterLiteral(node);
    shared actual CharacterLiteral toCeylon(JCharLiteral node) => characterLiteralToCeylon(node);
    codes = [capitalCCharacterLiteral, namedCapitalCCharacterLiteral];
}
