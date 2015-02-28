"A comma-separated list of import elements,
 where the last element may optionally be a wildcard instead,
 surrounded by braces.
 
 Import elements may not be empty.
 
 (`ceylon.ast` `ImportElements` are slightly different from the
 specification’s `ImportElements`; in the specification,
 the surrounding braces are always part of the “parent” node
 (`Import`, `ImportTypeElement`), while in `ceylon.ast`, they
 are part of the `ImportElements`.)
 
 Examples:
 
     MutableList, ArrayList
     JString=String, System { sysout=out }"
shared class ImportElements(elements = [], wildcard = null)
        extends Node() {
    
    "The regular import elements."
    shared ImportElement[] elements;
    "The import wildcard, if present."
    shared ImportWildcard? wildcard;
    
    "Import elements may not be empty"
    assert (nonempty children_ = concatenate(elements, emptyOrSingleton(wildcard)));
    shared actual [<ImportElement|ImportWildcard>+] children = children_;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImportElements(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportElements that) {
            if (exists wildcard) {
                if (exists wildcard_ = that.wildcard) {
                    if (wildcard != wildcard_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.wildcard exists) {
                return false;
            }
            return elements == that.elements;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (elements.hash + 31 * (wildcard?.hash else 0));
    
    shared ImportElements copy(ImportElement[] elements = this.elements, ImportWildcard? wildcard = this.wildcard) {
        value ret = ImportElements(elements, wildcard);
        copyExtraInfoTo(ret);
        return ret;
    }
}
