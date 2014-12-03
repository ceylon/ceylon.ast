"A qualifier for a [[Dec]], that is,
 either a period-separated sequence of one or more [[type names|UIdentifier]],
 or exactly one [[member name|LIdentifier]].
 
 Examples:
 
     process
     Entry"
shared class DecQualifier(components)
        extends Node() {
    
    "The components of the qualifier."
    /*
     Note: this is [UIdentifier+]|[LIdentifier]
     rather than   [UIdentifier+]|LIdentifier
     because I think that the spec will later
     allow literals of the form `value a.b.c.d`
     to reference members of toplevel objects.
     When that happens, this will change to
     [Identifier+].
     
     See https://github.com/ceylon/ceylon-spec/issues/1013. 
     */
    shared [UIdentifier+]|[LIdentifier] components;
    
    shared actual [UIdentifier+]|[LIdentifier] children = components;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformDecQualifier(this);
    
    shared actual Boolean equals(Object that) {
        if (is DecQualifier that) {
            return components == that.components;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * components.hash;
    
    shared DecQualifier copy([UIdentifier+]|[LIdentifier] components = this.components) {
        value ret = DecQualifier(components);
        copyExtraInfoTo(ret);
        return ret;
    }
}
