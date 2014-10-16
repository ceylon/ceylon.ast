import org.antlr.runtime {
    CommonToken,
    TokenSource,
    Token
}
import ceylon.collection {
    LinkedList,
    Queue
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer
}

"A [[TokenFactory]] implementation that also serves as a [[TokenSource]],
 from which some [[org.antlr.runtime::TokenStream]] may be constructed.
 
 The [[token index|CommonToken.tokenIndex]]
 and [[start index|CommonToken.startIndex]]
 is incremented with each token.
 In addition, the tokens are stored in a queue, from which they may be taken
 with [[nextToken]].
 
 Usage of this class is intended to be separated into two phases:
 1. Create tokens with the [[token]] method;
 2. Obtain tokens with the [[nextToken]] method.
 
 I. e., you should only construct a token stream from this token source
 when you’re done with using it as a token factory.
 If you mix the two usages, the token source might return an EOF token
 too early."
shared class TokenSourceTokenFactory(initialIndex = 0, initialStartIndex = 0)
        satisfies TokenFactory & TokenSource {
    
    "The [[token index|CommonToken.tokenIndex]] of the first token."
    Integer initialIndex;
    variable Integer index = initialIndex;
    
    "The [[start index|CommonToken.startIndex]] of the first token."
    Integer initialStartIndex;
    variable Integer startIndex = initialStartIndex;
    
    Queue<CommonToken> tokens = LinkedList<CommonToken>();
    
    shared actual CommonToken token(String text, Integer type, Integer length) {
        value token = CommonToken(type, text);
        token.tokenIndex = index++;
        token.startIndex = startIndex;
        token.stopIndex = (startIndex += length) - 1;
        token.charPositionInLine = 0; // initialized to -1
        tokens.offer(token);
        return token;
    }
    
    Token eof => token("", CeylonLexer.\iEOF);
    
    "Returns the next token, or an EOF token if there is no next token."
    shared actual Token nextToken()
            => tokens.accept() else eof;
    
    shared actual String sourceName => "TokenSourceTokenFactory(``initialIndex``, ``initialStartIndex``)";
}
