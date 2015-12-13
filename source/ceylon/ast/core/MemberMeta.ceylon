"A member metamodel expression, that is, a [[qualifying type|qualifier]],
 followed by a [[member name|nameAndArgs]] with optional type arguments, surrounded by backticks.
 
 (A qualifier followed by a *type* name with optional type arguments surrounded by backticks
 is a [[TypeMeta]].)
 
 Examples:
 
     `Person.say`
     `system.milliseconds`
     `Iterable<String>.collect<Integer?>`"
shared class MemberMeta(qualifier, nameAndArgs)
        extends Meta() {
    
    "The qualifier (the part before the member operator ('.'))."
    shared PrimaryType qualifier;
    "The member name and, optionally, type arguments (the part after the member operator ('.'))."
    shared MemberNameWithTypeArguments nameAndArgs;
    
    shared actual [PrimaryType, MemberNameWithTypeArguments] children = [qualifier, nameAndArgs];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformMemberMeta(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitMemberMeta(this);

    shared actual Boolean equals(Object that) {
        if (is MemberMeta that) {
            return qualifier == that.qualifier && nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (qualifier.hash + 31 * nameAndArgs.hash);
    
    shared MemberMeta copy(PrimaryType qualifier = this.qualifier, MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs) {
        value ret = MemberMeta(qualifier, nameAndArgs);
        copyExtraInfoTo(ret);
        return ret;
    }
}
