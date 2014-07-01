"A sequential type, that is, a shortcut for `TypeNameWithTypeArguments(UIdentifier(\"Sequential\"), [elementType])`.
 
 Examples:
 
     String[]
     <String->Integer>[]"
shared class SequentialType(elementType)
        extends PrimaryType() {
    
    "The element type."
    shared PrimaryType elementType;
    
    shared actual [PrimaryType] children = [elementType];
    
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
