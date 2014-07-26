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
    "The type of the parameter, or a ‘`dynamic`’ modifier."
    shared Type|DynamicModifier type;
    "The name of the parameter."
    shared LIdentifier name;
    
    shared actual [Annotations, Type|DynamicModifier, LIdentifier] children = [annotations, type, name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformValueParameter(this);
    
    shared actual Boolean equals(Object that) {
        if (is ValueParameter that) {
            return annotations == that.annotations && type == that.type && name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (annotations.hash + 31 * (type.hash + 31 * name.hash));
    
    shared ValueParameter copy(Annotations annotations = this.annotations, Type|DynamicModifier type = this.type, LIdentifier name = this.name) {
        value ret = ValueParameter(annotations, type, name);
        copyExtraInfoTo(ret);
        return ret;
    }
}
