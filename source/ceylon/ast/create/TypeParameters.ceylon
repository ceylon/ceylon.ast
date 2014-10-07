import ceylon.ast.core {
    TypeParameter,
    TypeParameters
}

shared alias TypeParameterIsh => TypeParameter|IdentifierIsh;

"""A utility function to create [[TypeParameters]] from a stream of objects
   that can readily be converted to a [[TypeParameter]].
   
   Usage examples:
   
       typeParameters("Other") // self type
       typeParameters("Element") // invariant, e. g. MutableList
       typeParameters(
           TypeParameter(UIdentifier("Element"), OutModifier()),
           TypeParameter(UIdentifier("Absent"), OutModifier(), baseType("Null"))
       ) // covariant, e. g. Iterable 
   """
shared TypeParameters typeParameters(TypeParameterIsh+ typeParameters) {
    return TypeParameters(typeParameters.collect {
            TypeParameter collecting(TypeParameterIsh typeParameter) {
                switch (typeParameter)
                case (is TypeParameter) { return typeParameter; }
                case (is IdentifierIsh) { return TypeParameter(uidentifier(typeParameter)); }
            }
        });
}
