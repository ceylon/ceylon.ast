"A closed lower or upper bound of a [[bounded comparison operation|WithinOperation]].
 
 In a closed bound, the [[endpoint]] is a part of the designated interval;
 therefore, the minimum / maximum value of the interval is the endpoint."
shared class ClosedBound(endpoint)
        extends Bound() {
    
    shared actual ExistsNonemptyExpression endpoint;
    
    shared actual [ExistsNonemptyExpression] children = [endpoint];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClosedBound(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitClosedBound(this);

    shared actual Boolean equals(Object that) {
        if (is ClosedBound that) {
            return endpoint == that.endpoint;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * endpoint.hash;
    
    shared ClosedBound copy(ExistsNonemptyExpression endpoint = this.endpoint) {
        value ret = ClosedBound(endpoint);
        copyExtraInfoTo(ret);
        return ret;
    }
}
