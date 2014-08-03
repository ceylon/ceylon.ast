"A nonempty list of case types, separated by the union operator (‘`|`’).
 
 Examples:
 
     of String | Float | Integer
     of Other
     of empty | [Element+]"
shared class CaseTypes(caseTypes)
        extends Node() {
    
    "The case types.
     
     Each case type can be:
     - a [[member name|LIdentifier]], referring to a toplevel object, or
     - a [[primary type|PrimaryType]]."
    shared [<PrimaryType|MemberName>+] caseTypes;
    
    shared actual [<PrimaryType|MemberName>+] children = caseTypes;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformCaseTypes(this);
    
    shared actual Boolean equals(Object that) {
        if (is CaseTypes that) {
            return caseTypes == that.caseTypes;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * caseTypes.hash;
    
    shared CaseTypes copy([<PrimaryType|MemberName>+] caseTypes = this.caseTypes) {
        value ret = CaseTypes(caseTypes);
        copyExtraInfoTo(ret);
        return ret;
    }
}
