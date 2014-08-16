"An assignability condition, that is,
 the keyword ‘`is`’, followed by an (optionally specified) typed variable
 and optionally prefixed by a negation operator ‘`!`’.
 
 Examples:
 
     is Integer|Float num
     is Administrator user"
shared class IsCondition(variable, negated = false)
        extends Condition() {
    
    "The variable whose type is tested."
    shared TypedVariable variable;
    "Whether the condition is negated or not.
     
     If the condition is negated, the ‘`is`’ keyword
     is prefixed by a negation operator ‘`!`’."
    // TODO is there a way to represent this through nodes? booleans can’t be children and are generally inconvenient
    shared Boolean negated;
    
    shared actual [TypedVariable] children = [variable];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformIsCondition(this);
    
    shared actual Boolean equals(Object that) {
        if (is IsCondition that) {
            return variable == that.variable && negated == that.negated;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (variable.hash + 31 * negated.hash);
    
    shared IsCondition copy(TypedVariable variable = this.variable, Boolean negated = this.negated) {
        value ret = IsCondition(variable, negated);
        copyExtraInfoTo(ret);
        return ret;
    }
}
