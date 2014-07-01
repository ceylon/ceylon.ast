"A name and, optionally, type arguments."
shared class NameWithTypeArguments(name, typeArguments = null)
        extends ExpressionIsh() {
    
    "The name."
    shared Identifier name;
    "The type arguments, if any."
    shared TypeArguments? typeArguments;
    
    shared actual Tuple<Identifier|Type,Identifier,Type[]> children = [name, *(typeArguments else [])];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformNameWithTypeArguments(this);
    
    shared actual Boolean equals(Object that) {
        if (is NameWithTypeArguments that) {
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
    
    shared NameWithTypeArguments copy(Identifier name = this.name, TypeArguments? typeArguments = this.typeArguments) {
        value ret = NameWithTypeArguments(name, typeArguments);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
