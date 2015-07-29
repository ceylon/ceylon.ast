"An extension or construction, that is,
 anything that can go in an [[extended type|ExtendedType]] or [[class specifier|ClassSpecifier]].
 
 Examples:
 
     Object()
     Point.cartesian(x, y, 0.0)"
shared abstract class ExtensionOrConstruction()
        of Extension | Construction
        extends Node() {
    
    "The name of the extended class or invoked constructor."
    shared formal NameWithTypeArguments nameAndArgs;
    "The arguments to the extended class or invoked constructor, if any."
    shared formal PositionalArguments? arguments;
    "The qualifier, if any."
    shared formal BaseType|PackageQualifier|Super? qualifier;
    
    shared actual formal <NameWithTypeArguments|PositionalArguments|BaseType|PackageQualifier|Super>[] children;
}
