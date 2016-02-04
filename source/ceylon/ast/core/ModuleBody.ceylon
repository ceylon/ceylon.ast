"""A [[module descriptor|ModuleDescriptor]] body, that is,
   any number of [[module imports|ModuleImport]] surrounded by braces.
   
   (Because a module body can’t contain procedural code, this is not a subclass of [[Body]].
   If a future version of Ceylon allows procedural code in a module body, then this may change.)
   
   Examples:
   
       {}
       { shared import ceylon.test "1.2.0"; }
       { import ceylon.collection "1.2.0"; }"""
shared class ModuleBody(moduleImports = [])
        extends Node() {
    
    "The module imports."
    shared ModuleImport[] moduleImports;
    
    shared actual ModuleImport[] children = moduleImports;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleBody(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleBody(this);

    shared actual Boolean equals(Object that) {
        if (is ModuleBody that) {
            return moduleImports == that.moduleImports;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * moduleImports.hash;
    
    shared ModuleBody copy(ModuleImport[] moduleImports = this.moduleImports) {
        value ret = ModuleBody(moduleImports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
