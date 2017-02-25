"An entry type, that is, a shortcut for `TypeNameWithTypeArguments(TypeName(UIdentifier(\"Entry\")), [left, right])`.
 
 Examples:
 
     String->Integer
     Printable&Persistent&Identifiable->Handle"
see (`class Entry`)
shared class EntryType(key, item)
        extends Type() {
    
    "The left, or “Key” type."
    //see (`given Entry.Key`)
    shared MainType key;
    "The right, or “Item” / “Value” type."
    //see (`given Entry.Item`)
    shared MainType item;
    
    shared actual [MainType, MainType] children = [key, item];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformEntryType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitEntryType(this);
    
    shared actual Boolean equals(Object that) {
        if (is EntryType that) {
            return key==that.key && item==that.item;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (key.hash + 31*item.hash);
    
    shared EntryType copy(MainType key = this.key, MainType item = this.item) {
        value ret = EntryType(key, item);
        copyExtraInfoTo(ret);
        return ret;
    }
}
