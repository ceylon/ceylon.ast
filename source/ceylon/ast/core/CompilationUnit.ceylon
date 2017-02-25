"""A regular compilation unit, containing toplevel type, value, or function definitions.
   
   This is the most commonly used type of [[compilation unit|AnyCompilationUnit]], and the basic “container”
   for your declarations.
   
   Examples:
   
       void run() {
           print("Hello, World!");
       }
   
       // end of example, start of next example
   
       import ceylon.collection {
           SetMutator
       }
       
       MyPlugin myPlugin = MyPlugin(); // only instance
       
       register
       shared void registerMyPlugin(SetMutator<Plugin> registry)
           => registry.put(myPlugin);"""
shared class CompilationUnit(declarations, imports = []) // we *could* provide a default value of [] for declarations, but that doesn’t make any sense
        extends AnyCompilationUnit() {
    
    shared actual Import[] imports;
    shared actual Declaration[] declarations;
    "Regular compilation units contain no module descriptor."
    shared actual Null moduleDescriptor = null;
    "Regular compilation units contain no package descriptor."
    shared actual Null packageDescriptor = null;
    
    shared actual <Import|Declaration>[] children = concatenate(imports, declarations);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCompilationUnit(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitCompilationUnit(this);
    
    shared actual Boolean equals(Object that) {
        if (is CompilationUnit that) {
            return imports==that.imports && declarations==that.declarations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (imports.hash + 31*declarations.hash);
    
    shared CompilationUnit copy(Declaration[] declarations = this.declarations, Import[] imports = this.imports) {
        value ret = CompilationUnit(declarations, imports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
