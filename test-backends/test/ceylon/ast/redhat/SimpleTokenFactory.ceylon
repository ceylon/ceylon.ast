import org.antlr.runtime {
    CommonToken
}
import ceylon.ast.redhat {
    TokenFactory
}

"A simple [[TokenFactory]].
 Should not be used to construct any AST, as the tokens will not be ordered
 (their `startIndex` and `tokenIndex` are always `null`)."
class SimpleTokenFactory() satisfies TokenFactory {
    shared actual CommonToken token(String text, Integer type, Integer length) {
        value token = CommonToken(type, text);
        token.startIndex = 0;
        token.stopIndex = length;
        return token;
    }
}
