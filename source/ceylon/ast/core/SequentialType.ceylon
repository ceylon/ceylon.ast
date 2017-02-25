"A sequential type, that is, a [[primary type|elementType]], followed by an opening bracket,
 optionally an integer [[length]], and a closing bracket.
 
 If the length is absent, this is a shortcut for `Sequential<ElementType>`;
 with the length present, it is a shortcut for a tuple of `length` elements of the element type.
 
 Examples:
 
     String[]
     <String->Integer>[]
     Boolean[2] // shortcut for [Boolean,Boolean]"
shared class SequentialType(elementType, length = null)
        extends PrimaryType() {
    
    "The element type."
    shared PrimaryType elementType;
    
    "The length, if present.
     
     Note: per spec, this must be a decimal literal (not a binary or hexadecimal one),
     but this is not enforced by `ceylon.ast`."
    shared IntegerLiteral? length;
    
    shared actual [PrimaryType, IntegerLiteral=] children;
    if (exists length) {
        children = [elementType, length];
    } else {
        children = [elementType];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSequentialType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSequentialType(this);
    
    shared actual Boolean equals(Object that) {
        if (is SequentialType that) {
            if (exists length) {
                if (exists length_ = that.length) {
                    if (length != length_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.length exists) {
                return false;
            }
            return elementType == that.elementType;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * elementType.hash;
    
    shared SequentialType copy(PrimaryType elementType = this.elementType, IntegerLiteral? length = this.length) {
        value ret = SequentialType(elementType, length);
        copyExtraInfoTo(ret);
        return ret;
    }
}
