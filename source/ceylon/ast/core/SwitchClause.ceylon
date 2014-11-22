"A ‘`switch`’ clause of a [[`switch` statement|SwitchCaseElse]], that is,
 the keyword ‘`switch`’, followed by an expression or variable definition.
 
 Examples:
 
     switch (i.magnitude)
     switch (child)
     switch (arg = process.arguments.first)"
shared class SwitchClause(switched)
        extends Node() {
    
    "The `switch` expression or variable definition."
    shared Expression|SpecifiedVariable switched;
    
    shared actual [Expression|SpecifiedVariable] children = [switched];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformSwitchClause(this);
    
    shared actual Boolean equals(Object that) {
        if (is SwitchClause that) {
            return switched == that.switched;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * switched.hash;
    
    shared SwitchClause copy(Expression|SpecifiedVariable switched = this.switched) {
        value ret = SwitchClause(switched);
        copyExtraInfoTo(ret);
        return ret;
    }
}
