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
        of ClassDefinition | ClassAliasDefinition
        extends ClassOrInterface() {
    
    "The parameters of the class, if present.
     
     A [[ClassDefinition]] may omit the parameters,
     defining one or more [[constructors|ConstructorDefinition]] instead."
    shared formal Parameters? parameters;
    "The extended type of the class, if present."
    shared formal ExtendedType? extendedType;
}
