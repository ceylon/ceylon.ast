"A value parameter.
 
 Examples:
 
     String name
     Integer length
     Boolean(Element) selecting
     shared Address privateAddress"
// TODO parameter order? This way, we can’t default annotations to Annotations()
shared class ValueParameter(annotations, type, name)
        extends RequiredParameter() {
    
    "The annotations of the parameter."
    shared Annotations annotations;
    "The type of the parameter, or [[null]]
     for a dynamically typed parameter (keyword ‘`dynamic`’).
     
     Warning: a parameter with no syntactical type at all
     is a [[ParameterReference]], not a [[ValueParameter]] with a [[null]] [[type]]!
     Compare:
     
         // ValueParameter(emptyAnnotations, stringType, aIdentifier)
         void valueParameter(String a) {}
         
         // ValueParameter(emptyAnnotations, null, aIdentifier)
         void valueParameterTypeNull(dynamic a) {}
         
         // ParameterReference(aIdentifier)
         void parameterReference(a) {
             String a;
         }"
    shared Type? type;
    "The name of the parameter."
    shared LIdentifier name;
    
    shared actual Node[] children;
    // TODO use the more precise type below when backend bug (#1728?) is fixed!
    //shared actual [Annotations, Type, LIdentifier]|[Annotations, LIdentifier] children;
    if (exists type) {
        children = [annotations, type, name];
    } else {
        children = [annotations, name];
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueParameter(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueParameter that) {
            if (exists type) {
                if (exists type_ = that.type) {
                    return type == type_ && annotations == that.annotations && name == that.name;
                } else {
                    return false;
                }
            } else {
                if (!(that.type exists)) {
                    return annotations == that.annotations && name == that.name;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (annotations.hash + 31 * ((type?.hash else 0) + 31 * name.hash));
    
    shared ValueParameter copy(Annotations annotations = this.annotations, Type? type = this.type, LIdentifier name = this.name) {
        value ret = ValueParameter(annotations, type, name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
