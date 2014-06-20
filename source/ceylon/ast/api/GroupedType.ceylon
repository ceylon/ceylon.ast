"A type, grouped in angle brackets to resolve lexical ambiguity:
 
     String->String[]
 
 is parsed as
 
     Entry<String,String[]>
 
 To get
 
     Entry<String,String>[]
 
 you need to write
 
     <String->String>[]"
shared class GroupedType(type)
        extends PrimaryType([type]) {
    
    "The inner / wrapped type."
    shared Type type;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformGroupedType(this);
    
    shared actual Boolean equals(Object that) {
        if (is GroupedType that) {
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash => 31 * type.hash;
    
    shared GroupedType copy(Type type = this.type)
            => GroupedType(type);
}
