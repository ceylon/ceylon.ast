"A package reference expression, that is,
 the name of a package, prefixed by the keyword “package” and surrounded by backticks.
 
 Examples:
 
     `package ceylon.language`
     `package ceylon.ast.core`"
shared class PackageDec(packageName)
        extends Dec() {
    
    "The name of the referenced package."
    shared FullPackageName packageName;
    
    keyword = "package";
    
    shared actual [FullPackageName] children = [packageName];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPackageDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is PackageDec that) {
            return packageName == that.packageName;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * packageName.hash;
    
    shared PackageDec copy(FullPackageName packageName = this.packageName) {
        value ret = PackageDec(packageName);
        copyExtraInfoTo(ret);
        return ret;
    }
}
