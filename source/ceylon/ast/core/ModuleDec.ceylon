"A module reference expression, that is,
 the name of a module, prefixed by the keyword “module” and surrounded by backticks.
 
 Examples:
 
     `module ceylon.language`
     `module ceylon.ast.core`"
shared class ModuleDec(moduleName)
        extends Dec() {
    
    "The name of the referenced module."
    shared FullPackageName moduleName;
    
    shared actual [FullPackageName] children = [moduleName];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformModuleDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is ModuleDec that) {
            return moduleName == that.moduleName;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * moduleName.hash;
    
    shared ModuleDec copy(FullPackageName moduleName = this.moduleName) {
        value ret = ModuleDec(moduleName);
        copyExtraInfoTo(ret);
        return ret;
    }
}
