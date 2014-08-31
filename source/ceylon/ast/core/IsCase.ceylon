"A ‘`case`’ item to test the type of the `switch` expression.
 
 Examples:
 
     is String
     is Persistent&Serializable
     is Integer|Float"
shared class IsCase(type)
        extends CaseItem() {
    
    "The type that is tested."
    shared Type type;
    
    shared actual [Type] children = [type];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIsCase(this);
    
    shared actual Boolean equals(Object that) {
        if (is IsCase that) {
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * type.hash;
    
    shared IsCase copy(Type type = this.type) {
        value ret = IsCase(type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
