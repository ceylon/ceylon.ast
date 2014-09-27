"A key / index subscript expression,
 to select an element from a [[Correspondence]] expression.
 
 Examples:
 
     key
     offset + i"
see (`interface Correspondence`, `function Correspondence.get`)
shared class KeySubscript(key)
        extends Subscript() {
    
    "The key / index expression itself.
     
     See [[Correspondence.get.key]]."
    shared AddingExpression key;
    
    shared actual [AddingExpression] children = [key];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformKeySubscript(this);
    
    shared actual Boolean equals(Object that) {
        if (is KeySubscript that) {
            return key == that.key;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * key.hash;
    
    shared KeySubscript copy(AddingExpression key = this.key) {
        value ret = KeySubscript(key);
        copyExtraInfoTo(ret);
        return ret;
    }
}
