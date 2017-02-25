"""An import of another module within a [[module descriptor|ModuleDescriptor]].
   
   Each module import consists of a list of [[annotations]], followed by the keyword ‘`import`’,
   an optional [[repository]] and colon,
   the [[name]] of the imported module, and the [[version]] of the imported module, terminated by a semicolon.
   
   Examples:
   
       shared import ceylon.test "1.2.0";
       import ceylon.collection "1.2.0";
       import maven:"commons-codec:commons-codec" "1.4";"""
shared class ModuleImport(name, version, annotations = Annotations(), repository = null)
        extends Node() {
    
    "The name of the imported module.
     
     (For proper Ceylon modules, this should be a [[FullPackageName]];
     [[string literals|StringLiteral]] are allowed for interoperation
     with legacy Java code, or other repositories.)"
    shared FullPackageName|StringLiteral name;
    "The version of the imported module."
    shared StringLiteral version;
    "The annotations on the module import."
    shared Annotations annotations;
    "The repository, or [[null]] for the default repository (none given)."
    aliased ("namespace")
    shared Repository? repository;
    
    shared actual [Annotations, Repository, FullPackageName|StringLiteral, StringLiteral]|[Annotations, FullPackageName|StringLiteral, StringLiteral] children
            = if (exists repository) then [annotations, repository, name, version] else [annotations, name, version];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleImport(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleImport(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleImport that) {
            if (exists repository) {
                if (exists repository_ = that.repository) {
                    if (repository != repository_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.repository exists) {
                return false;
            }
            return name==that.name && version==that.version && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (version.hash + 31 * (annotations.hash + 31 * (repository?.hash else 0))));
    
    shared ModuleImport copy(FullPackageName|StringLiteral name = this.name, StringLiteral version = this.version, Annotations annotations = this.annotations, Repository? repository = this.repository) {
        value ret = ModuleImport(name, version, annotations, repository);
        copyExtraInfoTo(ret);
        return ret;
    }
}
