"""A module specifier, that is,
   a [[repository]], a [[module name|moduleName]],
   and optionally an [[artifact]] and optional [[classifier]].
   
   Examples:
   
       npm:my.module
       maven:"my-module":"my-module"
       maven:"my-module":"my-module":"my-module""""
shared class ModuleSpecifier(repository, moduleName, artifact, classifier)
        extends Node() {
    
    "The repository of the module specifier,
     a short lowercase identifier selecting a foreign module repository system
     with no defined semantics."
    shared Repository repository;
    "The name of the module,
     either as a regular Ceylon [[ModuleName]]
     or as a [[StringLiteral]] if the [[repository]] does not comply with Ceylon’s module name syntax."
    shared Module moduleName;
    "The artifact,
     an additional identifier for some foreign module repository systems
     with no defined semantics."
    shared Artifact? artifact;
    "The classifier,
     a second additional identifier for some foreign module repository systems
     with no defined semantics.
     May only be present if the [[artifact]] is also present."
    shared Classifier? classifier;
    
    "The classifier may only be present if the artifact is also present"
    assert (artifact exists || !classifier exists);
    
    shared actual [Repository, Module, Artifact=, Classifier=] children
            = if (exists artifact)
            then if (exists classifier)
                then [repository, moduleName, artifact, classifier]
                else [repository, moduleName, artifact]
            else [repository, moduleName];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleSpecifier(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleSpecifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleSpecifier that) {
            if (exists artifact) {
                if (exists artifact_ = that.artifact) {
                    if (artifact != artifact_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.artifact exists) {
                return false;
            }
            if (exists classifier) {
                if (exists classifier_ = that.classifier) {
                    if (classifier != classifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.classifier exists) {
                return false;
            }
            return repository==that.repository && moduleName==that.moduleName;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (repository.hash + 31 * (moduleName.hash + 31 * ((artifact?.hash else 0) + 31 * (classifier?.hash else 0))));
    
    shared ModuleSpecifier copy(Repository repository = this.repository, Module moduleName = this.moduleName, Artifact? artifact = this.artifact, Classifier? classifier = this.classifier) {
        value ret = ModuleSpecifier(repository, moduleName, artifact, classifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
