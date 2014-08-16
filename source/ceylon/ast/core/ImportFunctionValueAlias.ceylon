"A function or value import alias, that is,
 a lowercase identifier followed by an “equals” character.
 
 Examples:
 
     sysout=
     ln="
shared class ImportFunctionValueAlias(name)
        extends ImportAlias() {
    
    shared actual MemberName name;
    
    shared actual [LIdentifier] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImportFunctionValueAlias(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportFunctionValueAlias that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared ImportFunctionValueAlias copy(MemberName name = this.name) {
        value ret = ImportFunctionValueAlias(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
