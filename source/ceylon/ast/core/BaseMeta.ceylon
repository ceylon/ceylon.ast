"A base metamodel expression, that is, a member name with optional type arguments, surrounded by backticks.
 
 (A *type* name with optional type arguments surrounded by backticks is a [[TypeMeta]].)
 
 Examples:
 
     `sum<Float>`
     `system`"
shared class BaseMeta(nameAndArgs)
        extends Meta() {
    
    "The member name and, optionally, type arguments."
    shared MemberNameWithTypeArguments nameAndArgs;
    
    shared actual [MemberNameWithTypeArguments] children = [nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformBaseMeta(this);
    
    shared actual Boolean equals(Object that) {
        if (is BaseMeta that) {
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * nameAndArgs.hash;
    
    shared BaseMeta copy(MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = BaseMeta(nameAndArgs);
        copyExtraInfoTo(ret);
        return ret;
    }
}
