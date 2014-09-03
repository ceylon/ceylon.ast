"""A class or interface declaration.
   
   Examples (multi-line):
   
       shared class PrintableWrapper<T>(shared T wrapped)
               satisfies Printable {
           shared actual void print() {
               package.print(wrapped else "<null>");
           }
       }
   
       shared interface 3DSized<Unit>
               given Unit satisfies Numeric<Unit> {
           shared formal Unit width;
           shared formal Unit length;
           shared formal Unit height;
       }"""
shared abstract class ClassOrInterface()
        of AnyClass | AnyInterface
        extends TypeDeclaration() {
    
    "The case types of the class or interface, if present."
    shared formal CaseTypes? caseTypes;
    "The satisfied types of the class or interface, if present."
    shared formal SatisfiedTypes? satisfiedTypes;
}
