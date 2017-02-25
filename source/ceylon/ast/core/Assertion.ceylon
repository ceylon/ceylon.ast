"""An assertion statement, that is,
   a string literal or template, followed by the keyword ‘`assert`’, a condition list, and terminated by a semicolon.
   
   Examples:
   
       assert (exists num = parseFloat(numText));
       "Weight cannot be negative" assert (weight >= 0);"""
shared class Assertion(conditions, message = null)
        extends Statement() {
    
    "The conditions that are asserted."
    shared Conditions conditions;
    "The failure message of the assertion, if present."
    shared AssertionMessage? message;
    
    shared actual [Conditions]|[AssertionMessage, Conditions] children
            = if (exists message) then [message, conditions] else [conditions];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAssertion(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitAssertion(this);
    
    shared actual Boolean equals(Object that) {
        if (is Assertion that) {
            if (exists message) {
                if (exists message_ = that.message) {
                    if (message != message_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.message exists) {
                return false;
            }
            return conditions == that.conditions;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (conditions.hash + 31 * (message?.hash else 0));
    
    shared Assertion copy(Conditions conditions = this.conditions, AssertionMessage? message = this.message) {
        value ret = Assertion(conditions, message);
        copyExtraInfoTo(ret);
        return ret;
    }
}
