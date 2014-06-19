import ceylon.ast.api {
    CharacterLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCharacterLiteral=CharLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        character_literal=\iCHAR_LITERAL
    }
}

"Converts a RedHat AST [[CharLiteral|JCharacterLiteral]] to a `ceylon.ast` [[CharacterLiteral]]."
throws (`class AssertionError`, "If the token type is not `CHAR_LITERAL`.")
shared CharacterLiteral characterLiteralToCeylon(JCharacterLiteral characterLiteral) {
    assert (characterLiteral.mainToken.type == character_literal);
    return CharacterLiteral(characterLiteral.text[1 .. characterLiteral.text.size - 2]);
}

"Compiles the given [[code]] for a Character Literal
 into a [[CharacterLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `nonStringLiteral`)."
shared CharacterLiteral? compileCharacterLiteral(String code) {
    if (is JCharacterLiteral jCharacterLiteral = createParser(code).nonstringLiteral()) {
        return characterLiteralToCeylon(jCharacterLiteral);
    } else {
        return null;
    }
}
