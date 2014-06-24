"A sequential type, that is, a shortcut for `TypeNameWithArguments(UIdentifier(\"Sequential\"), [elementType])`.
 
 Examples:
 
     String[]
     <String->Integer>[]"
shared class SequentialType(elementType)
        extends PrimaryType([elementType]) {
    
    "The element type."
    shared PrimaryType elementType;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSequentialType(this);
    
    shared actual Boolean equals(Object that) {
        if (is SequentialType that) {
            return elementType == that.elementType;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * elementType.hash;
    
    shared SequentialType copy(PrimaryType elementType = this.elementType) {
        value ret = SequentialType(elementType);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
