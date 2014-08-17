"A value iterator for a ‘`for`’ loop, enclosed in parentheses.
 
 Examples:
 
     (person in people)
     (char in text)"
shared class ValueIterator(variable, iterated)
        extends ForIterator() {
    
    "The variable that holds the current iteration result."
    shared UnspecifiedVariable variable;
    shared actual Expression iterated;
    
    shared actual [UnspecifiedVariable, Expression] children = [variable, iterated];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueIterator(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueIterator that) {
            return variable == that.variable && iterated == that.iterated;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (variable.hash + 31 * iterated.hash);
    
    shared ValueIterator copy(UnspecifiedVariable variable = this.variable, Expression iterated = this.iterated) {
        value ret = ValueIterator(variable, iterated);
        copyExtraInfoTo(ret);
        return ret;
    }
}
