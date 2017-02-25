"A constructor reference expression, that is,
 the [[name]] of a constructor, qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the constructor keyword `class` and surrounded by backticks.
 
 Examples:
 
     `new Point.polar`
     `new Location.cartesian`"
shared class ConstructorDec(name, qualifier)
        extends Dec() {
    
    "The name of the constructor."
    shared LIdentifier name;
    "A qualifier for the class containing the constructor."
    shared DecQualifier qualifier;
    
    keyword = "new";
    
    shared actual [DecQualifier, LIdentifier] children = [qualifier, name];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformConstructorDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitConstructorDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is ConstructorDec that) {
            return name==that.name && qualifier==that.qualifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31*qualifier.hash);
    
    shared ConstructorDec copy(LIdentifier name = this.name, DecQualifier qualifier = this.qualifier) {
        value ret = ConstructorDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
