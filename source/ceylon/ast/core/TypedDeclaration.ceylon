"A declaration with a type.
 
 The type can either be explicitly specified ([[type]] is a [[Type]])
 or inferred ([[type]] is a [[Modifier]] that indicates type inference).
 
 Examples:
 
     shared String name;
     shared actual void visit(Node that) { print(that); that.visitChildren(this); }"
shared abstract class TypedDeclaration()
        of AnyValue | AnyFunction
        extends Declaration() {
    
    "The type of the declaration, or a
     modifier indicating type inference."
    shared formal Type|VariadicType|TypeModifier type;
    "The definition of the declaration, if present."
    shared formal AnySpecifier|Block? definition;
}
