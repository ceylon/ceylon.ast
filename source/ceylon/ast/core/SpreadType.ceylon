"A spread type.
 
 Used in a [[CallableType]].
 
 Examples:
 
     *Args
     *[String,Integer]"
shared class SpreadType(type)
        extends TypeIsh() {
    
    "The inner type."
    shared Type type;
    
    shared actual [Type] children = [type];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSpreadType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitSpreadType(this);

    shared actual Boolean equals(Object that) {
        if (is SpreadType that) {
            return type == that.type;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * type.hash;
    
    shared SpreadType copy(Type type = this.type) {
        value ret = SpreadType(type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
