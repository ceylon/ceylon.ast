"An interface definition or alias.
 
 Examples (multi-line):
 
     shared interface Printable {
         shared default void print() => package.print(this);
     }
 
     shared interface People => {Person*};"
shared abstract class AnyInterface()
        of AnyInterfaceDefinition
        extends ClassOrInterface() {
}
