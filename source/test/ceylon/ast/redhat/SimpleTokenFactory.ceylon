import org.antlr.runtime {
    CommonToken
}
import ceylon.ast.redhat {
    TokenFactory
}

"A simple [[TokenFactory]].
 Should not be used to construct any AST, as the tokens will not be ordered
 (their `startIndex` and `tokenIndex` are always 0)."
class SimpleTokenFactory() satisfies TokenFactory {
    shared actual CommonToken token(String text, Integer type, Integer length) {
        value token = CommonToken(type, text);
        token.startIndex = 0;
        token.stopIndex = length;
        token.charPositionInLine = 0; // initialized to -1
        return token;
    }
}
