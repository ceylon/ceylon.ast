"A type name with optional type arguments.
 
 The type name may optionally be qualified by a [[‘`package`’ qualifier|qualifier]].
 
 Examples:
 
     String
     List<Character>
     package.Object"
shared class BaseType(nameAndArgs, qualifier = null)
        extends SimpleType() {
    
    shared actual TypeNameWithTypeArguments nameAndArgs;
    
    "The ‘`package`’ qualifier of the type, if present."
    shared PackageQualifier? qualifier;
    
    shared actual [TypeNameWithTypeArguments, PackageQualifier=] children
            = if (exists qualifier) then [nameAndArgs, qualifier] else [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseType(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitBaseType(this);

    shared actual Boolean equals(Object that) {
        if (is BaseType that) {
            if (exists qualifier) {
                if (exists qualifier_ = that.qualifier) {
                    if (qualifier != qualifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.qualifier exists) {
                return false;
            }
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (nameAndArgs.hash + (qualifier?.hash else 0));
    
    shared BaseType copy(TypeNameWithTypeArguments nameAndArgs = this.nameAndArgs, PackageQualifier? qualifier = this.qualifier) {
        value ret = BaseType(nameAndArgs, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
