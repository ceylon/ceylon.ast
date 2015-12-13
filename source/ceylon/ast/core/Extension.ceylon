"An extension, that is,
 a [[type name with optional type arguments|nameAndArgs]] and optional [[arguments]],
 optionally [[qualified|qualifier]] with a `package` or `super` qualifier.
 
 (Note: the specification’s `BaseExtension` and `SuperExtension` have been inlined into this node.)
 
 Examples:
 
     Object()
     package.Object
     super.Inner"
shared class Extension(nameAndArgs, arguments, qualifier = null)
        extends ExtensionOrConstruction() {
    
    "The name of the extended class."
    shared actual TypeNameWithTypeArguments nameAndArgs;
    "The arguments to the extended class, if any."
    shared actual PositionalArguments? arguments;
    "The qualifier, if any.
     
     This can be:
     - a [[`package` qualifier|PackageQualifier]] to specify that the class belongs to the same package,
     - a [[`super` qualifier|Super]] to specify that the class is an inner class of the superclass, or
     - [[null]] to specify that the class is discovered the usual way."
    shared actual PackageQualifier|Super? qualifier;
    
    shared actual <TypeNameWithTypeArguments|PositionalArguments|PackageQualifier|Super>[] children
            = concatenate([nameAndArgs], emptyOrSingleton(arguments), emptyOrSingleton(qualifier));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExtension(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitExtension(this);

    shared actual Boolean equals(Object that) {
        if (is Extension that) {
            if (exists arguments) {
                if (exists arguments_ = that.arguments) {
                    if (arguments != arguments_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.arguments exists) {
                return false;
            }
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
            return nameAndArgs == that.nameAndArgs;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (nameAndArgs.hash + 31 * ((arguments?.hash else 0) + 31 * (qualifier?.hash else 0)));
    
    shared Extension copy(TypeNameWithTypeArguments nameAndArgs = this.nameAndArgs, PositionalArguments? arguments = this.arguments, PackageQualifier|Super? qualifier = this.qualifier) {
        value ret = Extension(nameAndArgs, arguments, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
