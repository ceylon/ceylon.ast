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
    shared formal Result transformAnnotation(Annotation that);
    shared formal Result transformAnnotations(Annotations that);
    shared formal Result transformAnonymousArgument(AnonymousArgument that);
    shared formal Result transformAnyClass(AnyClass that);
    shared formal Result transformAnyCompilationUnit(AnyCompilationUnit that);
    shared formal Result transformAnyFunction(AnyFunction that);
    shared formal Result transformAnySpecifier(AnySpecifier that);
    shared formal Result transformAnyValue(AnyValue that);
    shared formal Result transformArgumentList(ArgumentList that);
    shared formal Result transformArguments(Arguments that);
    shared formal Result transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that);
    shared formal Result transformArithmeticOperation(ArithmeticOperation that);
    shared formal Result transformAssertion(Assertion that);
    shared formal Result transformAssignOperation(AssignOperation that);
    shared formal Result transformAssignmentOperation(AssignmentOperation that);
    shared formal Result transformAssignmentStatement(AssignmentStatement that);
    shared formal Result transformAtom(Atom that);
    shared formal Result transformBaseExpression(BaseExpression that);
    shared formal Result transformBaseMeta(BaseMeta that);
    shared formal Result transformBaseType(BaseType that);
    shared formal Result transformBinaryOperation(BinaryOperation that);
    shared formal Result transformBlock(Block that);
    shared formal Result transformBody(Body that);
    shared formal Result transformBooleanCondition(BooleanCondition that);
    shared formal Result transformBound(Bound that);
    shared formal Result transformBreak(Break that);
    shared formal Result transformCallableParameter(CallableParameter that);
    shared formal Result transformCallableType(CallableType that);
    shared formal Result transformCaseClause(CaseClause that);
    shared formal Result transformCaseItem(CaseItem that);
    shared formal Result transformCaseTypes(CaseTypes that);
    shared formal Result transformCatchClause(CatchClause that);
    shared formal Result transformCharacterLiteral(CharacterLiteral that);
    shared formal Result transformClassAlias(ClassAlias that);
    shared formal Result transformClassBody(ClassBody that);
    shared formal Result transformClassDefinition(ClassDefinition that);
    shared formal Result transformClassInstantiation(ClassInstantiation that);
    shared formal Result transformClassOrInterface(ClassOrInterface that);
    shared formal Result transformClassSpecifier(ClassSpecifier that);
    shared formal Result transformClosedBound(ClosedBound that);
    shared formal Result transformCompareOperation(CompareOperation that);
    shared formal Result transformComparisonOperation(ComparisonOperation that);
    shared formal Result transformCompilationUnit(CompilationUnit that);
    shared formal Result transformComplementAssignmentOperation(ComplementAssignmentOperation that);
    shared formal Result transformComplementOperation(ComplementOperation that);
    shared formal Result transformComprehension(Comprehension that);
    shared formal Result transformComprehensionClause(ComprehensionClause that);
    shared formal Result transformCondition(Condition that);
    shared formal Result transformConditions(Conditions that);
    shared formal Result transformContinue(Continue that);
    shared formal Result transformControlStructure(ControlStructure that);
    shared formal Result transformDec(Dec that);
    shared formal Result transformDeclaration(Declaration that);
    shared formal Result transformDefaultedCallableParameter(DefaultedCallableParameter that);
    shared formal Result transformDefaultedParameter(DefaultedParameter that);
    shared formal Result transformDefaultedParameterReference(DefaultedParameterReference that);
    shared formal Result transformDefaultedType(DefaultedType that);
    shared formal Result transformDefaultedValueParameter(DefaultedValueParameter that);
    shared formal Result transformDifferenceOperation(DifferenceOperation that);
    shared formal Result transformDirective(Directive that);
    shared formal Result transformDivideAssignmentOperation(DivideAssignmentOperation that);
    shared formal Result transformDynamicBlock(DynamicBlock that);
    shared formal Result transformDynamicModifier(DynamicModifier that);
    shared formal Result transformDynamicValue(DynamicValue that);
    shared formal Result transformElementOrSubrangeExpression(ElementOrSubrangeExpression that);
    shared formal Result transformElseCaseClause(ElseCaseClause that);
    shared formal Result transformElseClause(ElseClause that);
    shared formal Result transformElseOperation(ElseOperation that);
    shared formal Result transformEntryOperation(EntryOperation that);
    shared formal Result transformEntryType(EntryType that);
    shared formal Result transformEqualOperation(EqualOperation that);
    shared formal Result transformEqualityOperation(EqualityOperation that);
    shared formal Result transformExistsCondition(ExistsCondition that);
    shared formal Result transformExistsOperation(ExistsOperation that);
    shared formal Result transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that);
    shared formal Result transformExponentiationOperation(ExponentiationOperation that);
    shared formal Result transformExpression(Expression that);
    shared formal Result transformExpressionComprehensionClause(ExpressionComprehensionClause that);
    shared formal Result transformExpressionIsh(ExpressionIsh that);
    shared formal Result transformExpressionStatement(ExpressionStatement that);
    shared formal Result transformExtendedType(ExtendedType that);
    shared formal Result transformFailClause(FailClause that);
    shared formal Result transformFinallyClause(FinallyClause that);
    shared formal Result transformFloatLiteral(FloatLiteral that);
    shared formal Result transformForClause(ForClause that);
    shared formal Result transformForComprehensionClause(ForComprehensionClause that);
    shared formal Result transformForFail(ForFail that);
    shared formal Result transformForIterator(ForIterator that);
    shared formal Result transformFullPackageName(FullPackageName that);
    shared formal Result transformFunctionDeclaration(FunctionDeclaration that);
    shared formal Result transformFunctionDefinition(FunctionDefinition that);
    shared formal Result transformFunctionExpression(FunctionExpression that);
    shared formal Result transformFunctionModifier(FunctionModifier that);
    shared formal Result transformFunctionShortcutDefinition(FunctionShortcutDefinition that);
    shared formal Result transformGivenDec(GivenDec that);
    shared formal Result transformGroupedExpression(GroupedExpression that);
    shared formal Result transformGroupedType(GroupedType that);
    shared formal Result transformIdenticalOperation(IdenticalOperation that);
    shared formal Result transformIdentifier(Identifier that);
    shared formal Result transformIdentityOperation(IdentityOperation that);
    shared formal Result transformIfClause(IfClause that);
    shared formal Result transformIfComprehensionClause(IfComprehensionClause that);
    shared formal Result transformIfElse(IfElse that);
    shared formal Result transformImport(Import that);
    shared formal Result transformImportAlias(ImportAlias that);
    shared formal Result transformImportElement(ImportElement that);
    shared formal Result transformImportElements(ImportElements that);
    shared formal Result transformImportFunctionValueAlias(ImportFunctionValueAlias that);
    shared formal Result transformImportFunctionValueElement(ImportFunctionValueElement that);
    shared formal Result transformImportTypeAlias(ImportTypeAlias that);
    shared formal Result transformImportTypeElement(ImportTypeElement that);
    shared formal Result transformImportWildcard(ImportWildcard that);
    shared formal Result transformInModifier(InModifier that);
    shared formal Result transformInOperation(InOperation that);
    shared formal Result transformInitialComprehensionClause(InitialComprehensionClause that);
    shared formal Result transformIntegerLiteral(IntegerLiteral that);
    shared formal Result transformInterfaceBody(InterfaceBody that);
    shared formal Result transformIntersectAssignmentOperation(IntersectAssignmentOperation that);
    shared formal Result transformIntersectionOperation(IntersectionOperation that);
    shared formal Result transformIntersectionType(IntersectionType that);
    shared formal Result transformInvocation(Invocation that);
    shared formal Result transformInvocationStatement(InvocationStatement that);
    shared formal Result transformIsCase(IsCase that);
    shared formal Result transformIsCondition(IsCondition that);
    shared formal Result transformIsOperation(IsOperation that);
    shared formal Result transformIterable(Iterable that);
    shared formal Result transformIterableType(IterableType that);
    shared formal Result transformKeySubscript(KeySubscript that);
    shared formal Result transformKeyValueIterator(KeyValueIterator that);
    shared formal Result transformLIdentifier(LIdentifier that);
    shared formal Result transformLargeAsOperation(LargeAsOperation that);
    shared formal Result transformLargerOperation(LargerOperation that);
    shared formal Result transformLazySpecifier(LazySpecifier that);
    shared formal Result transformLiteral(Literal that);
    shared formal Result transformLogicalAssignmentOperation(LogicalAssignmentOperation that);
    shared formal Result transformLogicalOperation(LogicalOperation that);
    shared formal Result transformMainType(MainType that);
    shared formal Result transformMatchCase(MatchCase that);
    shared formal Result transformMeasureOperation(MeasureOperation that);
    shared formal Result transformMeasureSubscript(MeasureSubscript that);
    shared formal Result transformMemberMeta(MemberMeta that);
    shared formal Result transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that);
    shared formal Result transformMeta(Meta that);
    shared formal Result transformModifier(Modifier that);
    shared formal Result transformModuleBody(ModuleBody that);
    shared formal Result transformModuleCompilationUnit(ModuleCompilationUnit that);
    shared formal Result transformModuleDec(ModuleDec that);
    shared formal Result transformModuleDescriptor(ModuleDescriptor that);
    shared formal Result transformModuleImport(ModuleImport that);
    shared formal Result transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that);
    shared formal Result transformNameWithTypeArguments(NameWithTypeArguments that);
    shared formal Result transformNamedArgument(NamedArgument that);
    shared formal Result transformNamedArguments(NamedArguments that);
    shared formal Result transformNegationOperation(NegationOperation that);
    shared formal Result transformNode(Node that);
    shared formal Result transformNonemptyCondition(NonemptyCondition that);
    shared formal Result transformNonemptyOperation(NonemptyOperation that);
    shared formal Result transformNotEqualOperation(NotEqualOperation that);
    shared formal Result transformNotOperation(NotOperation that);
    shared formal Result transformObjectDefinition(ObjectDefinition that);
    shared formal Result transformOfOperation(OfOperation that);
    shared formal Result transformOpenBound(OpenBound that);
    shared formal Result transformOperation(Operation that);
    shared formal Result transformOptionalType(OptionalType that);
    shared formal Result transformOrAssignmentOperation(OrAssignmentOperation that);
    shared formal Result transformOrOperation(OrOperation that);
    shared formal Result transformOutModifier(OutModifier that);
    shared formal Result transformOuter(Outer that);
    shared formal Result transformPackage(Package that);
    shared formal Result transformPackageCompilationUnit(PackageCompilationUnit that);
    shared formal Result transformPackageDec(PackageDec that);
    shared formal Result transformPackageDescriptor(PackageDescriptor that);
    shared formal Result transformParameter(Parameter that);
    shared formal Result transformParameterReference(ParameterReference that);
    shared formal Result transformParameters(Parameters that);
    shared formal Result transformPositionalArguments(PositionalArguments that);
    shared formal Result transformPostfixDecrementOperation(PostfixDecrementOperation that);
    shared formal Result transformPostfixIncrementOperation(PostfixIncrementOperation that);
    shared formal Result transformPostfixOperation(PostfixOperation that);
    shared formal Result transformPrefixDecrementOperation(PrefixDecrementOperation that);
    shared formal Result transformPrefixIncrementOperation(PrefixIncrementOperation that);
    shared formal Result transformPrefixOperation(PrefixOperation that);
    shared formal Result transformPrefixPostfixStatement(PrefixPostfixStatement that);
    shared formal Result transformPrimary(Primary that);
    shared formal Result transformPrimaryType(PrimaryType that);
    shared formal Result transformProductOperation(ProductOperation that);
    shared formal Result transformQualifiedExpression(QualifiedExpression that);
    shared formal Result transformQualifiedType(QualifiedType that);
    shared formal Result transformQuotientOperation(QuotientOperation that);
    shared formal Result transformRangeSubscript(RangeSubscript that);
    shared formal Result transformRemainderAssignmentOperation(RemainderAssignmentOperation that);
    shared formal Result transformRemainderOperation(RemainderOperation that);
    shared formal Result transformRequiredParameter(RequiredParameter that);
    shared formal Result transformResource(Resource that);
    shared formal Result transformResources(Resources that);
    shared formal Result transformReturn(Return that);
    shared formal Result transformSatisfiedTypes(SatisfiedTypes that);
    shared formal Result transformScaleOperation(ScaleOperation that);
    shared formal Result transformSelfReference(SelfReference that);
    shared formal Result transformSequentialType(SequentialType that);
    shared formal Result transformSetAssignmentOperation(SetAssignmentOperation that);
    shared formal Result transformSetOperation(SetOperation that);
    shared formal Result transformSimpleType(SimpleType that);
    shared formal Result transformSmallAsOperation(SmallAsOperation that);
    shared formal Result transformSmallerOperation(SmallerOperation that);
    shared formal Result transformSpanFromSubscript(SpanFromSubscript that);
    shared formal Result transformSpanOperation(SpanOperation that);
    shared formal Result transformSpanSubscript(SpanSubscript that);
    shared formal Result transformSpanToSubscript(SpanToSubscript that);
    shared formal Result transformSpecification(Specification that);
    shared formal Result transformSpecifiedArgument(SpecifiedArgument that);
    shared formal Result transformSpecifiedVariable(SpecifiedVariable that);
    shared formal Result transformSpecifier(Specifier that);
    shared formal Result transformSpreadArgument(SpreadArgument that);
    shared formal Result transformStatement(Statement that);
    shared formal Result transformStringLiteral(StringLiteral that);
    shared formal Result transformStringTemplate(StringTemplate that);
    shared formal Result transformSubscript(Subscript that);
    shared formal Result transformSubtractAssignmentOperation(SubtractAssignmentOperation that);
    shared formal Result transformSumOperation(SumOperation that);
    shared formal Result transformSuper(Super that);
    shared formal Result transformThenOperation(ThenOperation that);
    shared formal Result transformThis(This that);
    shared formal Result transformThrow(Throw that);
    shared formal Result transformTryCatchFinally(TryCatchFinally that);
    shared formal Result transformTryClause(TryClause that);
    shared formal Result transformTuple(Tuple that);
    shared formal Result transformTupleType(TupleType that);
    shared formal Result transformType(Type that);
    shared formal Result transformTypeArgument(TypeArgument that);
    shared formal Result transformTypeArguments(TypeArguments that);
    shared formal Result transformTypeConstraint(TypeConstraint that);
    shared formal Result transformTypeDec(TypeDec that);
    shared formal Result transformTypeDeclaration(TypeDeclaration that);
    shared formal Result transformTypeIsh(TypeIsh that);
    shared formal Result transformTypeList(TypeList that);
    shared formal Result transformTypeMeta(TypeMeta that);
    shared formal Result transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that);
    shared formal Result transformTypeParameter(TypeParameter that);
    shared formal Result transformTypeParameters(TypeParameters that);
    shared formal Result transformTypeSpecifier(TypeSpecifier that);
    shared formal Result transformTypedDeclaration(TypedDeclaration that);
    shared formal Result transformTypedVariable(TypedVariable that);
    shared formal Result transformUIdentifier(UIdentifier that);
    shared formal Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that);
    shared formal Result transformUnaryIshOperation(UnaryIshOperation that);
    shared formal Result transformUnaryOperation(UnaryOperation that);
    shared formal Result transformUnaryTypeOperation(UnaryTypeOperation that);
    shared formal Result transformUnionAssignmentOperation(UnionAssignmentOperation that);
    shared formal Result transformUnionOperation(UnionOperation that);
    shared formal Result transformUnionType(UnionType that);
    shared formal Result transformUnionableType(UnionableType that);
    shared formal Result transformUnspecifiedVariable(UnspecifiedVariable that);
    shared formal Result transformValueDeclaration(ValueDeclaration that);
    shared formal Result transformValueDefinition(ValueDefinition that);
    shared formal Result transformValueExpression(ValueExpression that);
    shared formal Result transformValueGetterDefinition(ValueGetterDefinition that);
    shared formal Result transformValueIterator(ValueIterator that);
    shared formal Result transformValueModifier(ValueModifier that);
    shared formal Result transformValueParameter(ValueParameter that);
    shared formal Result transformValueSetterDefinition(ValueSetterDefinition that);
    shared formal Result transformValueSpecification(ValueSpecification that);
    shared formal Result transformVariable(Variable that);
    shared formal Result transformVariadicParameter(VariadicParameter that);
    shared formal Result transformVariadicType(VariadicType that);
    shared formal Result transformVariance(Variance that);
    shared formal Result transformVoidModifier(VoidModifier that);
    shared formal Result transformWhile(While that);
    shared formal Result transformWithinOperation(WithinOperation that);
}
