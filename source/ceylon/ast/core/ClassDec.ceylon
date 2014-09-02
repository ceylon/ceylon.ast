"A class reference expression, that is,
 the [[name]] of a class or anonymous class, optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the type keyword `class` and surrounded by backticks.
 
 The [[name]] may be an [[LIdentifier]] to refer to the class declaration of an anonymous class.
 For example, in
 ~~~
 value dec1 = `class null`;
 value dec2 = `value null`;
 ~~~
 `dec1` refers to the anonymous class of the `null` object, while
 `dec2` refers to the only instance of that class, the `null` object itself.
 
 Examples:
 
     `class String`
     `class A.B.C`"
shared class ClassDec(name, qualifier = null)
        extends TypeDec() {
    
    shared actual Identifier name;
    shared actual DecQualifier? qualifier;
    
    keyword = "class";
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is ClassDec that) {
            if (exists qualifier) {
                if (exists qualifier_ = that.qualifier) {
                    return qualifier == qualifier_ && name == that.name;
                } else {
                    return false;
                }
            } else {
                if (!(that.qualifier exists)) {
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
            => 31 * (name.hash + 31 * (qualifier?.hash else 0));
    
    shared ClassDec copy(Identifier name = this.name, DecQualifier? qualifier = this.qualifier) {
        value ret = ClassDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
