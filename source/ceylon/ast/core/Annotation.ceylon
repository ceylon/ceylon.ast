"""An annotation.
   
   For the common case “no arguments”, the toplevel helper function [[annotation]] may be used.
   
   Examples:
   
       shared
       formal
       by ("John Doe <john.doe@company.com>")
       see (`function print`)
       action { description = "Log in"; url = "/login"; }"""
shared class Annotation(name, arguments = null)
        extends Node() {
    
    "The name of the annotation constructor."
    shared MemberName name;
    "The arguments, or [[null]] if they’re completely omitted."
    shared Arguments? arguments;
    
    shared actual [LIdentifier, Arguments=] children = [name, *emptyOrSingleton(arguments)];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAnnotation(this);
    
    shared actual Boolean equals(Object that) {
        if (is Annotation that) {
            if (exists arguments) {
                if (exists arguments_ = that.arguments) {
                    return arguments == arguments_ && name == that.name;
                } else {
                    return false;
                }
            } else {
                if (!(that.arguments exists)) {
                    return name == that.name;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (arguments?.hash else 0));
    
    shared Annotation copy(LIdentifier name = this.name, Arguments? arguments = this.arguments) {
        value ret = Annotation(name, arguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}

"Shortcut helper function for an [[Annotation]]
 with the specified name and no arguments."
shared Annotation annotation(String name)
        => Annotation(LIdentifier(name), null);
