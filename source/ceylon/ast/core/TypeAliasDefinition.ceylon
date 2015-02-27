"A type alias definition.
 
 A type alias definition has the following components:
 - [[annotations]],
 - the ‘`alias`’ keyword,
 - the [[name]],
 - the [[type parameters|typeParameters]], if present,
 - the [[type constraints|typeConstraints]], if any,
 - the [[specifier]], and
 - a terminating semicolon.
 
 Examples:
 
     alias Primitive => Boolean|Integer|Float|Character|String|Null;
     alias AnyMutableSet<Element> given Element satisfies Object => Set<Element>&SetMutator<Element>;"
shared class TypeAliasDefinition(name, specifier, typeParameters = null, typeConstraints = [], annotations = Annotations())
        extends TypeDeclaration() {
    
    "The name of the type alias."
    shared actual UIdentifier name;
    "The specifier of the type alias."
    shared TypeSpecifier specifier;
    "The type parameters of the type alias, if present."
    shared actual TypeParameters? typeParameters;
    "The type constraints of the type alias, if any."
    shared actual TypeConstraint[] typeConstraints;
    "The annotations of the type alias."
    shared actual Annotations annotations;
    
    shared actual <Annotations|UIdentifier|TypeParameters|TypeConstraint|TypeSpecifier>[] children
            = concatenate(
        [annotations],
        [name],
        emptyOrSingleton(typeParameters),
        typeConstraints,
        [specifier]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeAliasDefinition(this);
    
    shared actual Boolean equals(Object that) {
        if (is TypeAliasDefinition that) {
            if (exists typeParameters) {
                if (exists typeParameters_ = that.typeParameters) {
                    if (typeParameters != typeParameters_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.typeParameters exists) {
                return false;
            }
            return name == that.name && specifier == that.specifier && typeConstraints == that.typeConstraints && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * (specifier.hash + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))));
    
    shared TypeAliasDefinition copy(UIdentifier name = this.name, TypeSpecifier specifier = this.specifier, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = TypeAliasDefinition(name, specifier, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
