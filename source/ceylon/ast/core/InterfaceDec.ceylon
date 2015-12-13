"An interface reference expression, that is,
 the [[name]] of an interface,
 optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 or empty for the current interface,
 prefixed by the type keyword `interface` and surrounded by backticks.
 
 The [[qualifier]] may only be null if the [[name]] is also null.
 If the name exists, the qualifier must exist as well (but may of course be empty).
 
 Examples:
 
     `interface Iterable`
     `interface A.B.C`
     `interface`"
shared class InterfaceDec(name, qualifier = DecQualifier())
        extends TypeDec() {
    
    shared actual UIdentifier? name;
    shared actual DecQualifier? qualifier;
    
    keyword = "interface";
    
    "Qualifier must exist iff name exists"
    assert (qualifier exists == name exists);
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), emptyOrSingleton(name));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInterfaceDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitInterfaceDec(this);

    shared actual Boolean equals(Object that) {
        if (is InterfaceDec that) {
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
    
    shared InterfaceDec copy(UIdentifier? name = this.name, DecQualifier? qualifier = this.qualifier) {
        value ret = InterfaceDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
