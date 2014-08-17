"An inline variable declaration. 
 
 Assertions and some control structures allow inline declarations of variables.    
 
 Examples:
 
     firstEmployee = employees.first
     Integer|Float num"
shared abstract class Variable()
        of TypedVariable | SpecifiedVariable | UnspecifiedVariable
        extends Node() {
    
    "The name of the variable."
    shared formal MemberName name;
    "The type of the variable, if present.
     
     (If the type isn’t present, it is inferred.)"
    shared formal Type? type;
    "The definition of the variable, if present."
    shared formal Specifier? specifier;
    
    //shared actual formal [Type, LIdentifier, Specifier=]|[LIdentifier, Specifier=] children;
    // TODO use above more precise type when backend bug is fixed
    shared actual formal Node[] children;
}
