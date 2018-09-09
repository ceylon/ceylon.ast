import org.antlr.runtime {
    CommonToken
}

"A simple [[TokenFactory]] implementation.
 
 The [[token index|CommonToken.tokenIndex]]
 and [[start index|CommonToken.startIndex]]
 is incremented with each token."
shared class SimpleTokenFactory(initialIndex = 0, initialStartIndex = 0) satisfies TokenFactory {
    
    "The [[token index|CommonToken.tokenIndex]] of the first token."
    Integer initialIndex;
    variable Integer index = initialIndex;
    
    "The [[start index|CommonToken.startIndex]] of the first token."
    Integer initialStartIndex;
    variable Integer startIndex = initialStartIndex;
    
    shared actual CommonToken token(String text, Integer type) {
        value token = CommonToken(type, text);
        token.tokenIndex = index++;
        token.startIndex = startIndex;
        token.stopIndex = (startIndex += text.size) - 1;
        token.charPositionInLine = 0; // initialized to -1
        return token;
    }
}
