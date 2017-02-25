"An import alias, that is, an identifier followed by an “equals” character.
 
 (Not to be confused with an [[alias *declaration*|TypeAliasDefinition]] like `alias TypeName => UIdentifier;`.)
 
 The specification distinguishes between `TypeAlias`es and `FunctionValueAlias`es,
 which differ in the kinds of identifiers they specify.
 However, the compiler does not actually enforce this distinction (mainly for improved interoperation with Java),
 and in `ceylon.ast` they are both merged into this one class.
 
 Examples:
 
     JString=
     sysout="
shared class ImportAlias(name)
        extends Node() {
    
    "The visible name of the imported element.
     
     (This would probably be called `alias` if that weren’t a keyword.)"
    shared Identifier name;
    
    shared actual [Identifier] children = [name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImportAlias(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitImportAlias(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportAlias that) {
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * name.hash;
    
    shared ImportAlias copy(Identifier name = this.name) {
        value ret = ImportAlias(name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
