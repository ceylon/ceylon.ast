"""A package descriptor:
   a list of annotations, followed by the keyword ‘`package`’,
   the package name, and terminated by a semicolon.
   
   Examples:
   
       package tmp;
       "Test package" see (`package my.application`) package test.my.application;"""
shared class PackageDescriptor(name, annotations = Annotations())
        extends Node() {
    
    "The name of the package."
    shared FullPackageName name;
    "The annotations on the package.
     Most common: Documentation, [[shared]], [[license]], [[by]]."
    shared Annotations annotations;
    
    shared actual [Annotations, FullPackageName] children = [annotations, name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformPackageDescriptor(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitPackageDescriptor(this);
    
    shared actual Boolean equals(Object that) {
        if (is PackageDescriptor that) {
            return name==that.name && annotations==that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31*annotations.hash);
    
    shared PackageDescriptor copy(FullPackageName name = this.name, Annotations annotations = this.annotations) {
        value ret = PackageDescriptor(name, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
