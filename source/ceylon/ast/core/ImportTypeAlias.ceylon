"A type import alias, that is,
 an uppercase identifier followed by an “equals” character.
 
 Examples:
 
     JString=
     Char="
shared class ImportTypeAlias(name)
        extends ImportAlias() {
    
    shared actual TypeName name;
    
    shared actual [UIdentifier] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImportTypeAlias(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportTypeAlias that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared ImportTypeAlias copy(TypeName name = this.name) {
        value ret = ImportTypeAlias(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
