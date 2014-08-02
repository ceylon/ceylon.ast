"All node types in the type sub-hierarchy:
 [[Type]] and some auxiliary node types that aren’t proper Types.
 
 (For example, while `String*` is part of the valid type `{String*}`,
 it’s not a valid type by itself.)"
shared abstract class TypeIsh()
        of Type | NameWithTypeArguments | VariadicType | DefaultedType | TypeList | TypeArgument | TypeArguments
        extends ExpressionIsh() {
    shared actual formal <TypeIsh|Identifier|Variance>[] children;
}

"Representation of a type."
shared abstract class Type()
        of MainType | EntryType
        extends TypeIsh() {
    
    shared actual formal TypeIsh[] children;
    
    "Tests for equality of two type nodes.
     
     Note: This does __not__ test for equality of the represented types!
     For example, even though the types `X|Y` and `Y|X` are considered equal
     by the language, the nodes `UnionType(x, y)` and `UnionType(y, x)` are
     _not_ considered equal.
     (Type equality is a complicated problem, the solution of which doesn’t
      belong in `ceylon.ast`.)"
    shared actual formal Boolean equals(Object that);
}
