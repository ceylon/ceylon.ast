import ceylon.ast.core {
    CharacterLiteral,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared CharacterLiteral characterLiteralToCeylon(JCharacterLiteral characterLiteral, Anything(JNode, Node) update = noop) {
    assert (characterLiteral.mainToken.type == character_literal);
    value result = CharacterLiteral(characterLiteral.text[1 .. characterLiteral.text.size-2]);
    update(characterLiteral, result);
    return result;
}

"Parses the given [[code]] for a Character Literal
 into a [[CharacterLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `nonStringLiteral`)."
shared CharacterLiteral? parseCharacterLiteral(String code, Anything(JNode, Node) update = noop) {
    if (is JCharacterLiteral jCharacterLiteral = createParser(code).nonstringLiteral()) {
        return characterLiteralToCeylon(jCharacterLiteral, update);
    } else {
        return null;
    }
}
