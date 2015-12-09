"A constructor definition.
 
 A constructor may be either a [[callable constructor|CallableConstructorDefinition]] or a [[value constructor|ValueConstructorDefinition]].
 
 Examples (multi-line):
 
     // 2D point
     shared new polar(r, φ) {
         Float r;
         Float φ;
         this.x = r * cos(φ);
         this.y = r * sin(φ);
         this.r = r;
         this.φ = φ;
     }
 
     shared new origin {
         x = 0.0; y = 0.0;
         r = 0.0; φ = 0.0;
     }"
shared abstract class ConstructorDefinition()
        of CallableConstructorDefinition | ValueConstructorDefinition
        extends Declaration() {
    
    "The name of the constructor, if present.
     
     An absent name is only allowed for a callable constructor,
     in which case it is the default constructor."
    shared actual formal LIdentifier? name;
    "The parameters of the constructor, if applicable.
     
     Callable constructors have parameters, value constructors do not."
    shared formal Parameters? parameters;
    "The block of the constructor."
    shared formal Block block;
    "The extended type of the constructor, if present."
    shared formal ExtendedType? extendedType;
    
    shared actual formal <Annotations|LIdentifier|Parameters|ExtendedType|Block>[] children;
}
