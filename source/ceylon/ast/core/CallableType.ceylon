"""A callable type, that is, a shortcut for
   `SimpleType(TypeNameWithArguments(UIdentifier("Callable"), [returnType, TupleType(argumentTypes)]))`.
   
   Examples:
   
       Integer(Integer,Integer)
       String(Character*)"""
shared class CallableType(returnType, argumentTypes)
        extends PrimaryType() {
    
    "The return type, that is, the first type parameter to `Callable`."
    shared PrimaryType returnType;
    "The argument types, that is, the [[typeList|TupleType.typeList]]
     of the [[TupleType]] that’s the second type parameter to `Callable`."
    shared TypeList argumentTypes;
    
    shared actual [PrimaryType, TypeList] children = [returnType, argumentTypes];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCallableType(this);
    
    shared actual Boolean equals(Object that) {
        if (is CallableType that) {
            return returnType == that.returnType && argumentTypes == that.argumentTypes;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (returnType.hash + 31 * argumentTypes.hash);
    
    shared CallableType copy(PrimaryType returnType = this.returnType, TypeList argumentTypes = this.argumentTypes) {
        value ret = CallableType(returnType, argumentTypes);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
