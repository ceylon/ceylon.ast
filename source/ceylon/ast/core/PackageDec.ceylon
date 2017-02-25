"A package reference expression, that is,
 the name of a package (or empty for the current package),
 prefixed by the keyword “package” and surrounded by backticks.
 
 Examples:
 
     `package ceylon.language`
     `package ceylon.ast.core`
     `package`"
shared class PackageDec(packageName)
        extends Dec() {
    
    "The name of the referenced package,
     or [[null]] for a reference to the current package."
    shared FullPackageName? packageName;
    
    keyword = "package";
    
    shared actual [FullPackageName=] children = emptyOrSingleton(packageName);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPackageDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPackageDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is PackageDec that) {
            if (exists packageName) {
                if (exists packageName_ = that.packageName) {
                    if (packageName != packageName_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.packageName exists) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (packageName?.hash else 0);
    
    shared PackageDec copy(FullPackageName? packageName = this.packageName) {
        value ret = PackageDec(packageName);
        copyExtraInfoTo(ret);
        return ret;
    }
}
