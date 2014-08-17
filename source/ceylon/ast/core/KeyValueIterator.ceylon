"A key→value iterator for a ‘`for`’ loop, enclosed in parentheses.
 
 Examples:
 
     (name->person in peopleByName)
     (index->char in text.indexed)"
shared class KeyValueIterator(keyVariable, valueVariable, iterated)
        extends ForIterator() {
    
    "The variable that holds the [[key|Entry.key]] of the current iteration result."
    shared UnspecifiedVariable keyVariable;
    "The variable that holds the [[item|Entry.item]] / value of the current iteration result."
    shared UnspecifiedVariable valueVariable;
    shared actual Expression iterated;
    
    shared actual [UnspecifiedVariable, UnspecifiedVariable, Expression] children = [keyVariable, valueVariable, iterated];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformKeyValueIterator(this);
    
    shared actual Boolean equals(Object that) {
        if (is KeyValueIterator that) {
            return keyVariable == that.keyVariable && valueVariable == that.valueVariable && iterated == that.iterated;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (keyVariable.hash + 31 * (valueVariable.hash + 31 * iterated.hash));
    
    shared KeyValueIterator copy(UnspecifiedVariable keyVariable = this.keyVariable, UnspecifiedVariable valueVariable = this.valueVariable, Expression iterated = this.iterated) {
        value ret = KeyValueIterator(keyVariable, valueVariable, iterated);
        copyExtraInfoTo(ret);
        return ret;
    }
}
