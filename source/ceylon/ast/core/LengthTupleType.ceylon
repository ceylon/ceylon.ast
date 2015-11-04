"A length-based tuple type, that is,
 an [[element type|elementType]], followed by a [[length]] enclosed in brackets.
 
 `T[n]` is a shortcut for a tuple of exactly `n` `T` elements;
 for instance, `Integer[3]` is equivalent to `[Integer,Integer,Integer]`.
 
 Examples:
 
     Boolean[8]
     Integer[3]"
shared class LengthTupleType(elementType, length)
        extends TupleType() {
    
    "The element type."
    shared PrimaryType elementType;
    "The length.
     This may only be a decimal iteral;
     hexadecimal and binary lengths are illegal."
    shared IntegerLiteral length;
    
    assert (!(length.text.startsWith("$") || length.text.startsWith("#")));
    
    shared actual [PrimaryType, IntegerLiteral] children = [elementType, length];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformLengthTupleType(this);
    
    shared actual Boolean equals(Object that) {
        if (is LengthTupleType that) {
            return elementType == that.elementType && length == that.length;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (elementType.hash + 31 * length.hash);
    
    shared LengthTupleType copy(PrimaryType elementType = this.elementType, IntegerLiteral length = this.length) {
        value ret = LengthTupleType(elementType, length);
        copyExtraInfoTo(ret);
        return ret;
    }
}
