"An import statement, that is,
 the keyword ‘`import`’ followed by the [[package name|packageName]] and the imported [[elements]] from the package.
 
 Examples:
 
     import ceylon.ast.core { ... }
     import java.lang { JString=String, System { sysout=\\iout } }
     import ceylon.collection { ArrayList, MutableList }"
shared class Import(packageName, elements)
        extends Node() {
    
    "The name of the imported package."
    shared FullPackageName packageName;
    "The elements imported from the package."
    shared ImportElements elements;
    
    shared actual [FullPackageName, ImportElements] children = [packageName, elements];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImport(this);
    
    shared actual Boolean equals(Object that) {
        if (is Import that) {
            return packageName == that.packageName && elements == that.elements;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (packageName.hash + 31 * elements.hash);
    
    shared Import copy(FullPackageName packageName = this.packageName, ImportElements elements = this.elements) {
        value ret = Import(packageName, elements);
        copyExtraInfoTo(ret);
        return ret;
    }
}
