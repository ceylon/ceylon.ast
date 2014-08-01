"A value declaration or definition.
 
 If the [[definition]] is [[missing|null]] or a [[specifier|AnySpecifier]], then the statement
 must be terminated by a semicolon; if it’s a [[Block]], the semicolon is not necesary.
 
 Examples:
 
     shared String name;
     shared formal Comparison compare(Other that);
     shared default Boolean empty => iterator().next() is Finished;"
shared abstract class AnyValue()
        of ValueDeclaration | ValueDefinition
        extends TypedDeclaration() {
    
    shared actual formal [Annotations, Type|Modifier, LIdentifier, AnySpecifier|Block=] children;
}
