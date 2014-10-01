"A [[NarrowingTransformer]] that narrows immediately to the type of the visited subject
 by invoking its [[`transform`|Node.transform]] method.
 
 For example:
 ~~~
 shared actual default Result transformValueExpression(ValueExpression that)
         => that.transform(this);
 ~~~
 
 This interface should be functionally equivalent to [[CascadingNarrowingTransformer]],
 but is likely a lot faster because it uses only a single virtual method lookup
 instead of a series of type checks and calls."
shared interface ImmediateNarrowingTransformer<out Result> satisfies NarrowingTransformer<Result> {
    shared actual default Result transformAddingExpression(AddingExpression that)
            => that.transform(this);
    shared actual default Result transformAnyClass(AnyClass that)
            => that.transform(this);
    shared actual default Result transformAnyCompilationUnit(AnyCompilationUnit that)
            => that.transform(this);
    shared actual default Result transformAnyFunction(AnyFunction that)
            => that.transform(this);
    shared actual default Result transformAnyInterface(AnyInterface that)
            => that.transform(this);
    shared actual default Result transformAnyInterfaceDefinition(AnyInterfaceDefinition that)
            => that.transform(this);
    shared actual default Result transformAnyMemberOperator(AnyMemberOperator that)
            => that.transform(this);
    shared actual default Result transformAnySpecifier(AnySpecifier that)
            => that.transform(this);
    shared actual default Result transformAnyValue(AnyValue that)
            => that.transform(this);
    shared actual default Result transformArguments(Arguments that)
            => that.transform(this);
    shared actual default Result transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that)
            => that.transform(this);
    shared actual default Result transformArithmeticOperation(ArithmeticOperation that)
            => that.transform(this);
    shared actual default Result transformAssigningExpression(AssigningExpression that)
            => that.transform(this);
    shared actual default Result transformAssignmentOperation(AssignmentOperation that)
            => that.transform(this);
    shared actual default Result transformAtom(Atom that)
            => that.transform(this);
    shared actual default Result transformBinaryOperation(BinaryOperation that)
            => that.transform(this);
    shared actual default Result transformBody(Body that)
            => that.transform(this);
    shared actual default Result transformBound(Bound that)
            => that.transform(this);
    shared actual default Result transformCaseItem(CaseItem that)
            => that.transform(this);
    shared actual default Result transformClassOrInterface(ClassOrInterface that)
            => that.transform(this);
    shared actual default Result transformComparingExpression(ComparingExpression that)
            => that.transform(this);
    shared actual default Result transformComparisonOperation(ComparisonOperation that)
            => that.transform(this);
    shared actual default Result transformComprehensionClause(ComprehensionClause that)
            => that.transform(this);
    shared actual default Result transformCondition(Condition that)
            => that.transform(this);
    shared actual default Result transformConjoiningExpression(ConjoiningExpression that)
            => that.transform(this);
    shared actual default Result transformControlStructure(ControlStructure that)
            => that.transform(this);
    shared actual default Result transformDec(Dec that)
            => that.transform(this);
    shared actual default Result transformDeclaration(Declaration that)
            => that.transform(this);
    shared actual default Result transformDefaultedParameter(DefaultedParameter that)
            => that.transform(this);
    shared actual default Result transformDirective(Directive that)
            => that.transform(this);
    shared actual default Result transformDisjoiningExpression(DisjoiningExpression that)
            => that.transform(this);
    shared actual default Result transformEqualityOperation(EqualityOperation that)
            => that.transform(this);
    shared actual default Result transformEquatingExpression(EquatingExpression that)
            => that.transform(this);
    shared actual default Result transformExistsNonemptyExpression(ExistsNonemptyExpression that)
            => that.transform(this);
    shared actual default Result transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that)
            => that.transform(this);
    shared actual default Result transformExponentiatingExpression(ExponentiatingExpression that)
            => that.transform(this);
    shared actual default Result transformExpression(Expression that)
            => that.transform(this);
    shared actual default Result transformExpressionIsh(ExpressionIsh that)
            => that.transform(this);
    shared actual default Result transformExpressionStatement(ExpressionStatement that)
            => that.transform(this);
    shared actual default Result transformForIterator(ForIterator that)
            => that.transform(this);
    shared actual default Result transformIdentifier(Identifier that)
            => that.transform(this);
    shared actual default Result transformImportAlias(ImportAlias that)
            => that.transform(this);
    shared actual default Result transformImportElement(ImportElement that)
            => that.transform(this);
    shared actual default Result transformInitialComprehensionClause(InitialComprehensionClause that)
            => that.transform(this);
    shared actual default Result transformInlineDefinitionArgument(InlineDefinitionArgument that)
            => that.transform(this);
    shared actual default Result transformIntersectingExpression(IntersectingExpression that)
            => that.transform(this);
    shared actual default Result transformInvertingExpression(InvertingExpression that)
            => that.transform(this);
    shared actual default Result transformLiteral(Literal that)
            => that.transform(this);
    shared actual default Result transformLocalModifier(LocalModifier that)
            => that.transform(this);
    shared actual default Result transformLogicalAssignmentOperation(LogicalAssignmentOperation that)
            => that.transform(this);
    shared actual default Result transformLogicalOperation(LogicalOperation that)
            => that.transform(this);
    shared actual default Result transformMainType(MainType that)
            => that.transform(this);
    shared actual default Result transformMemberDec(MemberDec that)
            => that.transform(this);
    shared actual default Result transformMeta(Meta that)
            => that.transform(this);
    shared actual default Result transformMetaQualifier(MetaQualifier that)
            => that.transform(this);
    shared actual default Result transformModifier(Modifier that)
            => that.transform(this);
    shared actual default Result transformMultiplyingExpression(MultiplyingExpression that)
            => that.transform(this);
    shared actual default Result transformNamedArgument(NamedArgument that)
            => that.transform(this);
    shared actual default Result transformNameWithTypeArguments(NameWithTypeArguments that)
            => that.transform(this);
    shared actual default Result transformNegatingExpression(NegatingExpression that)
            => that.transform(this);
    shared actual default Result transformNode(Node that)
            => that.transform(this);
    shared actual default Result transformOperation(Operation that)
            => that.transform(this);
    shared actual default Result transformParameter(Parameter that)
            => that.transform(this);
    shared actual default Result transformPostfixOperation(PostfixOperation that)
            => that.transform(this);
    shared actual default Result transformPrefixOperation(PrefixOperation that)
            => that.transform(this);
    shared actual default Result transformPrePostfixingExpression(PrePostfixingExpression that)
            => that.transform(this);
    shared actual default Result transformPrimary(Primary that)
            => that.transform(this);
    shared actual default Result transformPrimaryType(PrimaryType that)
            => that.transform(this);
    shared actual default Result transformRangeSubscript(RangeSubscript that)
            => that.transform(this);
    shared actual default Result transformRequiredParameter(RequiredParameter that)
            => that.transform(this);
    shared actual default Result transformScalingExpression(ScalingExpression that)
            => that.transform(this);
    shared actual default Result transformSelfReference(SelfReference that)
            => that.transform(this);
    shared actual default Result transformSetAssignmentOperation(SetAssignmentOperation that)
            => that.transform(this);
    shared actual default Result transformSetOperation(SetOperation that)
            => that.transform(this);
    shared actual default Result transformSimpleType(SimpleType that)
            => that.transform(this);
    shared actual default Result transformSpanningExpression(SpanningExpression that)
            => that.transform(this);
    shared actual default Result transformSpecification(Specification that)
            => that.transform(this);
    shared actual default Result transformStatement(Statement that)
            => that.transform(this);
    shared actual default Result transformSubscript(Subscript that)
            => that.transform(this);
    shared actual default Result transformThenElseExpression(ThenElseExpression that)
            => that.transform(this);
    shared actual default Result transformType(Type that)
            => that.transform(this);
    shared actual default Result transformTypeIsh(TypeIsh that)
            => that.transform(this);
    shared actual default Result transformTypedDeclaration(TypedDeclaration that)
            => that.transform(this);
    shared actual default Result transformTypeDec(TypeDec that)
            => that.transform(this);
    shared actual default Result transformTypeDeclaration(TypeDeclaration that)
            => that.transform(this);
    shared actual default Result transformTypeModifier(TypeModifier that)
            => that.transform(this);
    shared actual default Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that)
            => that.transform(this);
    shared actual default Result transformUnaryIshOperation(UnaryIshOperation that)
            => that.transform(this);
    shared actual default Result transformUnaryOperation(UnaryOperation that)
            => that.transform(this);
    shared actual default Result transformUnaryTypeOperation(UnaryTypeOperation that)
            => that.transform(this);
    shared actual default Result transformUnionableType(UnionableType that)
            => that.transform(this);
    shared actual default Result transformUnioningExpression(UnioningExpression that)
            => that.transform(this);
    shared actual default Result transformValueExpression(ValueExpression that)
            => that.transform(this);
    shared actual default Result transformVariable(Variable that)
            => that.transform(this);
    shared actual default Result transformVariance(Variance that)
            => that.transform(this);
}
