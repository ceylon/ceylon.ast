"A set operation: [[intersection|IntersectionOperation]], [[union|UnionOperation]] or [[complement|ComplementOperation]]."
shared abstract class SetOperation()
        of IntersectionOperation | UnionOperation | ComplementOperation
        extends BinaryOperation() {
}
