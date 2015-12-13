"A module reference expression, that is,
 the name of a module (or empty for the current module),
 prefixed by the keyword “module” and surrounded by backticks.
 
 Examples:
 
     `module ceylon.language`
     `module ceylon.ast.core`
     `module`"
shared class ModuleDec(moduleName)
        extends Dec() {
    
    "The name of the referenced module,
     or [[null]] for a reference to the current module."
    shared FullPackageName? moduleName;
    
    keyword = "module";
    
    shared actual [FullPackageName=] children = emptyOrSingleton(moduleName);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitModuleDec(this);

    shared actual Boolean equals(Object that) {
        if (is ModuleDec that) {
            if (exists moduleName) {
                if (exists moduleName_ = that.moduleName) {
                    if (moduleName != moduleName_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.moduleName exists) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (moduleName?.hash else 0);
    
    shared ModuleDec copy(FullPackageName? moduleName = this.moduleName) {
        value ret = ModuleDec(moduleName);
        copyExtraInfoTo(ret);
        return ret;
    }
}
