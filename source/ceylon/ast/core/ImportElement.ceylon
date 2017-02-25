"A single import element, that is,
 the name of an imported program element,  
 optionally preceded by an [[alias|importAlias]]
 and/or followed by [[nested import elements|nestedImports]]
 to import and rename members.
 
 The specification distinguishes between `ImportTypeElement`s, `ImportObjectElement`s and `ImportFunctionValueElement`s,
 which differ in the kinds of identifiers they specify and in whether or not they may contain nested imports.
 However, the compiler does not actually enforce this distinction (mainly for improved interoperation with Java),
 and in `ceylon.ast` they are all merged into this one class.
 
 Examples:
 
     HashMap
     ln=log
     System { sysout=\\iout }"
shared class ImportElement(name, importAlias = null, nestedImports = null)
        extends Node() {
    
    "The name of the imported element."
    shared Identifier name;
    "The visible name of the imported element, if present."
    shared ImportAlias? importAlias;
    "The nested imported elements, if present."
    shared ImportElements? nestedImports;
    
    shared actual [ImportAlias, Identifier, ImportElements=]|[Identifier, ImportElements=] children;
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
            => transformer.transformImportElement(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitImportElement(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportElement that) {
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
    
    shared ImportElement copy(Identifier name = this.name, ImportAlias? importAlias = this.importAlias, ImportElements? nestedImports = this.nestedImports) {
        value ret = ImportElement(name, importAlias, nestedImports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
