"A list-based tuple type (commonly just called a “tuple type”), that is,
 a [[type list|typeList]] enclosed in brackets.
 
 Examples:
 
     [String,Integer,Integer]
     [Float,Integer*]
     []"
shared class ListTupleType(typeList)
        extends TupleType() {
    
    "The types of this tuple type."
    shared TypeList typeList;
    
    shared actual [TypeList] children = [typeList];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformListTupleType(this);
    
    shared actual Boolean equals(Object that) {
        if (is ListTupleType that) {
            return typeList == that.typeList;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * typeList.hash;
    
    shared ListTupleType copy(TypeList typeList = this.typeList) {
        value ret = ListTupleType(typeList);
        copyExtraInfoTo(ret);
        return ret;
    }
}
