"""A module descriptor compilation unit, containing a module descriptor.
   
   Examples (separated by blank lines):
   
       module tmp "1.0.0" {}
   
       "Representation of a Ceylon AST in Ceylon."
       by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
       license ("http://www.apache.org/licenses/LICENSE-2.0.html")
       module ceylon.ast.core "1.2.0" {
           import ceylon.collection "1.2.0";
       }"""
shared class ModuleCompilationUnit(moduleDescriptor, imports = [])
        extends AnyCompilationUnit() {
    
    shared actual Import[] imports;
    shared actual ModuleDescriptor moduleDescriptor;
    "Module descriptor compilation units contain no declarations."
    shared actual [] declarations = [];
    "Module descriptor compilation units contain no package descriptor."
    shared actual Null packageDescriptor = null;
    
    shared actual <Import|ModuleDescriptor>[] children = concatenate(imports, [moduleDescriptor]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleCompilationUnit(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleCompilationUnit(this);

    shared actual Boolean equals(Object that) {
        if (is ModuleCompilationUnit that) {
            return moduleDescriptor == that.moduleDescriptor && imports == that.imports;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (moduleDescriptor.hash + 31 * imports.hash);
    
    shared ModuleCompilationUnit copy(ModuleDescriptor moduleDescriptor = this.moduleDescriptor, Import[] imports = this.imports) {
        value ret = ModuleCompilationUnit(moduleDescriptor, imports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
