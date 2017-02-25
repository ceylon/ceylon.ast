"A comma-separated list of [[resources]], surrounded by parentheses.
 
 Examples:
 
     (lock)
     (reader = inFile.Reader(), writer = outFile.Writer())"
shared class Resources(resources)
        extends Node() {
    
    "The resources."
    shared [Resource+] resources;
    
    shared actual [Resource+] children = resources;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformResources(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitResources(this);
    
    shared actual Boolean equals(Object that) {
        if (is Resources that) {
            return resources == that.resources;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * resources.hash;
    
    shared Resources copy([Resource+] resources = this.resources) {
        value ret = Resources(resources);
        copyExtraInfoTo(ret);
        return ret;
    }
}
