"""A declaration.
   
   Most declarations either [[define|TypeDeclaration]] or [[have|TypedDeclaration]] a type.
   
   The general order of the children of a declaration is as follows:
   
       Annotations
       (Modifier | Type) Identifier TypeParameters? Parameters*
       CaseTypes? ExtendedType? SatisfiedTypes?
       TypeConstraints?
       (Body | AnySpecifier? ";")
   
   However, the only children common to all declarations are the [[name]]
   of the declared program element and its [[annotations]].
   
   Examples:
   
       shared actual String string => "``outer.string`` by ``step``";
       shared class Person(shared String name) { string => name; }"""
shared abstract class Declaration()
        of TypeDeclaration | TypedDeclaration
        extends Node() {
    
    "The name of the declared program element."
    shared formal Identifier name;
    "The annotations on the declaration."
    shared formal Annotations annotations;
}
