"A list of statements and declarations, surrounded by braces.
 
 Examples:
 
     {}
     { shared String name; string => name; }"
shared abstract class Body()
        of Block | ClassBody | InterfaceBody
        extends Node() {
    
    "The content of the body."
    shared formal <Declaration|Statement>[] content;
    
    shared actual formal <Declaration|Statement>[] children;
}
