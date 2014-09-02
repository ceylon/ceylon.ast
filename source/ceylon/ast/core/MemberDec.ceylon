"A member reference expression.
 
 Examples:
 
     `value null`
     `function Iterable.map`"
shared abstract class MemberDec()
        of ValueDec | FunctionDec
        extends Dec() {
    
    "The qualifier of the dec, if present."
    shared formal DecQualifier? qualifier;
    "The name of the declaration."
    shared formal LIdentifier name;
    
    shared actual formal <DecQualifier|LIdentifier>[] children;
}
