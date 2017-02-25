import ceylon.ast.core {
    TypeList
}

"A collection of `String->TypeList` items.
 
 Not a [[ConcreteTest]] because there’s no RedHat AST equivalent."
object typeList {
    shared String->TypeList emptyTypeList = "" -> TypeList([]);
    shared String->TypeList stringPlusTypeList = variadicType.stringPlusType.key -> TypeList([], variadicType.stringPlusType.item);
    shared String->TypeList integerFloatDefaultedStringStarTypeList
            = ",".join { for (t in { baseType.integerType, defaultedType.floatDefaultedType, variadicType.stringStarType }) t.key } -> TypeList([baseType.integerType.item, defaultedType.floatDefaultedType.item], variadicType.stringStarType.item);
    shared String->TypeList floatStarTypeList = variadicType.floatStarType.key -> TypeList([], variadicType.floatStarType.item);
}
