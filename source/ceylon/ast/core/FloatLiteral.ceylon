"A *floating point literal* is distinguished from an
 [[*integer literal*|IntegerLiteral]] by the presence of
 fractional digits or a fractional magnitude."
shared class FloatLiteral(text) extends Literal(text) {
    
    "The text of the literal, including exponent, magnitude, etc."
    shared actual String text;
    shared Float float;
    
    // verify, parse
    switch (text.first)
    case ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9') {/* okay, do nothing */}
    case (null) {
        throw AssertionError("text must not be empty");
    }
    case ('+' | '-') {
        throw AssertionError("text must not include sign; wrap in NegationOperation (-) or IdentityOperation (+) instead.");
    }
    else {
        throw AssertionError("Unexpected first character '`` text.first else "" ``' of text, expected digit");
    }
    assert (exists _float = parseFloat(text));
    float = _float;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFloatLiteral(this);
    
    "Float literals are considered equal iff their [[texts|text]] are equal.
     Two literals with the same [[float]] values but different representations
     (grouping, magnitude, leading and/or trailing zeroes, and/or radix differ) are considered different."
    shared actual Boolean equals(Object other) {
        if (is FloatLiteral other) {
            return text == other.text;
        } else {
            return false;
        }
    }
    
    hash => text.hash;
    
    shared FloatLiteral copy(String text = this.text) {
        value ret = FloatLiteral(text);
        copyExtraInfoTo(ret);
        return ret;
    }
}
