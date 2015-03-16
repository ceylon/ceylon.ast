"A qualifier for a [[Dec]], that is,
 a period-separated sequence of [[identifiers|components]],
 possibly itself qualified by a [[‘`package`’ qualifier|packageQualifier]].
 
 (The qualifier may also be completely empty.)
 
 Examples:
 
     process
     Entry
     package.Object"
shared class DecQualifier(components = [], packageQualifier = null)
        extends Node() {
    
    "The components of the qualifier."
    shared [Identifier*] components;
    
    "The ‘`package`’ qualifier, if present."
    shared PackageQualifier? packageQualifier;
    
    shared actual [PackageQualifier,Identifier*]|[Identifier*] children
            = if (exists packageQualifier) then [packageQualifier, *components] else components;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDecQualifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is DecQualifier that) {
            if (exists packageQualifier) {
                if (exists packageQualifier_ = that.packageQualifier) {
                    if (packageQualifier != packageQualifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.packageQualifier exists) {
                return false;
            }
            return components == that.components;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (components.hash + (packageQualifier?.hash else 0));
    
    shared DecQualifier copy([Identifier*] components = this.components, PackageQualifier? packageQualifier = this.packageQualifier) {
        value ret = DecQualifier(components, packageQualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
