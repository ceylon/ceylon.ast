"A simple variable pattern.
 
 Examples:
 
     e
     String line"
shared class VariablePattern(variable)
        extends Pattern() {
    
    "The variable."
    shared UnspecifiedVariable variable;
    
    shared actual [UnspecifiedVariable] children = [variable];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformVariablePattern(this);
    
    shared actual Boolean equals(Object that) {
        if (is VariablePattern that) {
            return variable == that.variable;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * variable.hash;
    
    shared VariablePattern copy(UnspecifiedVariable variable = this.variable) {
        value ret = VariablePattern(variable);
        copyExtraInfoTo(ret);
        return ret;
    }
}
