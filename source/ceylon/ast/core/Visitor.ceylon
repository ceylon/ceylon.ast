"An AST visitor.
 There is one method per AST node; override the methods for which you need to do something,
 and leave the others untouched.
 
 The default operation for most node types is to pass the visit up to the node’s supertype;
 for example, if you override only [[visitIdentifier]], you will receive calls to
 both [[LIdentifier.visit]] and [[UIdentifier.visit]], as the default operation for
 [[visitLIdentifier]] and [[visitUIdentifier]] is to delegate to [[visitIdentifier]].
 [[visitNode]] is different: As the root of the AST class hierarchy, it has no superclass;
 instead, it [[visits all the children|Node.visitChildren]] of the node.
 Thus, the default visitor will already traverse the AST fully,
 and if you need to perform some operation only for some node type that might appear
 anywhere in the AST, you can simply override that particular method and leave the rest as it is."
shared /* abstract */ class Visitor() satisfies WideningTransformer<Anything> { // TODO make interface
    transformAddAssignmentOperation(AddAssignmentOperation that) => visitAddAssignmentOperation(that);
    transformAndAssignmentOperation(AndAssignmentOperation that) => visitAndAssignmentOperation(that);
    transformAndOperation(AndOperation that) => visitAndOperation(that);
    transformAnnotation(Annotation that) => visitAnnotation(that);
    transformAnnotations(Annotations that) => visitAnnotations(that);
    transformAnonymousArgument(AnonymousArgument that) => visitAnonymousArgument(that);
    transformArgumentList(ArgumentList that) => visitArgumentList(that);
    transformArguments(Arguments that) => visitArguments(that);
    transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    transformArithmeticOperation(ArithmeticOperation that) => visitArithmeticOperation(that);
    transformAssignOperation(AssignOperation that) => visitAssignOperation(that);
    transformAssignmentOperation(AssignmentOperation that) => visitAssignmentOperation(that);
    transformAtom(Atom that) => visitAtom(that);
    transformBaseExpression(BaseExpression that) => visitBaseExpression(that);
    transformBaseMeta(BaseMeta that) => visitBaseMeta(that);
    transformBaseType(BaseType that) => visitBaseType(that);
    transformBinaryOperation(BinaryOperation that) => visitBinaryOperation(that);
    transformCallableType(CallableType that) => visitCallableType(that);
    transformCharacterLiteral(CharacterLiteral that) => visitCharacterLiteral(that);
    transformCompareOperation(CompareOperation that) => visitCompareOperation(that);
    transformComparisonOperation(ComparisonOperation that) => visitComparisonOperation(that);
    transformCompilationUnit(CompilationUnit that) => visitCompilationUnit(that);
    transformComplementAssignmentOperation(ComplementAssignmentOperation that) => visitComplementAssignmentOperation(that);
    transformComplementOperation(ComplementOperation that) => visitComplementOperation(that);
    transformDec(Dec that) => visitDec(that);
    transformDefaultedType(DefaultedType that) => visitDefaultedType(that);
    transformDifferenceOperation(DifferenceOperation that) => visitDifferenceOperation(that);
    transformDivideAssignmentOperation(DivideAssignmentOperation that) => visitDivideAssignmentOperation(that);
    transformDynamicValue(DynamicValue that) => visitDynamicValue(that);
    transformElseOperation(ElseOperation that) => visitElseOperation(that);
    transformEntryOperation(EntryOperation that) => visitEntryOperation(that);
    transformEntryType(EntryType that) => visitEntryType(that);
    transformEqualOperation(EqualOperation that) => visitEqualOperation(that);
    transformEqualityOperation(EqualityOperation that) => visitEqualityOperation(that);
    transformExistsOperation(ExistsOperation that) => visitExistsOperation(that);
    transformExponentiationOperation(ExponentiationOperation that) => visitExponentiationOperation(that);
    transformExpression(Expression that) => visitExpression(that);
    transformExpressionIsh(ExpressionIsh that) => visitExpressionIsh(that);
    transformFloatLiteral(FloatLiteral that) => visitFloatLiteral(that);
    transformFullPackageName(FullPackageName that) => visitFullPackageName(that);
    transformGivenDec(GivenDec that) => visitGivenDec(that);
    transformGroupedExpression(GroupedExpression that) => visitGroupedExpression(that);
    transformGroupedType(GroupedType that) => visitGroupedType(that);
    transformIdenticalOperation(IdenticalOperation that) => visitIdenticalOperation(that);
    transformIdentifier(Identifier that) => visitIdentifier(that);
    transformIdentityOperation(IdentityOperation that) => visitIdentityOperation(that);
    transformInOperation(InOperation that) => visitInOperation(that);
    transformIntegerLiteral(IntegerLiteral that) => visitIntegerLiteral(that);
    transformIntersectAssignmentOperation(IntersectAssignmentOperation that) => visitIntersectAssignmentOperation(that);
    transformIntersectionOperation(IntersectionOperation that) => visitIntersectionOperation(that);
    transformIntersectionType(IntersectionType that) => visitIntersectionType(that);
    transformInvocation(Invocation that) => visitInvocation(that);
    transformIsOperation(IsOperation that) => visitIsOperation(that);
    transformIterable(Iterable that) => visitIterable(that);
    transformIterableType(IterableType that) => visitIterableType(that);
    transformLIdentifier(LIdentifier that) => visitLIdentifier(that);
    transformLargeAsOperation(LargeAsOperation that) => visitLargeAsOperation(that);
    transformLargerOperation(LargerOperation that) => visitLargerOperation(that);
    transformLiteral(Literal that) => visitLiteral(that);
    transformLogicalAssignmentOperation(LogicalAssignmentOperation that) => visitLogicalAssignmentOperation(that);
    transformLogicalOperation(LogicalOperation that) => visitLogicalOperation(that);
    transformMainType(MainType that) => visitMainType(that);
    transformMeasureOperation(MeasureOperation that) => visitMeasureOperation(that);
    transformMemberMeta(MemberMeta that) => visitMemberMeta(that);
    transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => visitMemberNameWithTypeArguments(that);
    transformMeta(Meta that) => visitMeta(that);
    transformModuleDec(ModuleDec that) => visitModuleDec(that);
    transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that) => visitMultiplyAssignmentOperation(that);
    transformNameWithTypeArguments(NameWithTypeArguments that) => visitNameWithTypeArguments(that);
    transformNamedArgument(NamedArgument that) => visitNamedArgument(that);
    transformNamedArguments(NamedArguments that) => visitNamedArguments(that);
    transformNegationOperation(NegationOperation that) => visitNegationOperation(that);
    transformNode(Node that) => visitNode(that);
    transformNonemptyOperation(NonemptyOperation that) => visitNonemptyOperation(that);
    transformNotEqualOperation(NotEqualOperation that) => visitNotEqualOperation(that);
    transformNotOperation(NotOperation that) => visitNotOperation(that);
    transformOfOperation(OfOperation that) => visitOfOperation(that);
    transformOperation(Operation that) => visitOperation(that);
    transformOptionalType(OptionalType that) => visitOptionalType(that);
    transformOrAssignmentOperation(OrAssignmentOperation that) => visitOrAssignmentOperation(that);
    transformOrOperation(OrOperation that) => visitOrOperation(that);
    transformOuter(Outer that) => visitOuter(that);
    transformPackage(Package that) => visitPackage(that);
    transformPackageDec(PackageDec that) => visitPackageDec(that);
    transformParameter(Parameter that) => visitParameter(that);
    transformParameterReference(ParameterReference that) => visitParameterReference(that);
    transformPositionalArguments(PositionalArguments that) => visitPositionalArguments(that);
    transformPostfixDecrementOperation(PostfixDecrementOperation that) => visitPostfixDecrementOperation(that);
    transformPostfixIncrementOperation(PostfixIncrementOperation that) => visitPostfixIncrementOperation(that);
    transformPostfixOperation(PostfixOperation that) => visitPostfixOperation(that);
    transformPrefixDecrementOperation(PrefixDecrementOperation that) => visitPrefixDecrementOperation(that);
    transformPrefixIncrementOperation(PrefixIncrementOperation that) => visitPrefixIncrementOperation(that);
    transformPrefixOperation(PrefixOperation that) => visitPrefixOperation(that);
    transformPrimary(Primary that) => visitPrimary(that);
    transformProductOperation(ProductOperation that) => visitProductOperation(that);
    transformQualifiedExpression(QualifiedExpression that) => visitQualifiedExpression(that);
    transformQualifiedType(QualifiedType that) => visitQualifiedType(that);
    transformQuotientOperation(QuotientOperation that) => visitQuotientOperation(that);
    transformRemainderAssignmentOperation(RemainderAssignmentOperation that) => visitRemainderAssignmentOperation(that);
    transformRemainderOperation(RemainderOperation that) => visitRemainderOperation(that);
    transformRequiredParameter(RequiredParameter that) => visitRequiredParameter(that);
    transformScaleOperation(ScaleOperation that) => visitScaleOperation(that);
    transformSelfReference(SelfReference that) => visitSelfReference(that);
    transformSequentialType(SequentialType that) => visitSequentialType(that);
    transformSetAssignmentOperation(SetAssignmentOperation that) => visitSetAssignmentOperation(that);
    transformSetOperation(SetOperation that) => visitSetOperation(that);
    transformSimpleType(SimpleType that) => visitSimpleType(that);
    transformSmallAsOperation(SmallAsOperation that) => visitSmallAsOperation(that);
    transformSmallerOperation(SmallerOperation that) => visitSmallerOperation(that);
    transformSpanOperation(SpanOperation that) => visitSpanOperation(that);
    transformSpecification(Specification that) => visitSpecification(that);
    transformSpecifiedArgument(SpecifiedArgument that) => visitSpecifiedArgument(that);
    transformSpecifier(Specifier that) => visitSpecifier(that);
    transformSpreadArgument(SpreadArgument that) => visitSpreadArgument(that);
    transformStatement(Statement that) => visitStatement(that);
    transformStringLiteral(StringLiteral that) => visitStringLiteral(that);
    transformSubtractAssignmentOperation(SubtractAssignmentOperation that) => visitSubtractAssignmentOperation(that);
    transformSumOperation(SumOperation that) => visitSumOperation(that);
    transformSuper(Super that) => visitSuper(that);
    transformThenOperation(ThenOperation that) => visitThenOperation(that);
    transformThis(This that) => visitThis(that);
    transformTuple(Tuple that) => visitTuple(that);
    transformTupleType(TupleType that) => visitTupleType(that);
    transformType(Type that) => visitType(that);
    transformTypeDec(TypeDec that) => visitTypeDec(that);
    transformTypeList(TypeList that) => visitTypeList(that);
    transformTypeMeta(TypeMeta that) => visitTypeMeta(that);
    transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => visitTypeNameWithTypeArguments(that);
    transformUIdentifier(UIdentifier that) => visitUIdentifier(that);
    transformUnaryArithmeticOperation(UnaryArithmeticOperation that) => visitUnaryArithmeticOperation(that);
    transformUnaryIshOperation(UnaryIshOperation that) => visitUnaryIshOperation(that);
    transformUnaryOperation(UnaryOperation that) => visitUnaryOperation(that);
    transformUnaryTypeOperation(UnaryTypeOperation that) => visitUnaryTypeOperation(that);
    transformUnionAssignmentOperation(UnionAssignmentOperation that) => visitUnionAssignmentOperation(that);
    transformUnionOperation(UnionOperation that) => visitUnionOperation(that);
    transformUnionType(UnionType that) => visitUnionType(that);
    transformUnionableType(UnionableType that) => visitUnionableType(that);
    transformValueSpecification(ValueSpecification that) => visitValueSpecification(that);
    
    shared default void visitAddAssignmentOperation(AddAssignmentOperation that) => super.transformAddAssignmentOperation(that);
    shared default void visitAndAssignmentOperation(AndAssignmentOperation that) => super.transformAndAssignmentOperation(that);
    shared default void visitAndOperation(AndOperation that) => super.transformAndOperation(that);
    shared default void visitAnnotation(Annotation that) => super.transformAnnotation(that);
    shared default void visitAnnotations(Annotations that) => super.transformAnnotations(that);
    shared default void visitAnonymousArgument(AnonymousArgument that) => super.transformAnonymousArgument(that);
    shared default void visitArgumentList(ArgumentList that) => super.transformArgumentList(that);
    shared default void visitArguments(Arguments that) => super.transformArguments(that);
    shared default void visitArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => super.transformArithmeticAssignmentOperation(that);
    shared default void visitArithmeticOperation(ArithmeticOperation that) => super.transformArithmeticOperation(that);
    shared default void visitAssignOperation(AssignOperation that) => super.transformAssignOperation(that);
    shared default void visitAssignmentOperation(AssignmentOperation that) => super.transformAssignmentOperation(that);
    shared default void visitAtom(Atom that) => super.transformAtom(that);
    shared default void visitBaseExpression(BaseExpression that) => super.transformBaseExpression(that);
    shared default void visitBaseMeta(BaseMeta that) => super.transformBaseMeta(that);
    shared default void visitBaseType(BaseType that) => super.transformBaseType(that);
    shared default void visitBinaryOperation(BinaryOperation that) => super.transformBinaryOperation(that);
    shared default void visitCallableType(CallableType that) => super.transformCallableType(that);
    shared default void visitCharacterLiteral(CharacterLiteral that) => super.transformCharacterLiteral(that);
    shared default void visitCompareOperation(CompareOperation that) => super.transformCompareOperation(that);
    shared default void visitComparisonOperation(ComparisonOperation that) => super.transformComparisonOperation(that);
    shared default void visitCompilationUnit(CompilationUnit that) => super.transformCompilationUnit(that);
    shared default void visitComplementAssignmentOperation(ComplementAssignmentOperation that) => super.transformComplementAssignmentOperation(that);
    shared default void visitComplementOperation(ComplementOperation that) => super.transformComplementOperation(that);
    shared default void visitDec(Dec that) => super.transformDec(that);
    shared default void visitDefaultedType(DefaultedType that) => super.transformDefaultedType(that);
    shared default void visitDifferenceOperation(DifferenceOperation that) => super.transformDifferenceOperation(that);
    shared default void visitDivideAssignmentOperation(DivideAssignmentOperation that) => super.transformDivideAssignmentOperation(that);
    shared default void visitDynamicValue(DynamicValue that) => super.transformDynamicValue(that);
    shared default void visitElseOperation(ElseOperation that) => super.transformElseOperation(that);
    shared default void visitEntryOperation(EntryOperation that) => super.transformEntryOperation(that);
    shared default void visitEqualOperation(EqualOperation that) => super.transformEqualOperation(that);
    shared default void visitEqualityOperation(EqualityOperation that) => super.transformEqualityOperation(that);
    shared default void visitExistsOperation(ExistsOperation that) => super.transformExistsOperation(that);
    shared default void visitFullPackageName(FullPackageName that) => super.transformFullPackageName(that);
    shared default void visitIdenticalOperation(IdenticalOperation that) => super.transformIdenticalOperation(that);
    shared default void visitInOperation(InOperation that) => super.transformInOperation(that);
    shared default void visitIntersectAssignmentOperation(IntersectAssignmentOperation that) => super.transformIntersectAssignmentOperation(that);
    shared default void visitInvocation(Invocation that) => super.transformInvocation(that);
    shared default void visitIsOperation(IsOperation that) => super.transformIsOperation(that);
    shared default void visitIterable(Iterable that) => super.transformIterable(that);
    shared default void visitLargeAsOperation(LargeAsOperation that) => super.transformLargeAsOperation(that);
    shared default void visitLargerOperation(LargerOperation that) => super.transformLargerOperation(that);
    shared default void visitLogicalAssignmentOperation(LogicalAssignmentOperation that) => super.transformLogicalAssignmentOperation(that);
    shared default void visitLogicalOperation(LogicalOperation that) => super.transformLogicalOperation(that);
    shared default void visitMeasureOperation(MeasureOperation that) => super.transformMeasureOperation(that);
    shared default void visitModuleDec(ModuleDec that) => super.transformModuleDec(that);
    shared default void visitMultiplyAssignmentOperation(MultiplyAssignmentOperation that) => super.transformMultiplyAssignmentOperation(that);
    shared default void visitNamedArgument(NamedArgument that) => super.transformNamedArgument(that);
    shared default void visitNamedArguments(NamedArguments that) => super.transformNamedArguments(that);
    shared default void visitNonemptyOperation(NonemptyOperation that) => super.transformNonemptyOperation(that);
    shared default void visitNotEqualOperation(NotEqualOperation that) => super.transformNotEqualOperation(that);
    shared default void visitNotOperation(NotOperation that) => super.transformNotOperation(that);
    shared default void visitOfOperation(OfOperation that) => super.transformOfOperation(that);
    shared default void visitOrAssignmentOperation(OrAssignmentOperation that) => super.transformOrAssignmentOperation(that);
    shared default void visitOrOperation(OrOperation that) => super.transformOrOperation(that);
    shared default void visitPackageDec(PackageDec that) => super.transformPackageDec(that);
    shared default void visitParameter(Parameter that) => super.transformParameter(that);
    shared default void visitParameterReference(ParameterReference that) => super.transformParameterReference(that);
    shared default void visitPositionalArguments(PositionalArguments that) => super.transformPositionalArguments(that);
    shared default void visitQuotientOperation(QuotientOperation that) => super.transformQuotientOperation(that);
    shared default void visitEntryType(EntryType that) => super.transformEntryType(that);
    shared default void visitExponentiationOperation(ExponentiationOperation that) => super.transformExponentiationOperation(that);
    shared default void visitExpression(Expression that) => super.transformExpression(that);
    shared default void visitExpressionIsh(ExpressionIsh that) => super.transformExpressionIsh(that);
    shared default void visitFloatLiteral(FloatLiteral that) => super.transformFloatLiteral(that);
    shared default void visitGivenDec(GivenDec that) => super.transformGivenDec(that);
    shared default void visitGroupedExpression(GroupedExpression that) => super.transformGroupedExpression(that);
    shared default void visitGroupedType(GroupedType that) => super.transformGroupedType(that);
    shared default void visitIdentifier(Identifier that) => super.transformIdentifier(that);
    shared default void visitIdentityOperation(IdentityOperation that) => super.transformIdentityOperation(that);
    shared default void visitIntegerLiteral(IntegerLiteral that) => super.transformIntegerLiteral(that);
    shared default void visitIntersectionOperation(IntersectionOperation that) => super.transformIntersectionOperation(that);
    shared default void visitIntersectionType(IntersectionType that) => super.transformIntersectionType(that);
    shared default void visitIterableType(IterableType that) => super.transformIterableType(that);
    shared default void visitLIdentifier(LIdentifier that) => super.transformLIdentifier(that);
    shared default void visitLiteral(Literal that) => super.transformLiteral(that);
    shared default void visitMainType(MainType that) => super.transformMainType(that);
    shared default void visitMemberMeta(MemberMeta that) => super.transformMemberMeta(that);
    shared default void visitMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => super.transformMemberNameWithTypeArguments(that);
    shared default void visitMeta(Meta that) => super.transformMeta(that);
    shared default void visitProductOperation(ProductOperation that) => super.transformProductOperation(that);
    shared default void visitNameWithTypeArguments(NameWithTypeArguments that) => super.transformNameWithTypeArguments(that);
    shared default void visitNegationOperation(NegationOperation that) => super.transformNegationOperation(that);
    shared default void visitNode(Node that) => that.visitChildren(this);
    shared default void visitOperation(Operation that) => super.transformOperation(that);
    shared default void visitOptionalType(OptionalType that) => super.transformOptionalType(that);
    shared default void visitOuter(Outer that) => super.transformOuter(that);
    shared default void visitPackage(Package that) => super.transformPackage(that);
    shared default void visitPostfixDecrementOperation(PostfixDecrementOperation that) => super.transformPostfixDecrementOperation(that);
    shared default void visitPostfixIncrementOperation(PostfixIncrementOperation that) => super.transformPostfixIncrementOperation(that);
    shared default void visitPostfixOperation(PostfixOperation that) => super.transformPostfixOperation(that);
    shared default void visitPrefixDecrementOperation(PrefixDecrementOperation that) => super.transformPrefixDecrementOperation(that);
    shared default void visitPrefixIncrementOperation(PrefixIncrementOperation that) => super.transformPrefixIncrementOperation(that);
    shared default void visitPrefixOperation(PrefixOperation that) => super.transformPrefixOperation(that);
    shared default void visitPrimary(Primary that) => super.transformPrimary(that);
    shared default void visitQualifiedExpression(QualifiedExpression that) => super.transformQualifiedExpression(that);
    shared default void visitQualifiedType(QualifiedType that) => super.transformQualifiedType(that);
    shared default void visitRemainderAssignmentOperation(RemainderAssignmentOperation that) => super.transformRemainderAssignmentOperation(that);
    shared default void visitRemainderOperation(RemainderOperation that) => super.transformRemainderOperation(that);
    shared default void visitRequiredParameter(RequiredParameter that) => super.transformRequiredParameter(that);
    shared default void visitScaleOperation(ScaleOperation that) => super.transformScaleOperation(that);
    shared default void visitSelfReference(SelfReference that) => super.transformSelfReference(that);
    shared default void visitSequentialType(SequentialType that) => super.transformSequentialType(that);
    shared default void visitSetAssignmentOperation(SetAssignmentOperation that) => super.transformSetAssignmentOperation(that);
    shared default void visitSetOperation(SetOperation that) => super.transformSetOperation(that);
    shared default void visitSimpleType(SimpleType that) => super.transformSimpleType(that);
    shared default void visitSmallAsOperation(SmallAsOperation that) => super.transformSmallAsOperation(that);
    shared default void visitSmallerOperation(SmallerOperation that) => super.transformSmallerOperation(that);
    shared default void visitSpanOperation(SpanOperation that) => super.transformSpanOperation(that);
    shared default void visitSpecification(Specification that) => super.transformSpecification(that);
    shared default void visitSpecifiedArgument(SpecifiedArgument that) => super.transformSpecifiedArgument(that);
    shared default void visitSpecifier(Specifier that) => super.transformSpecifier(that);
    shared default void visitSpreadArgument(SpreadArgument that) => super.transformSpreadArgument(that);
    shared default void visitStatement(Statement that) => super.transformStatement(that);
    shared default void visitStringLiteral(StringLiteral that) => super.transformStringLiteral(that);
    shared default void visitSubtractAssignmentOperation(SubtractAssignmentOperation that) => super.transformSubtractAssignmentOperation(that);
    shared default void visitSumOperation(SumOperation that) => super.transformSumOperation(that);
    shared default void visitSuper(Super that) => super.transformSuper(that);
    shared default void visitThenOperation(ThenOperation that) => super.transformThenOperation(that);
    shared default void visitThis(This that) => super.transformThis(that);
    shared default void visitTuple(Tuple that) => super.transformTuple(that);
    shared default void visitTupleType(TupleType that) => super.transformTupleType(that);
    shared default void visitType(Type that) => super.transformType(that);
    shared default void visitTypeDec(TypeDec that) => super.transformTypeDec(that);
    shared default void visitTypeList(TypeList that) => super.transformTypeList(that);
    shared default void visitTypeMeta(TypeMeta that) => super.transformTypeMeta(that);
    shared default void visitTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => super.transformTypeNameWithTypeArguments(that);
    shared default void visitUIdentifier(UIdentifier that) => super.transformUIdentifier(that);
    shared default void visitUnaryArithmeticOperation(UnaryArithmeticOperation that) => super.transformUnaryArithmeticOperation(that);
    shared default void visitUnaryIshOperation(UnaryIshOperation that) => super.transformUnaryIshOperation(that);
    shared default void visitUnaryOperation(UnaryOperation that) => super.transformUnaryOperation(that);
    shared default void visitUnaryTypeOperation(UnaryTypeOperation that) => super.transformUnaryTypeOperation(that);
    shared default void visitUnionAssignmentOperation(UnionAssignmentOperation that) => super.transformUnionAssignmentOperation(that);
    shared default void visitUnionOperation(UnionOperation that) => super.transformUnionOperation(that);
    shared default void visitUnionType(UnionType that) => super.transformUnionType(that);
    shared default void visitUnionableType(UnionableType that) => super.transformUnionableType(that);
    shared default void visitValueSpecification(ValueSpecification that) => super.transformValueSpecification(that);
}
