"A primary type; only [[intersection|IntersectionType]],
 [[union|UnionType]] and [[entry types|EntryType]] come before these."
shared abstract class PrimaryType()
        of SimpleType | TupleType | IterableType | GroupedType | OptionalType | SequentialType | CallableType
        extends UnionableType() {
}
