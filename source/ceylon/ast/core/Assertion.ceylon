"""An assertion statement, that is,
   an annotation list, followed by the keyword ‘`assert`’, a condition list, and terminated by a semicolon.
   
   Examples:
   
       assert (exists num = parseFloat(numText));
       "Weight cannot be negative" assert (weight >= 0);"""
shared class Assertion(conditions, annotations = Annotations())
        extends Statement() {
    
    "The conditions that are asserted."
    shared Conditions conditions;
    "The annotations on the assertion.
     
     The `doc` annotation (typically as [[anonymous annotation|Annotations.anonymousAnnotation]])
     can be used to specify the message carried by the assertion failure."
    shared Annotations annotations;
    
    shared actual [Annotations, Conditions] children = [annotations, conditions];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAssertion(this);
    
    shared actual Boolean equals(Object that) {
        if (is Assertion that) {
            return conditions == that.conditions && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (conditions.hash + 31 * annotations.hash);
    
    shared Assertion copy(Conditions conditions = this.conditions, Annotations annotations = this.annotations) {
        value ret = Assertion(conditions, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
