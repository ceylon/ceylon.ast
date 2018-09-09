import ceylon.ast.core {
    Identifier,
    LIdentifier,
    Node,
    UIdentifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIdentifier=Identifier
    }
}
import org.eclipse.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        uidentifier=\iUIDENTIFIER,
        lidentifier=\iLIDENTIFIER,
        pidentifier=\iPIDENTIFIER,
        aidentifier=\iAIDENTIFIER
    }
}
import org.antlr.runtime {
    CommonToken
}

"Converts a RedHat AST [[Identifier|JIdentifier]] to a `ceylon.ast` [[Identifier]]."
throws (`class AssertionError`, "If the token type is neither `LIDENTIFIER` nor `UIDENTIFIER`.")
shared Identifier identifierToCeylon(JIdentifier identifier, Anything(JNode, Node) update = noop) {
    assert (exists text = identifier.text);
    Identifier result;
    if (text.startsWith("""\I""")) {
        result = UIdentifier.internal { text[2...]; usePrefix = true; };
    } else if (text.startsWith("""\i""")) {
        result = LIdentifier.internal { text[2...]; usePrefix = true; };
    } else if (text.first?.uppercase else false) {
        result = UIdentifier.internal(text);
    } else {
        result = LIdentifier.internal(text);
    }
    update(identifier, result);
    return result;
}

"Converts a RedHat AST [[Identifier|JIdentifier]] to a `ceylon.ast` [[LIdentifier]]."
throws (`class AssertionError`, "If the token type is not `LIDENTIFIER`.")
shared LIdentifier lIdentifierToCeylon(JIdentifier identifier, Anything(JNode, Node) update = noop) {
    if (exists token = identifier.mainToken) {
        "Must be LIDENTIFIER token"
        assert (token.type == lidentifier);
    }
    assert (is LIdentifier result = identifierToCeylon(identifier, update));
    return result;
}

"Converts a RedHat AST [[Identifier|JIdentifier]] to a `ceylon.ast` [[UIdentifier]]."
throws (`class AssertionError`, "If the token type is not `UIDENTIFIER`.")
shared UIdentifier uIdentifierToCeylon(JIdentifier identifier, Anything(JNode, Node) update = noop) {
    if (exists token = identifier.mainToken) {
        "Must be UIDENTIFIER token"
        assert (token.type == uidentifier);
    }
    assert (is UIdentifier result = identifierToCeylon(identifier, update));
    return result;
}

"Converts a RedHat AST [[Identifier|JIdentifier]] with token type `PIDENTIFIER` to a `ceylon.ast` [[LIdentifier]].
 
 There’s no syntactical difference between package and lowercase identifiers, but they have different token types."
throws (`class AssertionError`, "If the token type is not `PIDENTIFIER`.")
shared LIdentifier pIdentifierToCeylon(JIdentifier identifier, Anything(JNode, Node) update = noop) {
    "Must be PIDENTIFIER token"
    assert (identifier.mainToken.type == pidentifier);
    assert (is LIdentifier result = identifierToCeylon(identifier, update));
    return result;
}

"Converts a RedHat AST [[Identifier|JIdentifier]] with token type `AIDENTIFIER` to a `ceylon.ast` [[LIdentifier]].
 
 There’s no syntactical difference between annotation and lowercase identifiers, but they have different token types."
throws (`class AssertionError`, "If the token type is not `AIDENTIFIER`.")
shared LIdentifier aIdentifierToCeylon(JIdentifier identifier, Anything(JNode, Node) update = noop) {
    "Must be AIDENTIFIER token"
    assert (identifier.mainToken.type == aidentifier);
    assert (is LIdentifier result = identifierToCeylon(identifier, update));
    return result;
}

"Parses the given [[code]] for an Identifier
 into an [[Identifier]] using the Ceylon compiler
 (more specifically, the rule for an Import Name)."
shared Identifier? parseIdentifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jidentifier = createParser(code).importName()) {
        return identifierToCeylon(jidentifier, update);
    } else {
        return null;
    }
}

"Parses the given [[code]] for a Lowercase Identifier
 into an [[LIdentifier]] using the Ceylon compiler
 (more specifically, the rule for a Member Name)."
shared LIdentifier? parseLIdentifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jidentifier = createParser(code).memberName()) {
        return lIdentifierToCeylon(jidentifier, update);
    } else {
        return null;
    }
}

"Parses the given [[code]] for an Uppercase Identifier
 into a [[UIdentifier]] using the Ceylon compiler
 (more specifically, the rule for a Type Name)."
shared UIdentifier? parseUIdentifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jidentifier = createParser(code).typeName()) {
        return uIdentifierToCeylon(jidentifier, update);
    } else {
        return null;
    }
}

"Parses the given [[code]] for a Package Identifier
 into an [[LIdentifier]] using the Ceylon compiler
 (more specifically, the rule for a `packageName`)."
shared LIdentifier? parsePIdentifier(String code, Anything(JNode, Node) update = noop) {
    if (exists jidentifier = createParser(code).packageName()) {
        return pIdentifierToCeylon(jidentifier, update);
    } else {
        return null;
    }
}
