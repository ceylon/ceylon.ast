"A destructuring statement, that is,
 a [[‘`value`’ modifier|valueModifier]], followed by a [[pattern]] and a [[specifier]],
 and terminated by a semicolon.
 
 Examples:
 
     value name->[lat, lon] = observatories.first;
     value [x,y,z] = pos;"
shared class Destructure(pattern, specifier, valueModifier = ValueModifier())
        extends Statement() {
    
    "The pattern to be instantiated.
     
     (This may not be a simple [[VariablePattern]]
     because this could be ambiguous
     with a regular [[ValueDefinition]].)"
    shared TuplePattern|EntryPattern pattern;
    "The specifier that’s assigned to the [[pattern]]."
    shared Specifier specifier;
    "The ‘`value`’ modifier."
    shared ValueModifier valueModifier;
    
    shared actual [ValueModifier, TuplePattern|EntryPattern, Specifier] children = [valueModifier, pattern, specifier];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDestructure(this);
    
    shared actual Boolean equals(Object that) {
        if (is Destructure that) {
            return pattern == that.pattern && specifier == that.specifier && valueModifier == that.valueModifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (pattern.hash + 31 * (specifier.hash + 31 * valueModifier.hash));
    
    shared Destructure copy(TuplePattern|EntryPattern pattern = this.pattern, Specifier specifier = this.specifier, ValueModifier valueModifier = this.valueModifier) {
        value ret = Destructure(pattern, specifier, valueModifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
