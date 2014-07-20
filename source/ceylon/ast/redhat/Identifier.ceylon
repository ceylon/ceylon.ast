import ceylon.ast.core {
    Identifier,
    LIdentifier,
    UIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIdentifier=Identifier
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        uidentifier=\iUIDENTIFIER,
        lidentifier=\iLIDENTIFIER,
        pidentifier=\iPIDENTIFIER
    }
}
import org.antlr.runtime {
    CommonToken
}

"Converts a RedHat AST [[Identifier|JIdentifier]] to a `ceylon.ast` [[Identifier]]."
throws (`class AssertionError`, "If the token type is neither `LIDENTIFIER` nor `UIDENTIFIER`.")
shared Identifier identifierToCeylon(JIdentifier identifier) {
    "Need CommonToken to get length of token (!= text’s length for \\iCONSTANT)"
    assert (is CommonToken token = identifier.mainToken);
    value type = token.type;
    if (type == lidentifier) {
        return LIdentifier(identifier.text, identifier.text.size != token.stopIndex - token.startIndex);
    } else if (type == uidentifier) {
        return UIdentifier(identifier.text, identifier.text.size != token.stopIndex - token.startIndex);
    } else {
        throw AssertionError("Token type of Identifier token must be LIDENTIFIER (``lidentifier``) or UIDENTIFIER (``uidentifier``)");
    }
}

"Converts a RedHat AST [[Identifier|JIdentifier]] to a `ceylon.ast` [[LIdentifier]]."
throws (`class AssertionError`, "If the token type is not `LIDENTIFIER`.")
shared LIdentifier lIdentifierToCeylon(JIdentifier identifier) {
    "Need CommonToken to get length of token (!= text’s length for \\iCONSTANT)"
    assert (is CommonToken token = identifier.mainToken);
    "Must be LIDENTIFIER token"
    assert (token.type == lidentifier);
    return LIdentifier(identifier.text, identifier.text.size != token.stopIndex - token.startIndex);
}

"Converts a RedHat AST [[Identifier|JIdentifier]] to a `ceylon.ast` [[UIdentifier]]."
throws (`class AssertionError`, "If the token type is not `UIDENTIFIER`.")
shared UIdentifier uIdentifierToCeylon(JIdentifier identifier) {
    "Need CommonToken to get length of token (!= text’s length for \\iCONSTANT)"
    assert (is CommonToken token = identifier.mainToken);
    "Must be UIDENTIFIER token"
    assert (token.type == uidentifier);
    return UIdentifier(identifier.text, identifier.text.size != token.stopIndex - token.startIndex);
}

"Converts a RedHat AST [[Identifier|JIdentifier]] with token type `PIDENTIFIER` to a `ceylon.ast` [[LIdentifier]].
 
 There’s no syntactical difference between package and lowercase identifiers, but they have different token types."
throws (`class AssertionError`, "If the token type is not `PIDENTIFIER`.")
shared LIdentifier pIdentifierToCeylon(JIdentifier identifier) {
    "Need CommonToken to get length of token (!= text’s length for \\iCONSTANT)"
    assert (is CommonToken token = identifier.mainToken);
    "Must be PIDENTIFIER token"
    assert (token.type == pidentifier);
    return LIdentifier(identifier.text, identifier.text.size != token.stopIndex - token.startIndex);
}

"Compiles the given [[code]] for an Identifier
 into an [[Identifier]] using the Ceylon compiler
 (more specifically, the rule for an Import Name)."
shared Identifier? compileIdentifier(String code) {
    if (exists jidentifier = createParser(code).importName()) {
        return identifierToCeylon(jidentifier);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for a Lowercase Identifier
 into an [[LIdentifier]] using the Ceylon compiler
 (more specifically, the rule for a Member Name)."
shared LIdentifier? compileLIdentifier(String code) {
    if (exists jidentifier = createParser(code).memberName()) {
        return lIdentifierToCeylon(jidentifier);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for an Uppercase Identifier
 into a [[UIdentifier]] using the Ceylon compiler
 (more specifically, the rule for a Type Name)."
shared UIdentifier? compileUIdentifier(String code) {
    if (exists jidentifier = createParser(code).typeName()) {
        return uIdentifierToCeylon(jidentifier);
    } else {
        return null;
    }
}

"Compiles the given [[code]] for a Package Identifier
 into an [[LIdentifier]] using the Ceylon compiler
 (more specifically, the rule for a `packageName`)."
shared LIdentifier? compilePIdentifier(String code) {
    if (exists jidentifier = createParser(code).packageName()) {
        return pIdentifierToCeylon(jidentifier);
    } else {
        return null;
    }
}
