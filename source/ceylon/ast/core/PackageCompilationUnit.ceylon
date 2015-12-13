"A package descriptor compilation unit, containing a package descriptor.
 
 Examples:
 
     package tmp;
     shared package ceylon.ast.core;"
shared class PackageCompilationUnit(packageDescriptor, imports = [])
        extends AnyCompilationUnit() {
    
    shared actual Import[] imports;
    shared actual PackageDescriptor packageDescriptor;
    "Package descriptor compilation units contain no declarations."
    shared actual [] declarations = [];
    "Package descriptor compilation units contain no module descriptor."
    shared actual Null moduleDescriptor = null;
    
    shared actual <Import|PackageDescriptor>[] children = concatenate(imports, [packageDescriptor]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPackageCompilationUnit(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPackageCompilationUnit(this);

    shared actual Boolean equals(Object that) {
        if (is PackageCompilationUnit that) {
            return packageDescriptor == that.packageDescriptor && imports == that.imports;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (packageDescriptor.hash + 31 * imports.hash);
    
    shared PackageCompilationUnit copy(PackageDescriptor packageDescriptor = this.packageDescriptor, Import[] imports = this.imports) {
        value ret = PackageCompilationUnit(packageDescriptor, imports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
