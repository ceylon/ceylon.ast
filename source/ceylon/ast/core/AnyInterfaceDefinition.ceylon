"A regular or dynamic interface definition.
 
 Examples (multi-line):
 
     shared interface Printable {
         shared default void print() => package.print(this);
     }
 
     shared dynamic Document {
         shared formal String xmlVersion;
         shared formal StyleSheetList styleSheets;
         shared formal String documentURI;
         // ...
     }"
shared abstract class AnyInterfaceDefinition()
        of InterfaceDefinition | DynamicInterfaceDefinition
        extends AnyInterface() {
    
    "The body of the interface."
    shared formal InterfaceBody body;
}
