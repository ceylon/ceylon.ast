"Abstract interface to perform some operations on AST nodes and possibly get some result.
 
 For every subtype of [[Node]], there is one `transform` method, each returning `Result`.
 These are all `formal`, as there are two sensible default behaviors:
 
 * widening, as done in `WideningTransformer`:
   `transformLIdentifier` delegates to `transformIdentifier`, which in turn
   delegates to `transformNode`, going up their class hierarchy.
 * narrowing, as done in `NarrowingTransformer`:
   `transformIdentifier` switches on [[Identifier]]’s case types and delegates
   to the respective `transform` methods of the subclasses.
 
 Be careful when mixing the two behaviors, lest you end up in an infinite recursion!"
shared interface Transformer<out Result> {
    shared formal Result transformAddAssignmentOperation(AddAssignmentOperation that);
    shared formal Result transformAndAssignmentOperation(AndAssignmentOperation that);
    shared formal Result transformAndOperation(AndOperation that);
    shared formal Result transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that);
    shared formal Result transformArithmeticOperation(ArithmeticOperation that);
    shared formal Result transformAssignOperation(AssignOperation that);
    shared formal Result transformAssignmentOperation(AssignmentOperation that);
    shared formal Result transformAtom(Atom that);
    shared formal Result transformBaseExpression(BaseExpression that);
    shared formal Result transformBaseMeta(BaseMeta that);
    shared formal Result transformBaseType(BaseType that);
    shared formal Result transformBinaryOperation(BinaryOperation that);
    shared formal Result transformCallableType(CallableType that);
    shared formal Result transformCharacterLiteral(CharacterLiteral that);
    shared formal Result transformCompareOperation(CompareOperation that);
    shared formal Result transformComparisonOperation(ComparisonOperation that);
    shared formal Result transformCompilationUnit(CompilationUnit that);
    shared formal Result transformComplementAssignmentOperation(ComplementAssignmentOperation that);
    shared formal Result transformComplementOperation(ComplementOperation that);
    shared formal Result transformDec(Dec that);
    shared formal Result transformDefaultedType(DefaultedType that);
    shared formal Result transformDifferenceOperation(DifferenceOperation that);
    shared formal Result transformDivideAssignmentOperation(DivideAssignmentOperation that);
    shared formal Result transformElseOperation(ElseOperation that);
    shared formal Result transformEntryOperation(EntryOperation that);
    shared formal Result transformEntryType(EntryType that);
    shared formal Result transformEqualOperation(EqualOperation that);
    shared formal Result transformEqualityOperation(EqualityOperation that);
    shared formal Result transformExistsOperation(ExistsOperation that);
    shared formal Result transformExponentiationOperation(ExponentiationOperation that);
    shared formal Result transformExpression(Expression that);
    shared formal Result transformExpressionIsh(ExpressionIsh that);
    shared formal Result transformFloatLiteral(FloatLiteral that);
    shared formal Result transformGivenDec(GivenDec that);
    shared formal Result transformGroupedExpression(GroupedExpression that);
    shared formal Result transformGroupedType(GroupedType that);
    shared formal Result transformIdenticalOperation(IdenticalOperation that);
    shared formal Result transformIdentifier(Identifier that);
    shared formal Result transformIdentityOperation(IdentityOperation that);
    shared formal Result transformInOperation(InOperation that);
    shared formal Result transformIntegerLiteral(IntegerLiteral that);
    shared formal Result transformIntersectAssignmentOperation(IntersectAssignmentOperation that);
    shared formal Result transformIntersectionOperation(IntersectionOperation that);
    shared formal Result transformIntersectionType(IntersectionType that);
    shared formal Result transformIsOperation(IsOperation that);
    shared formal Result transformIterableType(IterableType that);
    shared formal Result transformLIdentifier(LIdentifier that);
    shared formal Result transformLargeAsOperation(LargeAsOperation that);
    shared formal Result transformLargerOperation(LargerOperation that);
    shared formal Result transformLiteral(Literal that);
    shared formal Result transformLogicalAssignmentOperation(LogicalAssignmentOperation that);
    shared formal Result transformLogicalOperation(LogicalOperation that);
    shared formal Result transformMainType(MainType that);
    shared formal Result transformMeasureOperation(MeasureOperation that);
    shared formal Result transformMemberMeta(MemberMeta that);
    shared formal Result transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that);
    shared formal Result transformMeta(Meta that);
    shared formal Result transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that);
    shared formal Result transformNameWithTypeArguments(NameWithTypeArguments that);
    shared formal Result transformNegationOperation(NegationOperation that);
    shared formal Result transformNode(Node that);
    shared formal Result transformNonemptyOperation(NonemptyOperation that);
    shared formal Result transformNotEqualOperation(NotEqualOperation that);
    shared formal Result transformNotOperation(NotOperation that);
    shared formal Result transformOfOperation(OfOperation that);
    shared formal Result transformOperation(Operation that);
    shared formal Result transformOptionalType(OptionalType that);
    shared formal Result transformOrAssignmentOperation(OrAssignmentOperation that);
    shared formal Result transformOrOperation(OrOperation that);
    shared formal Result transformOuter(Outer that);
    shared formal Result transformPackage(Package that);
    shared formal Result transformPostfixDecrementOperation(PostfixDecrementOperation that);
    shared formal Result transformPostfixIncrementOperation(PostfixIncrementOperation that);
    shared formal Result transformPostfixOperation(PostfixOperation that);
    shared formal Result transformPrefixDecrementOperation(PrefixDecrementOperation that);
    shared formal Result transformPrefixIncrementOperation(PrefixIncrementOperation that);
    shared formal Result transformPrefixOperation(PrefixOperation that);
    shared formal Result transformPrimary(Primary that);
    shared formal Result transformPrimaryType(PrimaryType that);
    shared formal Result transformProductOperation(ProductOperation that);
    shared formal Result transformQualifiedExpression(QualifiedExpression that);
    shared formal Result transformQualifiedType(QualifiedType that);
    shared formal Result transformQuotientOperation(QuotientOperation that);
    shared formal Result transformRemainderAssignmentOperation(RemainderAssignmentOperation that);
    shared formal Result transformRemainderOperation(RemainderOperation that);
    shared formal Result transformScaleOperation(ScaleOperation that);
    shared formal Result transformSelfReference(SelfReference that);
    shared formal Result transformSequentialType(SequentialType that);
    shared formal Result transformSetAssignmentOperation(SetAssignmentOperation that);
    shared formal Result transformSetOperation(SetOperation that);
    shared formal Result transformSimpleType(SimpleType that);
    shared formal Result transformSmallAsOperation(SmallAsOperation that);
    shared formal Result transformSmallerOperation(SmallerOperation that);
    shared formal Result transformSpanOperation(SpanOperation that);
    shared formal Result transformStringLiteral(StringLiteral that);
    shared formal Result transformSubtractAssignmentOperation(SubtractAssignmentOperation that);
    shared formal Result transformSumOperation(SumOperation that);
    shared formal Result transformSuper(Super that);
    shared formal Result transformThenOperation(ThenOperation that);
    shared formal Result transformThis(This that);
    shared formal Result transformTupleType(TupleType that);
    shared formal Result transformType(Type that);
    shared formal Result transformTypeDec(TypeDec that);
    shared formal Result transformTypeIsh(TypeIsh that);
    shared formal Result transformTypeList(TypeList that);
    shared formal Result transformTypeMeta(TypeMeta that);
    shared formal Result transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that);
    shared formal Result transformUIdentifier(UIdentifier that);
    shared formal Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that);
    shared formal Result transformUnaryIshOperation(UnaryIshOperation that);
    shared formal Result transformUnaryOperation(UnaryOperation that);
    shared formal Result transformUnaryTypeOperation(UnaryTypeOperation that);
    shared formal Result transformUnionAssignmentOperation(UnionAssignmentOperation that);
    shared formal Result transformUnionOperation(UnionOperation that);
    shared formal Result transformUnionType(UnionType that);
    shared formal Result transformUnionableType(UnionableType that);
    shared formal Result transformValueExpression(ValueExpression that);
    shared formal Result transformVariadicType(VariadicType that);
}
