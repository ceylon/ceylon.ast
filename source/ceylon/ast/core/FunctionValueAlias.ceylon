"A function or value import alias, that is,
 a lowercase identifier followed by an “equals” character.
 
 Examples:
 
     sysout=
     ln="
shared class FunctionValueAlias(name)
        extends Alias() {
    
    shared actual MemberName name;
    
    shared actual [LIdentifier] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFunctionValueAlias(this);
    
    shared actual Boolean equals(Object that) {
        if (is FunctionValueAlias that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared FunctionValueAlias copy(MemberName name = this.name) {
        value ret = FunctionValueAlias(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
