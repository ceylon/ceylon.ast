"A *floating point literal* is distinguished from an
 [[*integer literal*|IntegerLiteral]] by the presence of
 fractional digits or a fractional magnitude."
shared class FloatLiteral(text) extends Literal(text) {
    
    "The text of the literal, including exponent, magnitude, etc."
    shared actual String text;
    
    assert (!text.empty,
        text.every("0123456789.eE+-kMGTPmunpf_".contains),
        !(text.first else '0') in "+-");
    // TODO more precise parsing?
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFloatLiteral(this);
    
    "Float literals are considered equal iff their [[texts|text]] are equal.
     Two literals with the same float values but different representations
     (grouping, magnitude, leading and/or trailing zeroes, and/or radix differ) are considered different."
    shared actual Boolean equals(Object that) {
        if (is FloatLiteral that) {
            return text == that.text;
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
