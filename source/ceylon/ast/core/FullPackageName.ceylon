"A full package name, that is, a period-separated list of lowercase identifiers.
 
 Examples:
 
     ceylon.language
     ceylon.ast.core"
shared class FullPackageName(components)
        extends Node() {
    
    "The component names.
     
     (It is recommended that they contain only characters from the ASCII character set.)"
    shared [PackageName+] components;
    
    shared actual [PackageName+] children = components;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformFullPackageName(this);
    
    shared actual Boolean equals(Object that) {
        if (is FullPackageName that) {
            return components == that.components;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * components.hash;
    
    shared FullPackageName copy([PackageName+] components = this.components) {
        value ret = FullPackageName(components);
        copyExtraInfoTo(ret);
        return ret;
    }
}
