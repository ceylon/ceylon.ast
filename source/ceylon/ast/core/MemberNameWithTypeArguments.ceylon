"A member name and, optionally, type arguments."
shared class MemberNameWithTypeArguments(name, typeArguments = null)
        extends NameWithTypeArguments() {
    
    "The member name."
    shared actual MemberName name;
    shared actual TypeArguments? typeArguments;
    
    shared actual [MemberName, TypeArguments=] children = [name, *(emptyOrSingleton(typeArguments))];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMemberNameWithTypeArguments(this);
    
    shared actual Boolean equals(Object that) {
        if (is MemberNameWithTypeArguments that) {
            if (exists typeArguments) {
                if (exists typeArguments_ = that.typeArguments) {
                    return typeArguments == typeArguments_ && name == that.name;
                } else {
                    return false;
                }
            } else {
                if (!(that.typeArguments exists)) {
                    return name == that.name;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (typeArguments?.hash else 0));
    
    shared MemberNameWithTypeArguments copy(MemberName name = this.name, TypeArguments? typeArguments = this.typeArguments) {
        value ret = MemberNameWithTypeArguments(name, typeArguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}
