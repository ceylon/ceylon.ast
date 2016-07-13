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
        string_end=\iSTRING_END,
        string_mid=\iSTRING_MID,
        string_start=\iSTRING_START,
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
       World
   
   This function also detecs if the literal was already visited by
   the RedHat compiler’s `LiteralVisitor`, and doesn’t do anything
   in that case.
   
   [[column]] can be used to provide a different amount of space to strip;
   this is necessary for string templates, where all parts are
   aligned to the firts part’s column."""
String stripStringLiteral(JStringLiteral literal, Integer? column = null) {
    if (literal.text != literal.mainToken.text) {
        // this already went through LiteralVisitor, nothing to do
        return literal.text;
    }
    Integer startQuoteLength;
    Integer stopQuoteLength;
    value type = literal.mainToken.type;
    if (type == string_literal || type == astring_literal) {
        startQuoteLength = 1;
        stopQuoteLength = 1;
    } else if (type == verbatim_string_literal || type == averbatim_string) {
        startQuoteLength = 3;
        stopQuoteLength = 3;
    } else if (type == string_start) {
        startQuoteLength = 1;
        stopQuoteLength = 2;
    } else if (type == string_mid) {
        startQuoteLength = 2;
        stopQuoteLength = 2;
    } else if (type == string_end) {
        startQuoteLength = 2;
        stopQuoteLength = 1;
    } else {
        throw AssertionError("Unknown token type ``type``");
    }
    value toStrip = column else literal.mainToken.charPositionInLine + startQuoteLength;
    StringBuilder ret = StringBuilder();
    value text = literal.mainToken.text[startQuoteLength : literal.mainToken.text.size - startQuoteLength - stopQuoteLength];
    value lines = text.lines;
    ret.append(lines.first);
    for (line in lines.rest) {
        ret.appendNewline();
        value parts = line.slice(toStrip);
        "Multiline string content should align with start of string"
        assert (parts[0].every(Character.whitespace));
        ret.append(parts[1]);
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
        result = StringLiteral(stripStringLiteral(stringLiteral), true);
    } else if (token.type == string_literal || token.type == astring_literal) {
        // regular
        result = StringLiteral(stripStringLiteral(stringLiteral), false);
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
        result = StringLiteral(stripStringLiteral(stringLiteral), true);
    } else if (token.type == astring_literal) {
        // regular
        result = StringLiteral(stripStringLiteral(stringLiteral), false);
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
