"An *integer literal* may be expressed in decimal (no prefix),
 hexadecimal (prefix ‘#’) or binary (prefix ‘$’) notation.
 Integer literals may be grouped with underscores, and may contain
 a magnitude."
shared class IntegerLiteral(text) extends Literal(text) {
    
    "The text of the literal, including prefixes, magnitude, etc."
    shared actual String text;
    shared Integer radix;
    shared Integer integer;
    
    // verify, parse
    switch (text.first)
    case ('$') { radix = 2; }
    case ('#') { radix = 16; }
    case ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9') { radix = 10; }
    case (null) {
        throw AssertionError("text must not be empty");
    }
    else {
        throw AssertionError("Unexpected first character '`` text.first else "" ``' of text, expected '$', '#', or digit");
    }
    assert (exists _integer = parseInteger(radix == 10 then text else text.rest, radix));
    integer = _integer;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIntegerLiteral(this);
    
    "Integer literals are considered equal iff their [[texts|text]] are equal.
     Two literals with the same [[integer]] values but different representations
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
