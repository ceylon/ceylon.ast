import ceylon.ast {
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
        lidentifier=\iLIDENTIFIER
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

"Converts a `ceylon.ast` [[Identifier]] to a RedHat AST [[Identifier|JIdentifier]]."
shared JIdentifier identifierFromCeylon(Identifier identifier, TokenFactory tokens) {
    switch (identifier)
    case (is LIdentifier) {
        return JIdentifier(tokens.token(identifier.name, lidentifier, identifier.usePrefix then identifier.name.size + 2 else identifier.name.size));
    }
    case (is UIdentifier) {
        return JIdentifier(tokens.token(identifier.name, uidentifier, identifier.usePrefix then identifier.name.size + 2 else identifier.name.size));
    }
}
