import ceylon.ast.api {
    Literal,
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLiteral=Literal,
        JStringLiteral=StringLiteral,
        JCharacterLiteral=CharLiteral,
        JIntegerLiteral=NaturalLiteral,
        JFloatLiteral=FloatLiteral,
        JQuotedLiteral=QuotedLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        string_literal=\iSTRING_LITERAL,
        verbatim_string_literal=\iVERBATIM_STRING,
        character_literal=\iCHAR_LITERAL
    }
}

"Converts a RedHat AST [[Literal|JLiteral]] to a `ceylon.ast` [[Literal]].
 
 (A [[QuotedLiteral|JQuotedLiteral]] – a string surrounded by single or double quotes –
 is always converted to a [[StringLiteral]].)"
throws (`class AssertionError`, "If the token type is wrong.")
shared Literal literalToCeylon(JLiteral literal) {
    assert (is JStringLiteral|JCharacterLiteral|JIntegerLiteral|JFloatLiteral|JQuotedLiteral literal);
    switch (literal)
    case (is JStringLiteral) { return stringLiteralToCeylon(literal); }
    case (is JCharacterLiteral) { return characterLiteralToCeylon(literal); }
    case (is JIntegerLiteral) { return integerLiteralToCeylon(literal); }
    case (is JFloatLiteral) { return floatLiteralToCeylon(literal); }
    case (is JQuotedLiteral) {
        // used for module versions: the grammar allows single and double quotes
        value type = literal.mainToken.type;
        if (type == verbatim_string_literal) {
            return StringLiteral(literal.text[3 .. literal.text.size - 4], true);
        } else {
            assert (type == string_literal || type == character_literal);
            return StringLiteral(literal.text[1 .. literal.text.size - 2], false);
        }
    }
}

"Compiles the given [[code]] for a Literal
 into a [[Literal]] using the Ceylon compiler
 (more specifically, the rules for a `stringLiteral` and a `nonstringLiteral`)."
shared Literal? compileLiteral(String code) {
    if (exists jStringLiteral = createParser(code).stringLiteral()) {
        return stringLiteralToCeylon(jStringLiteral);
    } else if (exists jLiteral = createParser(code).nonstringLiteral()) {
        return literalToCeylon(jLiteral);
    } else {
        return null;
    }
}
