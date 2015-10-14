"""An import of another module within a [[module descriptor|ModuleDescriptor]].
   
   Each module import consists of a list of [[annotations]], followed by the keyword ‘`package`’, the [[name]]
   of the imported module, and the [[version]] of the imported module, terminated by a semicolon.
   
   Examples:
   
       shared import ceylon.test "1.2.0";
       import ceylon.collection "1.2.0";"""
shared class ModuleImport(name, version, annotations = Annotations())
        extends Node() {
    
    "The name of the imported module.
     
     (For proper Ceylon modules, this should be a [[FullPackageName]];
     [[string literals|StringLiteral]] are allowed for interoperation
     with legacy Java code.)"
    shared FullPackageName|StringLiteral name;
    "The version of the imported module."
    shared StringLiteral version;
    "The annotations on the module import."
    shared Annotations annotations;
    
    shared actual [Annotations, FullPackageName|StringLiteral, StringLiteral] children = [annotations, name, version];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleImport(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleImport that) {
            return name == that.name && version == that.version && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (version.hash + 31 * annotations.hash));
    
    shared ModuleImport copy(FullPackageName|StringLiteral name = this.name, StringLiteral version = this.version, Annotations annotations = this.annotations) {
        value ret = ModuleImport(name, version, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
