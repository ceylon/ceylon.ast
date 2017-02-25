"An element or subrange access expression, that is,
 a target [[primary]] followed by a [[subscript]] surrounded with brackets.
 
 Examples:
 
     text[start...]
     map[key]"
shared class ElementOrSubrangeExpression(primary, subscript)
        extends Primary() {
    
    "The target primary.
     
     This should be of type [[Correspondence]] if the [[subscript]] is a [[KeySubscript]],
     and of type [[Ranged]] if the [[subscript]] is a [[RangeSubscript]]."
    shared Primary primary;
    "The subscript to access the element or subrange.
     
     (The brackets surrounding it are part of this node,
     not of the subscript node.)"
    shared Subscript subscript;
    
    shared actual [Primary, Subscript] children = [primary, subscript];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformElementOrSubrangeExpression(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitElementOrSubrangeExpression(this);
    
    shared actual Boolean equals(Object that) {
        if (is ElementOrSubrangeExpression that) {
            return primary==that.primary && subscript==that.subscript;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (primary.hash + 31*subscript.hash);
    
    shared ElementOrSubrangeExpression copy(Primary primary = this.primary, Subscript subscript = this.subscript) {
        value ret = ElementOrSubrangeExpression(primary, subscript);
        copyExtraInfoTo(ret);
        return ret;
    }
}
