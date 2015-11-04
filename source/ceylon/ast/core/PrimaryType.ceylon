"A primary type; only [[intersection|IntersectionType]]
 and [[union types|UnionType]] come before these."
shared abstract class PrimaryType()
        of SimpleType | TupleType | IterableType | GroupedType | OptionalType | SequentialType | CallableType
        extends UnionableType() {
}
