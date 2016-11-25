"A list of statements and declarations, surrounded by braces.
 
 A body may also include a list of [[imports]]
 that is local to this body only.
 
 Examples:
 
     {}
     { shared String name; string => name; }"
shared abstract class Body()
        of Block | ClassBody | InterfaceBody
        extends Node() {
    
    "The imports of this body."
    shared formal Import[] imports;
    "The content of the body."
    shared formal <Declaration|Statement>[] content;
    
    shared actual formal <Import|Declaration|Statement>[] children;
}
