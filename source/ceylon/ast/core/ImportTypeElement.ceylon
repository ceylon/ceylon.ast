"A single type import element, that is,
 the name of an imported type,
 optionally preceded by a [[type alias|importAlias]]
 and/or followed by [[nested import elements|nestedImports]]
 to import and rename members.
 
 Examples:
 
     HashMap
     System { sysout=out }"
shared class ImportTypeElement(name, importAlias = null, nestedImports = null)
        extends ImportElement() {
    
    "The name of the imported type."
    shared actual TypeName name;
    "The visible name of the imported type, if present."
    shared actual ImportTypeAlias? importAlias;
    "The nested imported elements from this type, if present."
    shared actual ImportElements? nestedImports;
    
    // TODO use more precise type when backend bug is fixed
    //shared actual [ImportTypeAlias, UIdentifier, ImportElements=]|[UIdentifier, ImportElements=] children;
    shared actual Node[] children;
    if (exists importAlias) {
        if (exists nestedImports) {
            children = [importAlias, name, nestedImports];
        } else {
            children = [importAlias, name];
        }
    } else {
        if (exists nestedImports) {
            children = [name, nestedImports];
        } else {
            children = [name];
        }
    }
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformImportTypeElement(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportTypeElement that) {
            if (exists importAlias) {
                if (exists importAlias_ = that.importAlias) {
                    if (importAlias != importAlias_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.importAlias exists) {
                return false;
            }
            if (exists nestedImports) {
                if (exists nestedImports_ = that.nestedImports) {
                    if (nestedImports != nestedImports_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.nestedImports exists) {
                return false;
            }
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * ((importAlias?.hash else 0) + 31 * (nestedImports?.hash else 0)));
    
    shared ImportTypeElement copy(TypeName name = this.name, ImportTypeAlias? importAlias = this.importAlias, ImportElements? nestedImports = this.nestedImports) {
        value ret = ImportTypeElement(name, importAlias, nestedImports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
