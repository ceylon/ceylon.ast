"“Main” types: the types that you normally use.
 
 This class is used as “Type, except EntryType” in [[EntryType]] and [[VariadicType]],
 since both of these can’t have entry types as children.
 In other words, this class is only there to represent how types are parsed,
 not their semantics."
shared abstract class MainType(TypeIsh[] kids)
        of UnionType|UnionableType
        extends Type(kids) {
}
