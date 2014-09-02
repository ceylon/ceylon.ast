"A type reference expression."
shared abstract class TypeDec()
        of ClassDec | InterfaceDec | GivenDec
        extends Dec() {
    
    "The qualifier of the dec, if present."
    shared formal DecQualifier? qualifier;
    "The name of the declaration."
    shared formal Identifier name;
}
