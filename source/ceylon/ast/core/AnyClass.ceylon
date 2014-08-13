"""A class definition or alias.
   
   Examples:
   
       shared class PrintableWrapper<T>(shared T wrapped)
               satisfies Printable {
           shared actual void print() {
               package.print(wrapped else "<null>");
           }
       }
   
       TODO multi-line
       shared class VariadicString(Character* characters) => String(characters);"""
shared abstract class AnyClass()
        of ClassDefinition
        extends ClassOrInterface() {
    
    "The parameters of the class."
    shared formal Parameters parameters;
    "The extended type of the class, if present."
    shared formal ExtendedType? extendedType;
}
