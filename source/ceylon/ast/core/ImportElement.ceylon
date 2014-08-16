"A single import element, that is,
 the name of an imported program element,  
 optionally preceded by an [[alias|importAlias]]
 and/or followed by [[nested import elements|nestedImports]].
 
 Examples:
 
     HashMap
     ln=log
     System { sysout=out }"
shared abstract class ImportElement()
        of ImportTypeElement | ImportFunctionValueElement
        extends Node() {
    
    "The name of the imported element."
    shared formal Identifier name;
    "The visible name of the imported element."
    shared formal ImportAlias? importAlias;
    "The nested imported elements, if present.
     
     (The specification only blesses these for
     [[type import elements|ImportTypeElement]],
     and you only very rarely need them for
     [[function or value import elements|ImportFunctionValueElement]].)"
    shared formal ImportElements? nestedImports;
    
    // TODO use more precise type when backend bug is fixed
    //shared actual formal [ImportAlias, Identifier, ImportElements=]|[Identifier, ImportElements=] children;
    shared actual formal Node[] children;
}
