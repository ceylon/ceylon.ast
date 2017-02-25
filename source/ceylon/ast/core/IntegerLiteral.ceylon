"An *integer literal* may be expressed in decimal (no prefix),
 hexadecimal (prefix ‘#’) or binary (prefix ‘$’) notation.
 Integer literals may be grouped with underscores, and may contain
 a magnitude."
shared class IntegerLiteral(text) extends Literal(text) {
    
    "The text of the literal, including prefixes, magnitude, etc."
    shared actual String text;
    
    assert (!text.empty,
        text.every("$#0123456789abcdefABCDEFkMGTP_".contains),
        text.rest.every("0123456789abcdefABCDEFkMGTP_".contains));
    // TODO more precise parsing?
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIntegerLiteral(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitIntegerLiteral(this);
    
    "Integer literals are considered equal iff their [[texts|text]] are equal.
     Two literals with the same integer values but different representations
     (grouping, magnitude, leading zeroes, and/or radix differ) are considered different."
    shared actual Boolean equals(Object that) {
        if (is IntegerLiteral that) {
            return text == that.text;
        } else {
            return false;
        }
    }
    
    hash => text.hash;
    
    shared IntegerLiteral copy(String text = this.text) {
        value ret = IntegerLiteral(text);
        copyExtraInfoTo(ret);
        return ret;
    }
}
