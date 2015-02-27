"An interface reference expression, that is,
 the [[name]] of an interface,
 optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 or empty for the current interface,
 prefixed by the type keyword `interface` and surrounded by backticks.
 
 Examples:
 
     `interface Iterable`
     `interface A.B.C`
     `interface`"
shared class InterfaceDec(name, qualifier = null)
        extends TypeDec() {
    
    shared actual UIdentifier? name;
    shared actual DecQualifier? qualifier;
    
    keyword = "interface";
    
    "If the qualifier exists, the name must exist as well"
    assert (!qualifier exists || name exists);
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), emptyOrSingleton(name));
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInterfaceDec(this);
    
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
