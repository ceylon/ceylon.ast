"A type declaration.
 
 Examples (multi-line):
 
     shared interface Printable {
         shared default void print() {
             package.print(this);
         }
     }
 
     shared alias TypeName => UIdentifier;"
shared abstract class TypeDeclaration()
        of ClassOrInterface
        extends Declaration() {
    
    "The name of the declared type."
    shared actual formal UIdentifier name;
    "The type parameters of the declared type, if present."
    shared formal TypeParameters? typeParameters;
    "The type constraints on the type parameters of the declared type."
    shared formal TypeConstraint[] typeConstraints;
}
