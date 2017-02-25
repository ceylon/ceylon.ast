"An entry pattern, that is,
 a [[key]] pattern and an [[item]] pattern, separated by an entry operator.
 
 Examples:
 
     id->person
     name->[lat, lon]"
see (`class Entry`)
shared class EntryPattern(key, item)
        extends Pattern() {
    
    "The key pattern."
    see (`value Entry.key`)
    shared VariablePattern|TuplePattern key;
    "The item pattern."
    see (`value Entry.item`)
    shared VariablePattern|TuplePattern item;
    
    shared actual [VariablePattern|TuplePattern, VariablePattern|TuplePattern] children = [key, item];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEntryPattern(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitEntryPattern(this);
    
    shared actual Boolean equals(Object that) {
        if (is EntryPattern that) {
            return key==that.key && item==that.item;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (key.hash + 31*item.hash);
    
    shared EntryPattern copy(VariablePattern|TuplePattern key = this.key, VariablePattern|TuplePattern item = this.item) {
        value ret = EntryPattern(key, item);
        copyExtraInfoTo(ret);
        return ret;
    }
}
