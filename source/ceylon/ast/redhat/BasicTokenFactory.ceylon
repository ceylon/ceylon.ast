import org.antlr.runtime {
    CommonToken
}

"A very basic [[TokenFactory]] implementation.
 
 The tokens will all have the same [[token index|CommonToken.tokenIndex]],
 [[start index|CommonToken.startIndex]]
 and [[`charPositionInLine`|CommonToken.charPositionInLine]];
 this factory is therefore likely not suitable for any context
 where the returned tokens will actually be *used*.
 However, it might be useful if you know that the tokens won’t be used,
 and you just need any token factory."
shared class BasicTokenFactory() satisfies TokenFactory {
    shared actual CommonToken token(String text, Integer type)
            => CommonToken(type, text);
}
