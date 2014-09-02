"An interface reference expression, that is,
 the [[name]] of an interface, optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the type keyword `interface` and surrounded by backticks.
 
 Examples:
 
     `interface Iterable`
     `interface A.B.C`"
shared class InterfaceDec(name, qualifier = null)
        extends TypeDec() {
    
    shared actual UIdentifier name;
    shared actual DecQualifier? qualifier;
    
    keyword = "interface";
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInterfaceDec(this);
    
    shared actual Boolean equals(Object that) {
        if (is InterfaceDec that) {
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
    
    shared InterfaceDec copy(UIdentifier name = this.name, DecQualifier? qualifier = this.qualifier) {
        value ret = InterfaceDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
