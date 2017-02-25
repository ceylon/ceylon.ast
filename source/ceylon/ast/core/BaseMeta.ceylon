"A base metamodel expression, that is,
 a [[member name|nameAndArgs]] with optional type arguments,
 optionally qualified with a [[‘`package`’ qualifier|packageQualifier]],
 surrounded by backticks.
 
 (A *type* name with optional type arguments surrounded by backticks is a [[TypeMeta]].)
 
 Examples:
 
     `sum<Float>`
     `system`
     `package.null`"
shared class BaseMeta(nameAndArgs, packageQualifier = null)
        extends Meta() {
    
    "The member name and, optionally, type arguments."
    shared MemberNameWithTypeArguments nameAndArgs;
    "The package qualifier, if present."
    shared PackageQualifier? packageQualifier;
    
    shared actual [PackageQualifier, MemberNameWithTypeArguments]|[MemberNameWithTypeArguments] children
            = if (exists packageQualifier) then [packageQualifier, nameAndArgs] else [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseMeta(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitBaseMeta(this);
    
    shared actual Boolean equals(Object that) {
        if (is BaseMeta that) {
            if (exists packageQualifier) {
                if (exists packageQualifier_ = that.packageQualifier) {
                    if (packageQualifier != packageQualifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.packageQualifier exists) {
                return false;
            }
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (nameAndArgs.hash + (packageQualifier?.hash else 0));
    
    shared BaseMeta copy(MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs, PackageQualifier? packageQualifier = this.packageQualifier) {
        value ret = BaseMeta(nameAndArgs, packageQualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
