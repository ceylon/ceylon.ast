"A construction, that is,
 a [[member name with optional type arguments|nameAndArgs]] and [[arguments]],
 optionally [[qualified|qualifier]] with a base type or a `super` qualifier.
 
 (Note: the specification’s `BaseConstruction` and `SuperConstruction` have been inlined into this node.)
 
 Examples:
 
     Point.cartesian(x, y, 0.0)
     withRGB(#FF, 0, 0)
     super.cartesian(x, y, 0.0)"
shared class Construction(nameAndArgs, arguments, qualifier = null)
        extends ExtensionOrConstruction() {
    
    "The name of the invoked constructor."
    shared actual MemberNameWithTypeArguments nameAndArgs;
    "The arguments to the invoked constructor."
    shared actual PositionalArguments arguments;
    "The qualifier, if any.
     
     This can be:
     - a [[base type|BaseType]] to specify the class to which the constructor belongs,
     - a [[`super` qualifier|Super]] to specify that the constructor belongs to the superclass, or
     - [[null]] to specify that the constructor belongs to the current class."
    shared actual BaseType|Super? qualifier;
    
    shared actual <MemberNameWithTypeArguments|PositionalArguments|BaseType|Super>[] children
            = concatenate([nameAndArgs], emptyOrSingleton(arguments), emptyOrSingleton(qualifier));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformConstruction(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitConstruction(this);
    
    shared actual Boolean equals(Object that) {
        if (is Construction that) {
            if (exists qualifier) {
                if (exists qualifier_ = that.qualifier) {
                    if (qualifier != qualifier_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.qualifier exists) {
                return false;
            }
            return nameAndArgs==that.nameAndArgs && arguments==that.arguments;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (nameAndArgs.hash + 31 * (arguments.hash + 31 * (qualifier?.hash else 0)));
    
    shared Construction copy(MemberNameWithTypeArguments nameAndArgs = this.nameAndArgs, PositionalArguments arguments = this.arguments, BaseType|Super? qualifier = this.qualifier) {
        value ret = Construction(nameAndArgs, arguments, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
