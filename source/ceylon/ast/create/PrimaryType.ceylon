import ceylon.ast.core {
    PrimaryType
}

shared alias PrimaryTypeIsh => PrimaryType|IdentifierIsh;

"""Converts a [[type name|name]] to a [[PrimaryType]].
   
   **This function is not intended for external use.**
   Use [[baseType]] or [[qualifiedType]] instead.
   It exists only for use in other functions like
   [[caseTypes]] and [[satisfiedTypes]]."""
shared PrimaryType primaryType(PrimaryTypeIsh name) {
    switch (name)
    case (is PrimaryType) { return name; }
    case (is IdentifierIsh) { return baseType(name); }
}
