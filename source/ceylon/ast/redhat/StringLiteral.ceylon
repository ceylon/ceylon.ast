import ceylon.ast.core {
    Node,
    StringLiteral
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
import org.antlr.runtime {
    CommonToken
}

"""Strips quotes and leading indentation from a string literal.
   
   For example,
   
           "Hello,
            World"
   
   is turned into
   
       Hello,
       World"""
String stripStringLiteral(CommonToken token, Boolean isVerbatim) {
    // value isVerbatim = token.type == verbatim_string_literal || token.type == averbatim_string;
    value quoteLength = isVerbatim then 3 else 1;
    Integer toStrip = token.charPositionInLine + quoteLength;
    StringBuilder ret = StringBuilder();
    value text = token.text[quoteLength : token.text.size - 2 * quoteLength];
    value lines = text.lines;
    if (exists firstLine = lines.first) {
        ret.append(firstLine);
        for (line in lines.rest) {
            ret.appendNewline();
            value parts = line.slice(toStrip);
            "Multiline string content should align with start of string"
            assert (parts[0].every(Character.whitespace));
            ret.append(parts[1]);
        }
    }
    return ret.string;
}

"Converts a RedHat AST [[StringLiteral|JStringLiteral]] to a `ceylon.ast` [[StringLiteral]]."
throws (`class AssertionError`, "If the token type is neither `STRING_LITERAL` nor `VERBATIM_STRING`
                                 nor `ASTRING_LITERAL` nor `AVERBATIM_STRING`.")
shared StringLiteral stringLiteralToCeylon(JStringLiteral stringLiteral, Anything(JNode,Node) update = noop) {
    StringLiteral result;
    assert (is CommonToken token = stringLiteral.mainToken);
    if (token.type == verbatim_string_literal || token.type == averbatim_string) {
        // verbatim
        result = StringLiteral(stripStringLiteral(token, true), true);
    } else if (token.type == string_literal || token.type == astring_literal) {
        // regular
        result = StringLiteral(stripStringLiteral(token, false), false);
    } else {
        throw AssertionError("Unknown token type ``stringLiteral.mainToken.type``");
    }
    update(stringLiteral, result);
    return result;
}

"Converts a RedHat AST [[StringLiteral|JStringLiteral]] with annotation token type
 (`ASTRING_LITERAL` or `AVERBATIM_STRING`) to a `ceylon.ast` [[StringLiteral]]."
throws (`class AssertionError`, "If the token type is neither `ASTRING_LITERAL` nor `AVERBATIM_STRING`.")
shared StringLiteral aStringLiteralToCeylon(JStringLiteral stringLiteral, Anything(JNode,Node) update = noop) {
    assert (is CommonToken token = stringLiteral.mainToken);
    StringLiteral result;
    if (token.type == averbatim_string) {
        // verbatim
        result = StringLiteral(stripStringLiteral(token, true), true);
    } else if (token.type == astring_literal) {
        // regular
        result = StringLiteral(stripStringLiteral(token, false), false);
    } else {
        throw AssertionError("Unknown token type ``stringLiteral.mainToken.type``");
    }
    update(stringLiteral, result);
    return result;
}

"Compiles the given [[code]] for a String Literal
 into a [[StringLiteral]] using the Ceylon compiler
 (more specifically, the rule for a `stringLiteral`)."
shared StringLiteral? compileStringLiteral(String code, Anything(JNode,Node) update = noop) {
    if (exists jStringLiteral = createParser(code).stringLiteral()) {
        return stringLiteralToCeylon(jStringLiteral, update);
    } else {
        return null;
    }
}
