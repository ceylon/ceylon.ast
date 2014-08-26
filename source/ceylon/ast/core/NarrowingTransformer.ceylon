"A [[Transformer]] with the default operation to narrow the type of the visited subject:
 [[transformIdentifier]] switches on the subject and descends into the `transform` method
 of the appropriate case type of [[Identifier]]. All “bottom” types’ methods are left `formal`."
see (`class Editor`)
shared interface NarrowingTransformer<out Result> satisfies Transformer<Result> {
    shared actual default Result transformAnyClass(AnyClass that) {
        switch (that)
        case (is ClassDefinition) { return transformClassDefinition(that); }
        case (is ClassAlias) { return transformClassAlias(that); }
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
    shared actual default Result transformClassOrInterface(ClassOrInterface that) {
        switch (that)
        case (is AnyClass) { return transformAnyClass(that); }
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
    shared actual default Result transformControlStructure(ControlStructure that) {
        switch (that)
        case (is IfElse) { return transformIfElse(that); }
        case (is While) { return transformWhile(that); }
        case (is ForFail) { return transformForFail(that); }
    }
    shared actual default Result transformDec(Dec that) {
        switch (that)
        case (is TypeDec) { return transformTypeDec(that); }
        case (is PackageDec) { return transformPackageDec(that); }
        case (is ModuleDec) { return transformModuleDec(that); }
    }
    shared actual default Result transformDeclaration(Declaration that) {
        switch (that)
        case (is TypeDeclaration) { return transformTypeDeclaration(that); }
        case (is TypedDeclaration) { return transformTypedDeclaration(that); }
        case (is ObjectDefinition) { return transformObjectDefinition(that); }
        case (is ValueSetterDefinition) { return transformValueSetterDefinition(that); }
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
    }
    shared actual default Result transformExpressionIsh(ExpressionIsh that) {
        switch (that)
        case (is Expression) { return transformExpression(that); }
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
    }
    shared actual default Result transformExpressionStatement(ExpressionStatement that) {
        switch (that)
        case (is AssignmentStatement) { return transformAssignmentStatement(that); }
        case (is PrefixPostfixStatement) { return transformPrefixPostfixStatement(that); }
        case (is InvocationStatement) { return transformInvocationStatement(that); }
    }
    shared actual default Result transformForIterator(ForIterator that) {
        switch (that)
        case (is ValueIterator) { return transformValueIterator(that); }
        case (is KeyValueIterator) { return transformKeyValueIterator(that); }
    }
    shared actual default Result transformIdentifier(Identifier that) {
        switch (that)
        case (is LIdentifier) { return transformLIdentifier(that); }
        case (is UIdentifier) { return transformUIdentifier(that); }
    }
    shared actual default Result transformImportAlias(ImportAlias that) {
        switch (that)
        case (is ImportTypeAlias) { return transformImportTypeAlias(that); }
        case (is ImportFunctionValueAlias) { return transformImportFunctionValueAlias(that); }
    }
    shared actual default Result transformImportElement(ImportElement that) {
        switch (that)
        case (is ImportTypeElement) { return transformImportTypeElement(that); }
        case (is ImportFunctionValueElement) { return transformImportFunctionValueElement(that); }
    }
    shared actual default Result transformInitialComprehensionClause(InitialComprehensionClause that) {
        switch (that)
        case (is ForComprehensionClause) { return transformForComprehensionClause(that); }
        case (is IfComprehensionClause) { return transformIfComprehensionClause(that); }
    }
    shared actual default Result transformLiteral(Literal that) {
        switch (that)
        case (is IntegerLiteral) { return transformIntegerLiteral(that); }
        case (is FloatLiteral) { return transformFloatLiteral(that); }
        case (is StringLiteral) { return transformStringLiteral(that); }
        case (is CharacterLiteral) { return transformCharacterLiteral(that); }
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
    shared actual default Result transformMeta(Meta that) {
        switch (that)
        case (is TypeMeta) { return transformTypeMeta(that); }
        case (is BaseMeta) { return transformBaseMeta(that); }
        case (is MemberMeta) { return transformMemberMeta(that); }
    }
    shared default Result transformMetaQualifier(MetaQualifier that) {
        switch (that)
        case (is SimpleType) { return transformSimpleType(that); }
        case (is GroupedType) { return transformGroupedType(that); }
        case (is MemberName) { return transformLIdentifier(that); }
    }
    shared actual default Result transformModifier(Modifier that) {
        switch (that)
        case (is VoidModifier) { return transformVoidModifier(that); }
        case (is ValueModifier) { return transformValueModifier(that); }
        case (is FunctionModifier) { return transformFunctionModifier(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
        case (is Variance) { return transformVariance(that); }
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
    }
    shared actual default Result transformNode(Node that) {
        switch (that)
        case (is ExpressionIsh) { return transformExpressionIsh(that); }
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
        case (is ConditionList) { return transformConditionList(that); }
        case (is IfClause) { return transformIfClause(that); }
        case (is ElseClause) { return transformElseClause(that); }
        case (is ClassInstantiation) { return transformClassInstantiation(that); }
        case (is ExtendedType) { return transformExtendedType(that); }
        case (is ClassSpecifier) { return transformClassSpecifier(that); }
        case (is TypeSpecifier) { return transformTypeSpecifier(that); }
        case (is Variable) { return transformVariable(that); }
        case (is ForIterator) { return transformForIterator(that); }
        case (is ForClause) { return transformForClause(that); }
        case (is FailClause) { return transformFailClause(that); }
        case (is ComprehensionClause) { return transformComprehensionClause(that); }
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
    shared actual default Result transformPostfixOperation(PostfixOperation that) {
        switch (that)
        case (is PostfixIncrementOperation) { return transformPostfixIncrementOperation(that); }
        case (is PostfixDecrementOperation) { return transformPostfixDecrementOperation(that); }
    }
    shared default Result transformPrecedence17Expression(Precedence17Expression that) {
        switch (that)
        case (is Precedence16Expression) { return transformPrecedence16Expression(that); }
        case (is AssignmentOperation) { return transformAssignmentOperation(that); }
    }
    shared default Result transformPrecedence1Expression(Precedence1Expression that) {
        switch (that)
        case (is Primary) { return transformPrimary(that); }
        case (is PrefixOperation) { return transformPrefixOperation(that); }
        case (is PostfixOperation) { return transformPostfixOperation(that); }
    }
    shared default Result transformPrecedence2Expression(Precedence2Expression that) {
        switch (that)
        case (is Precedence1Expression) { return transformPrecedence1Expression(that); }
        case (is ExponentiationOperation) { return transformExponentiationOperation(that); }
    }
    shared default Result transformPrecedence3Expression(Precedence3Expression that) {
        switch (that)
        case (is Precedence2Expression) { return transformPrecedence2Expression(that); }
        case (is UnaryArithmeticOperation) { return transformUnaryArithmeticOperation(that); }
    }
    shared default Result transformPrecedence4Expression(Precedence4Expression that) {
        switch (that)
        case (is Precedence3Expression) { return transformPrecedence3Expression(that); }
        case (is IntersectionOperation) { return transformIntersectionOperation(that); }
    }
    shared default Result transformPrecedence5Expression(Precedence5Expression that) {
        switch (that)
        case (is Precedence4Expression) { return transformPrecedence4Expression(that); }
        case (is UnionOperation) { return transformUnionOperation(that); }
        case (is ComplementOperation) { return transformComplementOperation(that); }
    }
    shared default Result transformPrecedence6Expression(Precedence6Expression that) {
        switch (that)
        case (is Precedence5Expression) { return transformPrecedence5Expression(that); }
        case (is ProductOperation) { return transformProductOperation(that); }
        case (is QuotientOperation) { return transformQuotientOperation(that); }
        case (is RemainderOperation) { return transformRemainderOperation(that); }
    }
    shared default Result transformPrecedence7Expression(Precedence7Expression that) {
        switch (that)
        case (is Precedence6Expression) { return transformPrecedence6Expression(that); }
        case (is ScaleOperation) { return transformScaleOperation(that); }
    }
    shared default Result transformPrecedence8Expression(Precedence8Expression that) {
        switch (that)
        case (is Precedence7Expression) { return transformPrecedence7Expression(that); }
        case (is SumOperation) { return transformSumOperation(that); }
        case (is DifferenceOperation) { return transformDifferenceOperation(that); }
    }
    shared default Result transformPrecedence9Expression(Precedence9Expression that) {
        switch (that)
        case (is Precedence8Expression) { return transformPrecedence8Expression(that); }
        case (is SpanOperation) { return transformSpanOperation(that); }
        case (is MeasureOperation) { return transformMeasureOperation(that); }
        case (is EntryOperation) { return transformEntryOperation(that); }
    }
    shared default Result transformPrecedence10Expression(Precedence10Expression that) {
        switch (that)
        case (is Precedence9Expression) { return transformPrecedence9Expression(that); }
        case (is ExistsOperation) { return transformExistsOperation(that); }
        case (is NonemptyOperation) { return transformNonemptyOperation(that); }
    }
    shared default Result transformPrecedence11Expression(Precedence11Expression that) {
        switch (that)
        case (is Precedence10Expression) { return transformPrecedence10Expression(that); }
        case (is IsOperation) { return transformIsOperation(that); }
        case (is OfOperation) { return transformOfOperation(that); }
        case (is InOperation) { return transformInOperation(that); }
        case (is ComparisonOperation) { return transformComparisonOperation(that); }
        case (is CompareOperation) { return transformCompareOperation(that); }
        case (is WithinOperation) { return transformWithinOperation(that); }
    }
    shared default Result transformPrecedence12Expression(Precedence12Expression that) {
        switch (that)
        case (is Precedence11Expression) { return transformPrecedence11Expression(that); }
        case (is EqualityOperation) { return transformEqualityOperation(that); }
    }
    shared default Result transformPrecedence13Expression(Precedence13Expression that) {
        switch (that)
        case (is Precedence12Expression) { return transformPrecedence12Expression(that); }
        case (is NotOperation) { return transformNotOperation(that); }
    }
    shared default Result transformPrecedence14Expression(Precedence14Expression that) {
        switch (that)
        case (is Precedence13Expression) { return transformPrecedence13Expression(that); }
        case (is AndOperation) { return transformAndOperation(that); }
    }
    shared default Result transformPrecedence15Expression(Precedence15Expression that) {
        switch (that)
        case (is Precedence14Expression) { return transformPrecedence14Expression(that); }
        case (is OrOperation) { return transformOrOperation(that); }
    }
    shared default Result transformPrecedence16Expression(Precedence16Expression that) {
        switch (that)
        case (is Precedence15Expression) { return transformPrecedence15Expression(that); }
        case (is ThenOperation) { return transformThenOperation(that); }
        case (is ElseOperation) { return transformElseOperation(that); }
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
    }
    shared actual default Result transformStatement(Statement that) {
        switch (that)
        case (is Specification) { return transformSpecification(that); }
        case (is ExpressionStatement) { return transformExpressionStatement(that); }
        case (is Assertion) { return transformAssertion(that); }
        case (is Directive) { return transformDirective(that); }
        case (is ControlStructure) { return transformControlStructure(that); }
    }
    shared actual default Result transformType(Type that) {
        switch (that)
        case (is MainType) { return transformMainType(that); }
        case (is EntryType) { return transformEntryType(that); }
    }
    shared actual default Result transformTypeDec(TypeDec that) {
        switch (that)
        case (is GivenDec) { return transformGivenDec(that); }
    }
    shared actual default Result transformTypeDeclaration(TypeDeclaration that) {
        switch (that)
        case (is ClassOrInterface) { return transformClassOrInterface(that); }
    }
    shared actual default Result transformTypeIsh(TypeIsh that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is NameWithTypeArguments) { return transformNameWithTypeArguments(that); }
        case (is VariadicType) { return transformVariadicType(that); }
        case (is DefaultedType) { return transformDefaultedType(that); }
        case (is TypeList) { return transformTypeList(that); }
        case (is TypeArgument) { return transformTypeArgument(that); }
        case (is TypeArguments) { return transformTypeArguments(that); }
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
    }
    shared actual default Result transformVariance(Variance that) {
        switch (that)
        case (is InModifier) { return transformInModifier(that); }
        case (is OutModifier) { return transformOutModifier(that); }
    }
}
