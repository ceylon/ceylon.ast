"A [[NarrowingTransformer]] that narrows cascadingly to the “less abstract” type of the visited
 subject by switching on the case types and invoking the proper `transformX` method.
 
 For example:
 ~~~
 // ValueExample has the case types Primary | Operation
 shared actual default Result transformValueExpression(ValueExpression that) {
     switch (that)
     case (is Primary) { return transformPrimary(that); }
     case (is Operation) { return transformOperation(that); }
 }
 ~~~
 
 I honestly don’t know when you’d want to use this instead of [[ImmediateNarrowingTransformer]];
 perhaps the strongest argument for its existence is that it was trivial to generate along with
 other generated code while `ceylon.ast` was originally written, but would be significantly
 more painful to create (by hand or automatically) afterwards."
see (`interface Editor`)
shared interface CascadingNarrowingTransformer<out Result> satisfies NarrowingTransformer<Result> {
    shared actual default Result transformAnyClass(AnyClass that) {
        switch (that)
        case (is ClassDefinition) { return transformClassDefinition(that); }
        case (is ClassAliasDefinition) { return transformClassAliasDefinition(that); }
    }
    shared actual default Result transformAnyCompilationUnit(AnyCompilationUnit that) {
        switch (that)
        case (is CompilationUnit) { return transformCompilationUnit(that); }
        case (is ModuleCompilationUnit) { return transformModuleCompilationUnit(that); }
        case (is PackageCompilationUnit) { return transformPackageCompilationUnit(that); }
    }
    shared actual default Result transformAnyFunction(AnyFunction that) {
        switch (that)
        case (is FunctionDeclaration) { return transformFunctionDeclaration(that); }
        case (is FunctionDefinition) { return transformFunctionDefinition(that); }
        case (is FunctionShortcutDefinition) { return transformFunctionShortcutDefinition(that); }
    }
    shared actual default Result transformAnyInterface(AnyInterface that) {
        switch (that)
        case (is AnyInterfaceDefinition) { return transformAnyInterfaceDefinition(that); }
        case (is InterfaceAliasDefinition) { return transformInterfaceAliasDefinition(that); }
    }
    shared actual default Result transformAnyInterfaceDefinition(AnyInterfaceDefinition that) {
        switch (that)
        case (is InterfaceDefinition) { return transformInterfaceDefinition(that); }
        case (is DynamicInterfaceDefinition) { return transformDynamicInterfaceDefinition(that); }
    }
    shared actual default Result transformAnyMemberOperator(AnyMemberOperator that) {
        switch (that)
        case (is MemberOperator) { return transformMemberOperator(that); }
        case (is SafeMemberOperator) { return transformSafeMemberOperator(that); }
        case (is SpreadMemberOperator) { return transformSpreadMemberOperator(that); }
    }
    shared actual default Result transformAnySpecifier(AnySpecifier that) {
        switch (that)
        case (is Specifier) { return transformSpecifier(that); }
        case (is LazySpecifier) { return transformLazySpecifier(that); }
    }
    shared actual default Result transformAnyValue(AnyValue that) {
        switch (that)
        case (is ValueDeclaration) { return transformValueDeclaration(that); }
        case (is ValueDefinition) { return transformValueDefinition(that); }
        case (is ValueGetterDefinition) { return transformValueGetterDefinition(that); }
    }
    shared actual default Result transformArguments(Arguments that) {
        switch (that)
        case (is PositionalArguments) { return transformPositionalArguments(that); }
        case (is NamedArguments) { return transformNamedArguments(that); }
    }
    shared actual default Result transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) {
        switch (that)
        case (is AddAssignmentOperation) { return transformAddAssignmentOperation(that); }
        case (is SubtractAssignmentOperation) { return transformSubtractAssignmentOperation(that); }
        case (is MultiplyAssignmentOperation) { return transformMultiplyAssignmentOperation(that); }
        case (is DivideAssignmentOperation) { return transformDivideAssignmentOperation(that); }
        case (is RemainderAssignmentOperation) { return transformRemainderAssignmentOperation(that); }
    }
    shared actual default Result transformArithmeticOperation(ArithmeticOperation that) {
        switch (that)
        case (is ExponentiationOperation) { return transformExponentiationOperation(that); }
        case (is ProductOperation) { return transformProductOperation(that); }
        case (is QuotientOperation) { return transformQuotientOperation(that); }
        case (is RemainderOperation) { return transformRemainderOperation(that); }
        case (is SumOperation) { return transformSumOperation(that); }
        case (is DifferenceOperation) { return transformDifferenceOperation(that); }
    }
    shared actual default Result transformArtifact(Artifact that) {
        switch (that)
        case (is StringLiteral) { return transformStringLiteral(that); }
    }
    shared actual default Result transformAssertionMessage(AssertionMessage that) {
        switch (that)
        case (is StringLiteral) { return transformStringLiteral(that); }
        case (is StringTemplate) { return transformStringTemplate(that); }
    }
    shared actual default Result transformAssignmentOperation(AssignmentOperation that) {
        switch (that)
        case (is AssignOperation) { return transformAssignOperation(that); }
        case (is ArithmeticAssignmentOperation) { return transformArithmeticAssignmentOperation(that); }
        case (is SetAssignmentOperation) { return transformSetAssignmentOperation(that); }
        case (is LogicalAssignmentOperation) { return transformLogicalAssignmentOperation(that); }
    }
    shared actual default Result transformAtom(Atom that) {
        switch (that)
        case (is Literal) { return transformLiteral(that); }
        case (is StringTemplate) { return transformStringTemplate(that); }
        case (is SelfReference) { return transformSelfReference(that); }
        case (is GroupedExpression) { return transformGroupedExpression(that); }
        case (is Iterable) { return transformIterable(that); }
        case (is Tuple) { return transformTuple(that); }
        case (is DynamicValue) { return transformDynamicValue(that); }
        case (is ObjectExpression) { return transformObjectExpression(that); }
    }
    shared actual default Result transformBinaryOperation(BinaryOperation that) {
        switch (that)
        case (is ArithmeticOperation) { return transformArithmeticOperation(that); }
        case (is SetOperation) { return transformSetOperation(that); }
        case (is ScaleOperation) { return transformScaleOperation(that); }
        case (is SpanOperation) { return transformSpanOperation(that); }
        case (is MeasureOperation) { return transformMeasureOperation(that); }
        case (is EntryOperation) { return transformEntryOperation(that); }
        case (is InOperation) { return transformInOperation(that); }
        case (is ComparisonOperation) { return transformComparisonOperation(that); }
        case (is CompareOperation) { return transformCompareOperation(that); }
        case (is EqualityOperation) { return transformEqualityOperation(that); }
        case (is LogicalOperation) { return transformLogicalOperation(that); }
        case (is ThenOperation) { return transformThenOperation(that); }
        case (is ElseOperation) { return transformElseOperation(that); }
        case (is AssignmentOperation) { return transformAssignmentOperation(that); }
    }
    shared actual default Result transformBody(Body that) {
        switch (that)
        case (is Block) { return transformBlock(that); }
        case (is ClassBody) { return transformClassBody(that); }
        case (is InterfaceBody) { return transformInterfaceBody(that); }
    }
    shared actual default Result transformBound(Bound that) {
        switch (that)
        case (is OpenBound) { return transformOpenBound(that); }
        case (is ClosedBound) { return transformClosedBound(that); }
    }
    shared actual default Result transformCaseItem(CaseItem that) {
        switch (that)
        case (is MatchCase) { return transformMatchCase(that); }
        case (is IsCase) { return transformIsCase(that); }
    }
    shared actual default Result transformClassOrInterface(ClassOrInterface that) {
        switch (that)
        case (is AnyClass) { return transformAnyClass(that); }
        case (is AnyInterface) { return transformAnyInterface(that); }
    }
    shared actual default Result transformClassifier(Classifier that) {
        switch (that)
        case (is StringLiteral) { return transformStringLiteral(that); }
    }
    shared actual default Result transformComparisonOperation(ComparisonOperation that) {
        switch (that)
        case (is LargerOperation) { return transformLargerOperation(that); }
        case (is SmallerOperation) { return transformSmallerOperation(that); }
        case (is LargeAsOperation) { return transformLargeAsOperation(that); }
        case (is SmallAsOperation) { return transformSmallAsOperation(that); }
    }
    shared actual default Result transformComprehensionClause(ComprehensionClause that) {
        switch (that)
        case (is InitialComprehensionClause) { return transformInitialComprehensionClause(that); }
        case (is ExpressionComprehensionClause) { return transformExpressionComprehensionClause(that); }
    }
    shared actual default Result transformCondition(Condition that) {
        switch (that)
        case (is BooleanCondition) { return transformBooleanCondition(that); }
        case (is IsCondition) { return transformIsCondition(that); }
        case (is ExistsOrNonemptyCondition) { return transformExistsOrNonemptyCondition(that); }
    }
    shared actual default Result transformConditionalExpression(ConditionalExpression that) {
        switch (that)
        case (is IfElseExpression) { return transformIfElseExpression(that); }
        case (is SwitchCaseElseExpression) { return transformSwitchCaseElseExpression(that); }
    }
    shared actual default Result transformConstructorDefinition(ConstructorDefinition that) {
        switch (that)
        case (is CallableConstructorDefinition) { return transformCallableConstructorDefinition(that); }
        case (is ValueConstructorDefinition) { return transformValueConstructorDefinition(that); }
    }
    shared actual default Result transformControlStructure(ControlStructure that) {
        switch (that)
        case (is IfElse) { return transformIfElse(that); }
        case (is While) { return transformWhile(that); }
        case (is ForFail) { return transformForFail(that); }
        case (is SwitchCaseElse) { return transformSwitchCaseElse(that); }
        case (is TryCatchFinally) { return transformTryCatchFinally(that); }
        case (is DynamicBlock) { return transformDynamicBlock(that); }
    }
    shared actual default Result transformDec(Dec that) {
        switch (that)
        case (is TypeDec) { return transformTypeDec(that); }
        case (is MemberDec) { return transformMemberDec(that); }
        case (is ConstructorDec) { return transformConstructorDec(that); }
        case (is PackageDec) { return transformPackageDec(that); }
        case (is ModuleDec) { return transformModuleDec(that); }
    }
    shared actual default Result transformDeclaration(Declaration that) {
        switch (that)
        case (is TypeDeclaration) { return transformTypeDeclaration(that); }
        case (is TypedDeclaration) { return transformTypedDeclaration(that); }
        case (is ObjectDefinition) { return transformObjectDefinition(that); }
        case (is ValueSetterDefinition) { return transformValueSetterDefinition(that); }
        case (is ConstructorDefinition) { return transformConstructorDefinition(that); }
    }
    shared actual default Result transformDefaultedParameter(DefaultedParameter that) {
        switch (that)
        case (is DefaultedValueParameter) { return transformDefaultedValueParameter(that); }
        case (is DefaultedCallableParameter) { return transformDefaultedCallableParameter(that); }
        case (is DefaultedParameterReference) { return transformDefaultedParameterReference(that); }
    }
    shared actual default Result transformDirective(Directive that) {
        switch (that)
        case (is Return) { return transformReturn(that); }
        case (is Throw) { return transformThrow(that); }
        case (is Break) { return transformBreak(that); }
        case (is Continue) { return transformContinue(that); }
    }
    shared actual default Result transformEqualityOperation(EqualityOperation that) {
        switch (that)
        case (is EqualOperation) { return transformEqualOperation(that); }
        case (is NotEqualOperation) { return transformNotEqualOperation(that); }
        case (is IdenticalOperation) { return transformIdenticalOperation(that); }
    }
    shared actual default Result transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) {
        switch (that)
        case (is ExistsCondition) { return transformExistsCondition(that); }
        case (is NonemptyCondition) { return transformNonemptyCondition(that); }
    }
    shared actual default Result transformExpression(Expression that) {
        switch (that)
        case (is ValueExpression) { return transformValueExpression(that); }
        case (is FunctionExpression) { return transformFunctionExpression(that); }
        case (is LetExpression) { return transformLetExpression(that); }
        case (is ConditionalExpression) { return transformConditionalExpression(that); }
    }
    shared actual default Result transformExpressionStatement(ExpressionStatement that) {
        switch (that)
        case (is AssignmentStatement) { return transformAssignmentStatement(that); }
        case (is PrefixPostfixStatement) { return transformPrefixPostfixStatement(that); }
        case (is InvocationStatement) { return transformInvocationStatement(that); }
    }
    shared actual default Result transformExtensionOrConstruction(ExtensionOrConstruction that) {
        switch (that)
        case (is Extension) { return transformExtension(that); }
        case (is Construction) { return transformConstruction(that); }
    }
    shared actual default Result transformIdentifier(Identifier that) {
        switch (that)
        case (is LIdentifier) { return transformLIdentifier(that); }
        case (is UIdentifier) { return transformUIdentifier(that); }
    }
    shared actual default Result transformInitialComprehensionClause(InitialComprehensionClause that) {
        switch (that)
        case (is ForComprehensionClause) { return transformForComprehensionClause(that); }
        case (is IfComprehensionClause) { return transformIfComprehensionClause(that); }
    }
    shared actual default Result transformInlineDefinitionArgument(InlineDefinitionArgument that) {
        switch (that)
        case (is ValueArgument) { return transformValueArgument(that); }
        case (is FunctionArgument) { return transformFunctionArgument(that); }
        case (is ObjectArgument) { return transformObjectArgument(that); }
    }
    shared actual default Result transformLiteral(Literal that) {
        switch (that)
        case (is IntegerLiteral) { return transformIntegerLiteral(that); }
        case (is FloatLiteral) { return transformFloatLiteral(that); }
        case (is StringLiteral) { return transformStringLiteral(that); }
        case (is CharacterLiteral) { return transformCharacterLiteral(that); }
    }
    shared actual default Result transformLocalModifier(LocalModifier that) {
        switch (that)
        case (is ValueModifier) { return transformValueModifier(that); }
        case (is FunctionModifier) { return transformFunctionModifier(that); }
    }
    shared actual default Result transformLogicalAssignmentOperation(LogicalAssignmentOperation that) {
        switch (that)
        case (is AndAssignmentOperation) { return transformAndAssignmentOperation(that); }
        case (is OrAssignmentOperation) { return transformOrAssignmentOperation(that); }
    }
    shared actual default Result transformLogicalOperation(LogicalOperation that) {
        switch (that)
        case (is AndOperation) { return transformAndOperation(that); }
        case (is OrOperation) { return transformOrOperation(that); }
    }
    shared actual default Result transformMainType(MainType that) {
        switch (that)
        case (is UnionableType) { return transformUnionableType(that); }
        case (is UnionType) { return transformUnionType(that); }
    }
    shared actual default Result transformMemberDec(MemberDec that) {
        switch (that)
        case (is ValueDec) { return transformValueDec(that); }
        case (is FunctionDec) { return transformFunctionDec(that); }
    }
    shared actual default Result transformMeta(Meta that) {
        switch (that)
        case (is TypeMeta) { return transformTypeMeta(that); }
        case (is BaseMeta) { return transformBaseMeta(that); }
        case (is MemberMeta) { return transformMemberMeta(that); }
    }
    shared actual default Result transformModifier(Modifier that) {
        switch (that)
        case (is VoidModifier) { return transformVoidModifier(that); }
        case (is ValueModifier) { return transformValueModifier(that); }
        case (is FunctionModifier) { return transformFunctionModifier(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
        case (is Variance) { return transformVariance(that); }
    }
    shared actual default Result transformModule(Module that) {
        switch (that)
        case (is ModuleName) { return transformModuleName(that); }
        case (is StringLiteral) { return transformStringLiteral(that); }
    }
    shared actual default Result transformModuleName(ModuleName that) {
        switch (that)
        case (is FullPackageName) { return transformFullPackageName(that); }
    }
    shared actual default Result transformNameWithTypeArguments(NameWithTypeArguments that) {
        switch (that)
        case (is MemberNameWithTypeArguments) { return transformMemberNameWithTypeArguments(that); }
        case (is TypeNameWithTypeArguments) { return transformTypeNameWithTypeArguments(that); }
    }
    shared actual default Result transformNamedArgument(NamedArgument that) {
        switch (that)
        case (is AnonymousArgument) { return transformAnonymousArgument(that); }
        case (is SpecifiedArgument) { return transformSpecifiedArgument(that); }
        case (is InlineDefinitionArgument) { return transformInlineDefinitionArgument(that); }
    }
    shared actual default Result transformNode(Node that) {
        switch (that)
        case (is Expression) { return transformExpression(that); }
        case (is Statement) { return transformStatement(that); }
        case (is Declaration) { return transformDeclaration(that); }
        case (is Annotation) { return transformAnnotation(that); }
        case (is Annotations) { return transformAnnotations(that); }
        case (is Parameter) { return transformParameter(that); }
        case (is TypeParameter) { return transformTypeParameter(that); }
        case (is TypeParameters) { return transformTypeParameters(that); }
        case (is CaseTypes) { return transformCaseTypes(that); }
        case (is SatisfiedTypes) { return transformSatisfiedTypes(that); }
        case (is TypeConstraint) { return transformTypeConstraint(that); }
        case (is PackageDescriptor) { return transformPackageDescriptor(that); }
        case (is ModuleImport) { return transformModuleImport(that); }
        case (is ModuleBody) { return transformModuleBody(that); }
        case (is ModuleDescriptor) { return transformModuleDescriptor(that); }
        case (is ImportAlias) { return transformImportAlias(that); }
        case (is ImportWildcard) { return transformImportWildcard(that); }
        case (is ImportElement) { return transformImportElement(that); }
        case (is ImportElements) { return transformImportElements(that); }
        case (is Import) { return transformImport(that); }
        case (is AnyCompilationUnit) { return transformAnyCompilationUnit(that); }
        case (is Condition) { return transformCondition(that); }
        case (is Conditions) { return transformConditions(that); }
        case (is IfClause) { return transformIfClause(that); }
        case (is ElseClause) { return transformElseClause(that); }
        case (is ExtendedType) { return transformExtendedType(that); }
        case (is ClassSpecifier) { return transformClassSpecifier(that); }
        case (is TypeSpecifier) { return transformTypeSpecifier(that); }
        case (is Variable) { return transformVariable(that); }
        case (is ForIterator) { return transformForIterator(that); }
        case (is ForClause) { return transformForClause(that); }
        case (is FailClause) { return transformFailClause(that); }
        case (is ComprehensionClause) { return transformComprehensionClause(that); }
        case (is FinallyClause) { return transformFinallyClause(that); }
        case (is CatchClause) { return transformCatchClause(that); }
        case (is Resource) { return transformResource(that); }
        case (is Resources) { return transformResources(that); }
        case (is TryClause) { return transformTryClause(that); }
        case (is CaseItem) { return transformCaseItem(that); }
        case (is CaseClause) { return transformCaseClause(that); }
        case (is SwitchCases) { return transformSwitchCases(that); }
        case (is SwitchClause) { return transformSwitchClause(that); }
        case (is TypeIsh) { return transformTypeIsh(that); }
        case (is Identifier) { return transformIdentifier(that); }
        case (is FullPackageName) { return transformFullPackageName(that); }
        case (is ArgumentList) { return transformArgumentList(that); }
        case (is SpreadArgument) { return transformSpreadArgument(that); }
        case (is Arguments) { return transformArguments(that); }
        case (is NamedArgument) { return transformNamedArgument(that); }
        case (is AnySpecifier) { return transformAnySpecifier(that); }
        case (is Parameters) { return transformParameters(that); }
        case (is Bound) { return transformBound(that); }
        case (is Modifier) { return transformModifier(that); }
        case (is Body) { return transformBody(that); }
        case (is Comprehension) { return transformComprehension(that); }
        case (is Subscript) { return transformSubscript(that); }
        case (is DecQualifier) { return transformDecQualifier(that); }
        case (is AnyMemberOperator) { return transformAnyMemberOperator(that); }
        case (is Pattern) { return transformPattern(that); }
        case (is SpecifiedPattern) { return transformSpecifiedPattern(that); }
        case (is PatternList) { return transformPatternList(that); }
        case (is CaseExpression) { return transformCaseExpression(that); }
        case (is ExtensionOrConstruction) { return transformExtensionOrConstruction(that); }
        case (is ModuleSpecifier) { return transformModuleSpecifier(that); }
    }
    shared actual default Result transformOperation(Operation that) {
        switch (that)
        case (is UnaryIshOperation) { return transformUnaryIshOperation(that); }
        case (is BinaryOperation) { return transformBinaryOperation(that); }
        case (is WithinOperation) { return transformWithinOperation(that); }
    }
    shared actual default Result transformParameter(Parameter that) {
        switch (that)
        case (is RequiredParameter) { return transformRequiredParameter(that); }
        case (is DefaultedParameter) { return transformDefaultedParameter(that); }
        case (is VariadicParameter) { return transformVariadicParameter(that); }
    }
    shared actual default Result transformPattern(Pattern that) {
        switch (that)
        case (is VariablePattern) { return transformVariablePattern(that); }
        case (is TuplePattern) { return transformTuplePattern(that); }
        case (is EntryPattern) { return transformEntryPattern(that); }
    }
    shared actual default Result transformPostfixOperation(PostfixOperation that) {
        switch (that)
        case (is PostfixIncrementOperation) { return transformPostfixIncrementOperation(that); }
        case (is PostfixDecrementOperation) { return transformPostfixDecrementOperation(that); }
    }
    shared actual default Result transformPrePostfixingExpression(PrePostfixingExpression that) {
        switch (that)
        case (is Primary) { return transformPrimary(that); }
        case (is PrefixOperation) { return transformPrefixOperation(that); }
        case (is PostfixOperation) { return transformPostfixOperation(that); }
    }
    shared actual default Result transformExponentiatingExpression(ExponentiatingExpression that) {
        switch (that)
        case (is PrePostfixingExpression) { return transformPrePostfixingExpression(that); }
        case (is ExponentiationOperation) { return transformExponentiationOperation(that); }
    }
    shared actual default Result transformInvertingExpression(InvertingExpression that) {
        switch (that)
        case (is ExponentiatingExpression) { return transformExponentiatingExpression(that); }
        case (is UnaryArithmeticOperation) { return transformUnaryArithmeticOperation(that); }
    }
    shared actual default Result transformIntersectingExpression(IntersectingExpression that) {
        switch (that)
        case (is InvertingExpression) { return transformInvertingExpression(that); }
        case (is IntersectionOperation) { return transformIntersectionOperation(that); }
    }
    shared actual default Result transformRepository(Repository that) {
        switch (that)
        case (is LIdentifier) { return transformLIdentifier(that); }
    }
    shared actual default Result transformStructureExpression(StructureExpression that) {
        switch (that)
        case (is DisjoiningExpression) { return transformDisjoiningExpression(that); }
        case (is IfElseExpression) { return transformIfElseExpression(that); }
        case (is SwitchCaseElseExpression) { return transformSwitchCaseElseExpression(that); }
        case (is LetExpression) { return transformLetExpression(that); }
    }
    shared actual default Result transformUnioningExpression(UnioningExpression that) {
        switch (that)
        case (is IntersectingExpression) { return transformIntersectingExpression(that); }
        case (is UnionOperation) { return transformUnionOperation(that); }
        case (is ComplementOperation) { return transformComplementOperation(that); }
    }
    shared actual default Result transformMultiplyingExpression(MultiplyingExpression that) {
        switch (that)
        case (is UnioningExpression) { return transformUnioningExpression(that); }
        case (is ProductOperation) { return transformProductOperation(that); }
        case (is QuotientOperation) { return transformQuotientOperation(that); }
        case (is RemainderOperation) { return transformRemainderOperation(that); }
    }
    shared actual default Result transformScalingExpression(ScalingExpression that) {
        switch (that)
        case (is MultiplyingExpression) { return transformMultiplyingExpression(that); }
        case (is ScaleOperation) { return transformScaleOperation(that); }
    }
    shared actual default Result transformAddingExpression(AddingExpression that) {
        switch (that)
        case (is ScalingExpression) { return transformScalingExpression(that); }
        case (is SumOperation) { return transformSumOperation(that); }
        case (is DifferenceOperation) { return transformDifferenceOperation(that); }
    }
    shared actual default Result transformSpanningExpression(SpanningExpression that) {
        switch (that)
        case (is AddingExpression) { return transformAddingExpression(that); }
        case (is SpanOperation) { return transformSpanOperation(that); }
        case (is MeasureOperation) { return transformMeasureOperation(that); }
        case (is EntryOperation) { return transformEntryOperation(that); }
    }
    shared actual default Result transformExistsNonemptyExpression(ExistsNonemptyExpression that) {
        switch (that)
        case (is SpanningExpression) { return transformSpanningExpression(that); }
        case (is ExistsOperation) { return transformExistsOperation(that); }
        case (is NonemptyOperation) { return transformNonemptyOperation(that); }
    }
    shared actual default Result transformComparingExpression(ComparingExpression that) {
        switch (that)
        case (is ExistsNonemptyExpression) { return transformExistsNonemptyExpression(that); }
        case (is IsOperation) { return transformIsOperation(that); }
        case (is OfOperation) { return transformOfOperation(that); }
        case (is InOperation) { return transformInOperation(that); }
        case (is ComparisonOperation) { return transformComparisonOperation(that); }
        case (is CompareOperation) { return transformCompareOperation(that); }
        case (is WithinOperation) { return transformWithinOperation(that); }
    }
    shared actual default Result transformEquatingExpression(EquatingExpression that) {
        switch (that)
        case (is ComparingExpression) { return transformComparingExpression(that); }
        case (is EqualityOperation) { return transformEqualityOperation(that); }
    }
    shared actual default Result transformNegatingExpression(NegatingExpression that) {
        switch (that)
        case (is EquatingExpression) { return transformEquatingExpression(that); }
        case (is NotOperation) { return transformNotOperation(that); }
    }
    shared actual default Result transformConjoiningExpression(ConjoiningExpression that) {
        switch (that)
        case (is NegatingExpression) { return transformNegatingExpression(that); }
        case (is AndOperation) { return transformAndOperation(that); }
    }
    shared actual default Result transformDisjoiningExpression(DisjoiningExpression that) {
        switch (that)
        case (is ConjoiningExpression) { return transformConjoiningExpression(that); }
        case (is OrOperation) { return transformOrOperation(that); }
    }
    shared actual default Result transformThenElseExpression(ThenElseExpression that) {
        switch (that)
        case (is StructureExpression) { return transformStructureExpression(that); }
        case (is ThenOperation) { return transformThenOperation(that); }
        case (is ElseOperation) { return transformElseOperation(that); }
    }
    shared actual default Result transformAssigningExpression(AssigningExpression that) {
        switch (that)
        case (is ThenElseExpression) { return transformThenElseExpression(that); }
        case (is AssignmentOperation) { return transformAssignmentOperation(that); }
    }
    shared actual default Result transformPrefixOperation(PrefixOperation that) {
        switch (that)
        case (is PrefixIncrementOperation) { return transformPrefixIncrementOperation(that); }
        case (is PrefixDecrementOperation) { return transformPrefixDecrementOperation(that); }
    }
    shared actual default Result transformPrimary(Primary that) {
        switch (that)
        case (is Atom) { return transformAtom(that); }
        case (is BaseExpression) { return transformBaseExpression(that); }
        case (is QualifiedExpression) { return transformQualifiedExpression(that); }
        case (is Invocation) { return transformInvocation(that); }
        case (is ElementOrSubrangeExpression) { return transformElementOrSubrangeExpression(that); }
        case (is Meta) { return transformMeta(that); }
        case (is Dec) { return transformDec(that); }
    }
    shared actual default Result transformPrimaryType(PrimaryType that) {
        switch (that)
        case (is SimpleType) { return transformSimpleType(that); }
        case (is OptionalType) { return transformOptionalType(that); }
        case (is SequentialType) { return transformSequentialType(that); }
        case (is TupleType) { return transformTupleType(that); }
        case (is IterableType) { return transformIterableType(that); }
        case (is GroupedType) { return transformGroupedType(that); }
        case (is CallableType) { return transformCallableType(that); }
    }
    shared actual default Result transformRangeSubscript(RangeSubscript that) {
        switch (that)
        case (is SpanSubscript) { return transformSpanSubscript(that); }
        case (is MeasureSubscript) { return transformMeasureSubscript(that); }
        case (is SpanFromSubscript) { return transformSpanFromSubscript(that); }
        case (is SpanToSubscript) { return transformSpanToSubscript(that); }
    }
    shared actual default Result transformRequiredParameter(RequiredParameter that) {
        switch (that)
        case (is ValueParameter) { return transformValueParameter(that); }
        case (is CallableParameter) { return transformCallableParameter(that); }
        case (is ParameterReference) { return transformParameterReference(that); }
    }
    shared actual default Result transformSelfReference(SelfReference that) {
        switch (that)
        case (is This) { return transformThis(that); }
        case (is Super) { return transformSuper(that); }
        case (is Outer) { return transformOuter(that); }
        case (is Package) { return transformPackage(that); }
    }
    shared actual default Result transformSetAssignmentOperation(SetAssignmentOperation that) {
        switch (that)
        case (is IntersectAssignmentOperation) { return transformIntersectAssignmentOperation(that); }
        case (is UnionAssignmentOperation) { return transformUnionAssignmentOperation(that); }
        case (is ComplementAssignmentOperation) { return transformComplementAssignmentOperation(that); }
    }
    shared actual default Result transformSetOperation(SetOperation that) {
        switch (that)
        case (is IntersectionOperation) { return transformIntersectionOperation(that); }
        case (is UnionOperation) { return transformUnionOperation(that); }
        case (is ComplementOperation) { return transformComplementOperation(that); }
    }
    shared actual default Result transformSimpleType(SimpleType that) {
        switch (that)
        case (is BaseType) { return transformBaseType(that); }
        case (is QualifiedType) { return transformQualifiedType(that); }
    }
    shared actual default Result transformSpecification(Specification that) {
        switch (that)
        case (is ValueSpecification) { return transformValueSpecification(that); }
        case (is LazySpecification) { return transformLazySpecification(that); }
    }
    shared actual default Result transformStatement(Statement that) {
        switch (that)
        case (is Specification) { return transformSpecification(that); }
        case (is ExpressionStatement) { return transformExpressionStatement(that); }
        case (is Assertion) { return transformAssertion(that); }
        case (is Directive) { return transformDirective(that); }
        case (is ControlStructure) { return transformControlStructure(that); }
        case (is Destructure) { return transformDestructure(that); }
    }
    shared actual default Result transformSubscript(Subscript that) {
        switch (that)
        case (is KeySubscript) { return transformKeySubscript(that); }
        case (is RangeSubscript) { return transformRangeSubscript(that); }
    }
    shared actual default Result transformType(Type that) {
        switch (that)
        case (is MainType) { return transformMainType(that); }
        case (is EntryType) { return transformEntryType(that); }
    }
    shared actual default Result transformTypeDec(TypeDec that) {
        switch (that)
        case (is ClassDec) { return transformClassDec(that); }
        case (is InterfaceDec) { return transformInterfaceDec(that); }
        case (is AliasDec) { return transformAliasDec(that); }
        case (is GivenDec) { return transformGivenDec(that); }
    }
    shared actual default Result transformTypeDeclaration(TypeDeclaration that) {
        switch (that)
        case (is ClassOrInterface) { return transformClassOrInterface(that); }
        case (is TypeAliasDefinition) { return transformTypeAliasDefinition(that); }
    }
    shared actual default Result transformTypeIsh(TypeIsh that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is NameWithTypeArguments) { return transformNameWithTypeArguments(that); }
        case (is VariadicType) { return transformVariadicType(that); }
        case (is DefaultedType) { return transformDefaultedType(that); }
        case (is TypeList) { return transformTypeList(that); }
        case (is SpreadType) { return transformSpreadType(that); }
        case (is TypeArgument) { return transformTypeArgument(that); }
        case (is TypeArguments) { return transformTypeArguments(that); }
        case (is PackageQualifier) { return transformPackageQualifier(that); }
    }
    shared actual default Result transformTypeModifier(TypeModifier that) {
        switch (that)
        case (is LocalModifier) { return transformLocalModifier(that); }
        case (is VoidModifier) { return transformVoidModifier(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
    }
    shared actual default Result transformTypedDeclaration(TypedDeclaration that) {
        switch (that)
        case (is AnyValue) { return transformAnyValue(that); }
        case (is AnyFunction) { return transformAnyFunction(that); }
    }
    shared actual default Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that) {
        switch (that)
        case (is IdentityOperation) { return transformIdentityOperation(that); }
        case (is NegationOperation) { return transformNegationOperation(that); }
    }
    shared actual default Result transformUnaryIshOperation(UnaryIshOperation that) {
        switch (that)
        case (is UnaryOperation) { return transformUnaryOperation(that); }
        case (is UnaryTypeOperation) { return transformUnaryTypeOperation(that); }
    }
    shared actual default Result transformUnaryOperation(UnaryOperation that) {
        switch (that)
        case (is PostfixOperation) { return transformPostfixOperation(that); }
        case (is PrefixOperation) { return transformPrefixOperation(that); }
        case (is UnaryArithmeticOperation) { return transformUnaryArithmeticOperation(that); }
        case (is ExistsOperation) { return transformExistsOperation(that); }
        case (is NonemptyOperation) { return transformNonemptyOperation(that); }
        case (is NotOperation) { return transformNotOperation(that); }
    }
    shared actual default Result transformUnaryTypeOperation(UnaryTypeOperation that) {
        switch (that)
        case (is IsOperation) { return transformIsOperation(that); }
        case (is OfOperation) { return transformOfOperation(that); }
    }
    shared actual default Result transformUnionableType(UnionableType that) {
        switch (that)
        case (is PrimaryType) { return transformPrimaryType(that); }
        case (is IntersectionType) { return transformIntersectionType(that); }
    }
    shared actual default Result transformValueExpression(ValueExpression that) {
        switch (that)
        case (is Primary) { return transformPrimary(that); }
        case (is Operation) { return transformOperation(that); }
    }
    shared actual default Result transformVariable(Variable that) {
        switch (that)
        case (is TypedVariable) { return transformTypedVariable(that); }
        case (is SpecifiedVariable) { return transformSpecifiedVariable(that); }
        case (is UnspecifiedVariable) { return transformUnspecifiedVariable(that); }
        case (is VariadicVariable) { return transformVariadicVariable(that); }
    }
    shared actual default Result transformVariance(Variance that) {
        switch (that)
        case (is InModifier) { return transformInModifier(that); }
        case (is OutModifier) { return transformOutModifier(that); }
    }
}
