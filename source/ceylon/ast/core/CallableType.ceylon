"""A callable type.
   
   Examples:
   
       Integer(Integer,Integer)
       String(Character*)
       Ret(*Args)"""
shared class CallableType(returnType, argumentTypes)
        extends PrimaryType() {
    
    "The return type, that is, the first type parameter to `Callable`."
    shared PrimaryType returnType;
    "The argument types.
     
     This can be:
     - a [[TypeList]], forming the [[`typeList`|TupleType.typeList]]
       of the [[TupleType]] that’s the second type argument to `Callable`, or
     - a [[SpreadType]], where the [[inner type|SpreadType.type]]
       is the second type argument to `Callable`."
    shared TypeList|SpreadType argumentTypes;
    
    shared actual [PrimaryType, TypeList|SpreadType] children = [returnType, argumentTypes];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCallableType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCallableType(this);

    shared actual Boolean equals(Object that) {
        if (is CallableType that) {
            return returnType == that.returnType && argumentTypes == that.argumentTypes;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (returnType.hash + 31 * argumentTypes.hash);
    
    shared CallableType copy(PrimaryType returnType = this.returnType, TypeList|SpreadType argumentTypes = this.argumentTypes) {
        value ret = CallableType(returnType, argumentTypes);
        copyExtraInfoTo(ret);
        return ret;
    }
}
