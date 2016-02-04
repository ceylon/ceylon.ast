"A class reference expression, that is,
 the [[name]] of a class or anonymous class,
 qualified by a (possibly empty) [[qualifier]] (separated from it by a member operator ‘`.`’),
 or empty for the current class,
 prefixed by the type keyword `class` and surrounded by backticks.
 
 The [[name]] may be an [[LIdentifier]] to refer to the class declaration of an anonymous class.
 For example, in
 ~~~
 value dec1 = `class null`;
 value dec2 = `value null`;
 ~~~
 `dec1` refers to the anonymous class of the `null` object, while
 `dec2` refers to the only instance of that class, the `null` object itself.
 
 The [[qualifier]] may only be null if the [[name]] is also null.
 If the name exists, the qualifier must exist as well (but may of course be empty).
 
 Examples:
 
     `class String`
     `class A.B.C`
     `class`"
shared class ClassDec(name, qualifier = DecQualifier())
        extends TypeDec() {
    
    shared actual Identifier? name;
    shared actual DecQualifier? qualifier;
    
    keyword = "class";
    
    "Qualifier must exist iff name exists"
    assert (qualifier exists == name exists);
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), emptyOrSingleton(name));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitClassDec(this);

    shared actual Boolean equals(Object that) {
        if (is ClassDec that) {
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
            if (exists name) {
                if (exists name_ = that.name) {
                    if (name != name_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.name exists) {
                return false;
            }
            return true;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * ((name?.hash else 0) + 31 * (qualifier?.hash else 0));
    
    shared ClassDec copy(Identifier? name = this.name, DecQualifier? qualifier = this.qualifier) {
        value ret = ClassDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
