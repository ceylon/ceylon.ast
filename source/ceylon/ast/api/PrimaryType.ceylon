"A primary type; only [[intersection|IntersectionType]]
 and [[union types|UnionType]] come before these."
shared abstract class PrimaryType(TypeIsh[] children)
        of SimpleType|IterableType|GroupedType
        extends Type(children) {
}
