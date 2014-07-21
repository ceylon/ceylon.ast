import ceylon.ast.core {
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStringLiteral=StringLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        astring_literal=\iASTRING_LITERAL,
        averbatim_string=\iAVERBATIM_STRING,
        string_literal=\iSTRING_LITERAL,
        verbatim_string_literal=\iVERBATIM_STRING
    }
}

"Converts a RedHat AST [[StringLiteral|JStringLiteral]] to a `ceylon.ast` [[StringLiteral]]."
throws (`class AssertionError`, "If the token type is neither `STRING_LITERAL` nor `VERBATIM_STRING`
                                 nor `ASTRING_LITERAL` nor `AVERBATIM_STRING`.")
shared StringLiteral stringLiteralToCeylon(JStringLiteral stringLiteral) {
    if (stringLiteral.mainToken.type == verbatim_string_literal || stringLiteral.mainToken.type == averbatim_string) {
        // verbatim
        return StringLiteral(stringLiteral.text[3 .. stringLiteral.text.size - 4], true);
    } else if (stringLiteral.mainToken.type == string_literal || stringLiteral.mainToken.type == astring_literal) {
        // regular
        return StringLiteral(stringLiteral.text[1 .. stringLiteral.text.size - 2], false);
    } else {
        throw AssertionError("Unknown token type ``stringLiteral.mainToken.type``");
    }
}

"Converts a RedHat AST [[StringLiteral|JStringLiteral]] with annotation token type
 (`ASTRING_LITERAL` or `AVERBATIM_STRING`) to a `ceylon.ast` [[StringLiteral]]."
throws (`class AssertionError`, "If the token type is neither `ASTRING_LITERAL` nor `AVERBATIM_STRING`.")
shared StringLiteral aStringLiteralToCeylon(JStringLiteral stringLiteral) {
    if (stringLiteral.mainToken.type == averbatim_string) {
        // verbatim
        return StringLiteral(stringLiteral.text[3 .. stringLiteral.text.size - 4], true);
    } else if (stringLiteral.mainToken.type == astring_literal) {
        // regular
        return StringLiteral(stringLiteral.text[1 .. stringLiteral.text.size - 2], false);
    } else {
        throw AssertionError("Unknown token type ``stringLiteral.mainToken.type``");
    }
}

"Compiles the given [[code]] for a String Literal
 into a [[StringLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `stringLiteral`)."
shared StringLiteral? compileStringLiteral(String code) {
    if (exists jStringLiteral = createParser(code).stringLiteral()) {
        return stringLiteralToCeylon(jStringLiteral);
    } else {
        return null;
    }
}
