"An *integer literal* may be expressed in decimal (no prefix),
 hexadecimal (prefix ‘#’) or binary (prefix ‘$’) notation.
 Integer literals may be grouped with underscores, and may contain
 a magnitude."
shared class IntegerLiteral(text) extends Expression([]) /* TODO extend Literal */ {
    
    "The text of the literal, including prefixes, magnitude, etc."
    shared String text;
    shared Integer radix;
    shared Integer integer;
    
    // verify, parse
    switch (text.first)
    case ('$') { radix = 2; }
    case ('#') { radix = 16; }
    case ('0') { radix = 10; }
    case ('1') { radix = 10; }
    case ('2') { radix = 10; }
    case ('3') { radix = 10; }
    case ('4') { radix = 10; }
    case ('5') { radix = 10; }
    case ('6') { radix = 10; }
    case ('7') { radix = 10; }
    case ('8') { radix = 10; }
    case ('9') { radix = 10; }
    case (null) {
        throw AssertionError("text must not be empty");
    }
    else {
        throw AssertionError("Unexpected first character '``text.first else ""``' of text, expected '$', '#', or digit");
    }
    assert (exists _integer = parseInteger(radix == 10 then text else text.rest, radix));
    integer = _integer;
    
    visit(Visitor visitor) => visitor.visitIntegerLiteral(this);
    edit(Editor editor) => editor.editIntegerLiteral(this);
    
    toCeylonExpression() => "IntegerLiteral(\"``text``\")";
    
    "Integer literals are considered equal iff their [[texts|text]] are equal.
     Two literals with the same [[integer]] values but different representations
     (grouping, magnitude, and/or radix differ) are considered different."
    shared actual Boolean equals(Object other) {
        if (is IntegerLiteral other) {
            return text == other.text;
        }
        else {
            return false;
        }
    }
    
    hash => text.hash;
    
    shared IntegerLiteral copy(String text = this.text)
            => IntegerLiteral(text);
}
