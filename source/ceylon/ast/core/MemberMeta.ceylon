"A member metamodel expression, that is, a [[qualifier]],
 followed by a member name with optional type arguments, surrounded by backticks.
 
 (A qualifier followed by a *type* name with optional type arguments surrounded by backticks
 is a [[TypeMeta]].)
 
 Examples:
 
     `Person.say`
     `system.milliseconds`
     `Iterable<String>.collect<Integer?>`"
shared class MemberMeta(qualifier, nameAndArgs)
        extends Meta() {
    
    "The qualifier (the part before the member operator ('.'))."
    shared MetaQualifier qualifier;
    "The member name and, optionally, type arguments (the part after the member operator ('.'))."
    shared MemberNameWithTypeArguments nameAndArgs;
    
    shared actual [MetaQualifier, MemberNameWithTypeArguments] children = [qualifier, nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMemberMeta(this);
    
    shared actual Boolean equals(Object that) {
        if (is MemberMeta that) {
            return qualifier == that.qualifier && nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (qualifier.hash + 31 * nameAndArgs.hash);
    
    shared MemberMeta copy(MetaQualifier qualifier = this.qualifier, MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = MemberMeta(qualifier, nameAndArgs);
        ret.extraInfo = extraInfo;
        return ret;
    }
}
