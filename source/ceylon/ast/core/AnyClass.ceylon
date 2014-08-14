"""A class definition or alias.
   
   Examples (multi-line):
   
       shared class PrintableWrapper<T>(shared T wrapped)
               satisfies Printable {
           shared actual void print() {
               package.print(wrapped else "<null>");
           }
       }
   
       shared class VariadicString(Character* characters) => String(characters);"""
shared abstract class AnyClass()
        of ClassDefinition
        extends ClassOrInterface() {
    
    "The parameters of the class."
    shared formal Parameters parameters;
    "The extended type of the class, if present."
    shared formal ExtendedType? extendedType;
}
