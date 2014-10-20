"A type reference expression."
shared abstract class TypeDec()
        of ClassDec | InterfaceDec | AliasDec | GivenDec
        extends Dec() {
    
    "The qualifier of the dec, if present."
    shared formal DecQualifier? qualifier;
    "The name of the declaration,
     or [[null]] for a reference to the current type
     (only in a [[ClassDec]] or [[InterfaceDec]])."
    shared formal Identifier? name;
}
