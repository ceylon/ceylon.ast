"A single function or value import element, that is,
 the name of an imported function or value,
 optionally preceded by a [[type alias|importAlias]],
 and (for `object` imports) optionally followed by [[nested imports|nestedImports]].
 
 Examples:
 
     ln=log
     sysout=out"
shared class ImportFunctionValueElement(name, importAlias = null, nestedImports = null)
        extends ImportElement() {
    
    "The name of the imported function or value."
    shared actual MemberName name;
    "The visible name of the imported function or value."
    shared actual ImportFunctionValueAlias? importAlias;
    "The nested imports of the imported element.
     
     The language specification only allows this for imports of `object`s.
     The compiler, however, also supports it for interoperation with Java:
     It allows you to import members of a class with a lowercase name
     without explicitly “uppercase-ing” that name (via `\\I`).
     See [ceylon/ceylon-spec#323](https://github.com/ceylon/ceylon-spec/issues/323)."
    shared actual ImportElements? nestedImports;
    
    shared actual [ImportFunctionValueAlias, LIdentifier, ImportElements=]|[Identifier, ImportElements=] children;
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
            => transformer.transformImportFunctionValueElement(this);
    
    shared actual Boolean equals(Object that) {
        if (is ImportFunctionValueElement that) {
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
    
    shared ImportFunctionValueElement copy(MemberName name = this.name, ImportFunctionValueAlias? importAlias = this.importAlias, ImportElements? nestedImports = this.nestedImports) {
        value ret = ImportFunctionValueElement(name, importAlias, nestedImports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
