import ceylon.ast.api {
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStringLiteral=StringLiteral
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        string_literal=\iSTRING_LITERAL,
        verbatim_string_literal=\iVERBATIM_STRING
    }
}

"Converts a RedHat AST [[StringLiteral|JStringLiteral]] to a `ceylon.ast` [[StringLiteral]]."
throws (`class AssertionError`, "If the token type is neither `STRING_LITERAL` nor `VERBATIM_STRING`.")
shared StringLiteral stringLiteralToCeylon(JStringLiteral stringLiteral) {
    if (stringLiteral.mainToken.type == verbatim_string_literal) {
        // verbatim
        return StringLiteral(stringLiteral.text[3 .. stringLiteral.text.size - 4], true);
    } else if (stringLiteral.mainToken.type == string_literal) {
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
