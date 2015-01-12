"An import alias, that is, an identifier followed by an “equals” character.
 
 (Not to be confused with an [[alias *declaration*|TypeAliasDefinition]] like `alias TypeName => UIdentifier;`.)
 
 Examples:
 
     JString=
     sysout="
shared abstract class ImportAlias()
        of ImportTypeAlias | ImportFunctionValueAlias
        extends Node() {
    
    "The visible name of the imported element.
     
     (This would probably be called `alias` if that weren’t a keyword.)"
    shared formal Identifier name;
    
    shared actual formal [Identifier] children;
}
