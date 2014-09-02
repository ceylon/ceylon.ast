"A type reference expression."
shared abstract class TypeDec()
        of GivenDec
        extends Dec() {
    
    "The qualifier of the dec, if present."
    shared formal DecQualifier? qualifier;
    "The name of the declaration."
    shared formal Identifier name;
}
