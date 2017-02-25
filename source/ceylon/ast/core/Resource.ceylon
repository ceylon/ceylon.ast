"A resource in a try-with-resources statement.
 
 Examples:
 
     lock
     writer = file.Writer()"
shared class Resource(resource)
        extends Node() {
    
    "The resource itself."
    shared Expression|SpecifiedVariable resource;
    /*
     TODO
     This is ambiguous when the resource is an AssignExpression
     with a baseExpression as left operand – that looks like an
     untyped specified variable.
     Should we disallow this via an assertion?
     */
    
    shared actual [Expression|SpecifiedVariable] children = [resource];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformResource(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitResource(this);
    
    shared actual Boolean equals(Object that) {
        if (is Resource that) {
            return resource == that.resource;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * resource.hash;
    
    shared Resource copy(Expression|SpecifiedVariable resource = this.resource) {
        value ret = Resource(resource);
        copyExtraInfoTo(ret);
        return ret;
    }
}
