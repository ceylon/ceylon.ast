"A variadic pattern variable.
 
 These only occur within [[tuple patterns|TuplePattern]].
 
 Examples:
 
     *others
     String *rest"
shared class VariadicVariable(name, type = null)
        extends Variable() {
    
    shared actual MemberName name;
    shared actual UnionType? type;
    "A variadic variable has no specifier."
    shared actual Null specifier => null;
    
    //shared actual [UnionType, LIdentifier]|[LIdentifier] children;
    // TODO use the above more precise type when backend bug is fixed
    shared actual Node[] children;
    if (exists type) {
        children = [type, name];
    } else {
        children = [name];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformVariadicVariable(this);
    
    shared actual Boolean equals(Object that) {
        if (is VariadicVariable that) {
            if (exists type) {
                if (exists type_ = that.type) {
                    if (type != type_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.type exists) {
                return false;
            }
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (type?.hash else 0));
    
    shared VariadicVariable copy(MemberName name = this.name, UnionType? type = this.type) {
        value ret = VariadicVariable(name, type);
        copyExtraInfoTo(ret);
        return ret;
    }
}
