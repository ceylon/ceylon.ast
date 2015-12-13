"A tuple type.
 
 Examples:
 
     [String,Integer,Integer]
     [Float,Integer*]
     []"
shared class TupleType(typeList)
        extends PrimaryType() {
    
    "The types of this tuple type."
    shared TypeList typeList;
    
    shared actual [TypeList] children = [typeList];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTupleType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTupleType(this);

    shared actual Boolean equals(Object that) {
        if (is TupleType that) {
            return typeList == that.typeList;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * typeList.hash;
    
    shared TupleType copy(TypeList typeList = this.typeList) {
        value ret = TupleType(typeList);
        copyExtraInfoTo(ret);
        return ret;
    }
}
