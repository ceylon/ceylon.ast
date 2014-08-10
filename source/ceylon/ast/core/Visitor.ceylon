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
    transformAlias(Alias that) => visitAlias(that);
    transformAndAssignmentOperation(AndAssignmentOperation that) => visitAndAssignmentOperation(that);
    transformAndOperation(AndOperation that) => visitAndOperation(that);
    transformAnnotation(Annotation that) => visitAnnotation(that);
    transformAnnotations(Annotations that) => visitAnnotations(that);
    transformAnonymousArgument(AnonymousArgument that) => visitAnonymousArgument(that);
    transformAnyCompilationUnit(AnyCompilationUnit that) => visitAnyCompilationUnit(that);
    transformAnyFunction(AnyFunction that) => visitAnyFunction(that);
    transformAnySpecifier(AnySpecifier that) => visitAnySpecifier(that);
    transformAnyValue(AnyValue that) => visitAnyValue(that);
    transformArgumentList(ArgumentList that) => visitArgumentList(that);
    transformArguments(Arguments that) => visitArguments(that);
    transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    transformArithmeticOperation(ArithmeticOperation that) => visitArithmeticOperation(that);
    transformAssignOperation(AssignOperation that) => visitAssignOperation(that);
    transformAssignmentOperation(AssignmentOperation that) => visitAssignmentOperation(that);
    transformAssignmentStatement(AssignmentStatement that) => visitAssignmentStatement(that);
    transformAtom(Atom that) => visitAtom(that);
    transformBaseExpression(BaseExpression that) => visitBaseExpression(that);
    transformBaseMeta(BaseMeta that) => visitBaseMeta(that);
    transformBaseType(BaseType that) => visitBaseType(that);
    transformBinaryOperation(BinaryOperation that) => visitBinaryOperation(that);
    transformBlock(Block that) => visitBlock(that);
    transformBody(Body that) => visitBody(that);
    transformBound(Bound that) => visitBound(that);
    transformCallableParameter(CallableParameter that) => visitCallableParameter(that);
    transformCallableType(CallableType that) => visitCallableType(that);
    transformCaseTypes(CaseTypes that) => visitCaseTypes(that);
    transformCharacterLiteral(CharacterLiteral that) => visitCharacterLiteral(that);
    transformClassBody(ClassBody that) => visitClassBody(that);
    transformClosedBound(ClosedBound that) => visitClosedBound(that);
    transformCompareOperation(CompareOperation that) => visitCompareOperation(that);
    transformComparisonOperation(ComparisonOperation that) => visitComparisonOperation(that);
    transformCompilationUnit(CompilationUnit that) => visitCompilationUnit(that);
    transformComplementAssignmentOperation(ComplementAssignmentOperation that) => visitComplementAssignmentOperation(that);
    transformComplementOperation(ComplementOperation that) => visitComplementOperation(that);
    transformDec(Dec that) => visitDec(that);
    transformDeclaration(Declaration that) => visitDeclaration(that);
    transformDefaultedCallableParameter(DefaultedCallableParameter that) => visitDefaultedCallableParameter(that);
    transformDefaultedParameter(DefaultedParameter that) => visitDefaultedParameter(that);
    transformDefaultedParameterReference(DefaultedParameterReference that) => visitDefaultedParameterReference(that);
    transformDefaultedType(DefaultedType that) => visitDefaultedType(that);
    transformDefaultedValueParameter(DefaultedValueParameter that) => visitDefaultedValueParameter(that);
    transformDifferenceOperation(DifferenceOperation that) => visitDifferenceOperation(that);
    transformDivideAssignmentOperation(DivideAssignmentOperation that) => visitDivideAssignmentOperation(that);
    transformDynamicModifier(DynamicModifier that) => visitDynamicModifier(that);
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
    transformExpressionStatement(ExpressionStatement that) => visitExpressionStatement(that);
    transformFloatLiteral(FloatLiteral that) => visitFloatLiteral(that);
    transformFullPackageName(FullPackageName that) => visitFullPackageName(that);
    transformFunctionDeclaration(FunctionDeclaration that) => visitFunctionDeclaration(that);
    transformFunctionDefinition(FunctionDefinition that) => visitFunctionDefinition(that);
    transformFunctionModifier(FunctionModifier that) => visitFunctionModifier(that);
    transformFunctionValueAlias(FunctionValueAlias that) => visitFunctionValueAlias(that);
    transformGivenDec(GivenDec that) => visitGivenDec(that);
    transformGroupedExpression(GroupedExpression that) => visitGroupedExpression(that);
    transformGroupedType(GroupedType that) => visitGroupedType(that);
    transformIdenticalOperation(IdenticalOperation that) => visitIdenticalOperation(that);
    transformIdentifier(Identifier that) => visitIdentifier(that);
    transformIdentityOperation(IdentityOperation that) => visitIdentityOperation(that);
    transformImport(Import that) => visitImport(that);
    transformImportElement(ImportElement that) => visitImportElement(that);
    transformImportElements(ImportElements that) => visitImportElements(that);
    transformImportFunctionValueElement(ImportFunctionValueElement that) => visitImportFunctionValueElement(that);
    transformImportTypeElement(ImportTypeElement that) => visitImportTypeElement(that);
    transformImportWildcard(ImportWildcard that) => visitImportWildcard(that);
    transformInModifier(InModifier that) => visitInModifier(that);
    transformInOperation(InOperation that) => visitInOperation(that);
    transformIntegerLiteral(IntegerLiteral that) => visitIntegerLiteral(that);
    transformInterfaceBody(InterfaceBody that) => visitInterfaceBody(that);
    transformIntersectAssignmentOperation(IntersectAssignmentOperation that) => visitIntersectAssignmentOperation(that);
    transformIntersectionOperation(IntersectionOperation that) => visitIntersectionOperation(that);
    transformIntersectionType(IntersectionType that) => visitIntersectionType(that);
    transformInvocation(Invocation that) => visitInvocation(that);
    transformInvocationStatement(InvocationStatement that) => visitInvocationStatement(that);
    transformIsOperation(IsOperation that) => visitIsOperation(that);
    transformIterable(Iterable that) => visitIterable(that);
    transformIterableType(IterableType that) => visitIterableType(that);
    transformLIdentifier(LIdentifier that) => visitLIdentifier(that);
    transformLargeAsOperation(LargeAsOperation that) => visitLargeAsOperation(that);
    transformLargerOperation(LargerOperation that) => visitLargerOperation(that);
    transformLazySpecifier(LazySpecifier that) => visitLazySpecifier(that);
    transformLiteral(Literal that) => visitLiteral(that);
    transformLogicalAssignmentOperation(LogicalAssignmentOperation that) => visitLogicalAssignmentOperation(that);
    transformLogicalOperation(LogicalOperation that) => visitLogicalOperation(that);
    transformMainType(MainType that) => visitMainType(that);
    transformMeasureOperation(MeasureOperation that) => visitMeasureOperation(that);
    transformMemberMeta(MemberMeta that) => visitMemberMeta(that);
    transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => visitMemberNameWithTypeArguments(that);
    transformMeta(Meta that) => visitMeta(that);
    transformModifier(Modifier that) => visitModifier(that);
    transformModuleBody(ModuleBody that) => visitModuleBody(that);
    transformModuleCompilationUnit(ModuleCompilationUnit that) => visitModuleCompilationUnit(that);
    transformModuleDec(ModuleDec that) => visitModuleDec(that);
    transformModuleDescriptor(ModuleDescriptor that) => visitModuleDescriptor(that);
    transformModuleImport(ModuleImport that) => visitModuleImport(that);
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
    transformOpenBound(OpenBound that) => visitOpenBound(that);
    transformOperation(Operation that) => visitOperation(that);
    transformOptionalType(OptionalType that) => visitOptionalType(that);
    transformOrAssignmentOperation(OrAssignmentOperation that) => visitOrAssignmentOperation(that);
    transformOrOperation(OrOperation that) => visitOrOperation(that);
    transformOutModifier(OutModifier that) => visitOutModifier(that);
    transformOuter(Outer that) => visitOuter(that);
    transformPackage(Package that) => visitPackage(that);
    transformPackageCompilationUnit(PackageCompilationUnit that) => visitPackageCompilationUnit(that);
    transformPackageDec(PackageDec that) => visitPackageDec(that);
    transformPackageDescriptor(PackageDescriptor that) => visitPackageDescriptor(that);
    transformParameter(Parameter that) => visitParameter(that);
    transformParameterReference(ParameterReference that) => visitParameterReference(that);
    transformParameters(Parameters that) => visitParameters(that);
    transformPositionalArguments(PositionalArguments that) => visitPositionalArguments(that);
    transformPostfixDecrementOperation(PostfixDecrementOperation that) => visitPostfixDecrementOperation(that);
    transformPostfixIncrementOperation(PostfixIncrementOperation that) => visitPostfixIncrementOperation(that);
    transformPostfixOperation(PostfixOperation that) => visitPostfixOperation(that);
    transformPrefixDecrementOperation(PrefixDecrementOperation that) => visitPrefixDecrementOperation(that);
    transformPrefixIncrementOperation(PrefixIncrementOperation that) => visitPrefixIncrementOperation(that);
    transformPrefixOperation(PrefixOperation that) => visitPrefixOperation(that);
    transformPrefixPostfixStatement(PrefixPostfixStatement that) => visitPrefixPostfixStatement(that);
    transformPrimary(Primary that) => visitPrimary(that);
    transformProductOperation(ProductOperation that) => visitProductOperation(that);
    transformQualifiedExpression(QualifiedExpression that) => visitQualifiedExpression(that);
    transformQualifiedType(QualifiedType that) => visitQualifiedType(that);
    transformQuotientOperation(QuotientOperation that) => visitQuotientOperation(that);
    transformRemainderAssignmentOperation(RemainderAssignmentOperation that) => visitRemainderAssignmentOperation(that);
    transformRemainderOperation(RemainderOperation that) => visitRemainderOperation(that);
    transformRequiredParameter(RequiredParameter that) => visitRequiredParameter(that);
    transformSatisfiedTypes(SatisfiedTypes that) => visitSatisfiedTypes(that);
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
    transformStringTemplate(StringTemplate that) => visitStringTemplate(that);
    transformSubtractAssignmentOperation(SubtractAssignmentOperation that) => visitSubtractAssignmentOperation(that);
    transformSumOperation(SumOperation that) => visitSumOperation(that);
    transformSuper(Super that) => visitSuper(that);
    transformThenOperation(ThenOperation that) => visitThenOperation(that);
    transformThis(This that) => visitThis(that);
    transformTuple(Tuple that) => visitTuple(that);
    transformTupleType(TupleType that) => visitTupleType(that);
    transformType(Type that) => visitType(that);
    transformTypeAlias(TypeAlias that) => visitTypeAlias(that);
    transformTypeArgument(TypeArgument that) => visitTypeArgument(that);
    transformTypeArguments(TypeArguments that) => visitTypeArguments(that);
    transformTypeConstraint(TypeConstraint that) => visitTypeConstraint(that);
    transformTypeDec(TypeDec that) => visitTypeDec(that);
    transformTypeList(TypeList that) => visitTypeList(that);
    transformTypeMeta(TypeMeta that) => visitTypeMeta(that);
    transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => visitTypeNameWithTypeArguments(that);
    transformTypeParameter(TypeParameter that) => visitTypeParameter(that);
    transformTypeParameters(TypeParameters that) => visitTypeParameters(that);
    transformTypedDeclaration(TypedDeclaration that) => visitTypedDeclaration(that);
    transformUIdentifier(UIdentifier that) => visitUIdentifier(that);
    transformUnaryArithmeticOperation(UnaryArithmeticOperation that) => visitUnaryArithmeticOperation(that);
    transformUnaryIshOperation(UnaryIshOperation that) => visitUnaryIshOperation(that);
    transformUnaryOperation(UnaryOperation that) => visitUnaryOperation(that);
    transformUnaryTypeOperation(UnaryTypeOperation that) => visitUnaryTypeOperation(that);
    transformUnionAssignmentOperation(UnionAssignmentOperation that) => visitUnionAssignmentOperation(that);
    transformUnionOperation(UnionOperation that) => visitUnionOperation(that);
    transformUnionType(UnionType that) => visitUnionType(that);
    transformUnionableType(UnionableType that) => visitUnionableType(that);
    transformValueDeclaration(ValueDeclaration that) => visitValueDeclaration(that);
    transformValueDefinition(ValueDefinition that) => visitValueDefinition(that);
    transformValueExpression(ValueExpression that) => visitValueExpression(that);
    transformValueGetterDefinition(ValueGetterDefinition that) => visitValueGetterDefinition(that);
    transformValueModifier(ValueModifier that) => visitValueModifier(that);
    transformValueParameter(ValueParameter that) => visitValueParameter(that);
    transformValueSpecification(ValueSpecification that) => visitValueSpecification(that);
    transformVariadicParameter(VariadicParameter that) => visitVariadicParameter(that);
    transformVariance(Variance that) => visitVariance(that);
    transformVoidModifier(VoidModifier that) => visitVoidModifier(that);
    transformWithinOperation(WithinOperation that) => visitWithinOperation(that);
    
    shared default void visitAddAssignmentOperation(AddAssignmentOperation that) => super.transformAddAssignmentOperation(that);
    shared default void visitAlias(Alias that) => super.transformAlias(that);
    shared default void visitAndAssignmentOperation(AndAssignmentOperation that) => super.transformAndAssignmentOperation(that);
    shared default void visitAndOperation(AndOperation that) => super.transformAndOperation(that);
    shared default void visitAnnotation(Annotation that) => super.transformAnnotation(that);
    shared default void visitAnnotations(Annotations that) => super.transformAnnotations(that);
    shared default void visitAnonymousArgument(AnonymousArgument that) => super.transformAnonymousArgument(that);
    shared default void visitAnyCompilationUnit(AnyCompilationUnit that) => super.transformAnyCompilationUnit(that);
    shared default void visitAnyFunction(AnyFunction that) => super.transformAnyFunction(that);
    shared default void visitAnySpecifier(AnySpecifier that) => super.transformAnySpecifier(that);
    shared default void visitAnyValue(AnyValue that) => super.transformAnyValue(that);
    shared default void visitArgumentList(ArgumentList that) => super.transformArgumentList(that);
    shared default void visitArguments(Arguments that) => super.transformArguments(that);
    shared default void visitArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => super.transformArithmeticAssignmentOperation(that);
    shared default void visitArithmeticOperation(ArithmeticOperation that) => super.transformArithmeticOperation(that);
    shared default void visitAssignOperation(AssignOperation that) => super.transformAssignOperation(that);
    shared default void visitAssignmentOperation(AssignmentOperation that) => super.transformAssignmentOperation(that);
    shared default void visitAssignmentStatement(AssignmentStatement that) => super.transformAssignmentStatement(that);
    shared default void visitAtom(Atom that) => super.transformAtom(that);
    shared default void visitBaseExpression(BaseExpression that) => super.transformBaseExpression(that);
    shared default void visitBaseMeta(BaseMeta that) => super.transformBaseMeta(that);
    shared default void visitBaseType(BaseType that) => super.transformBaseType(that);
    shared default void visitBinaryOperation(BinaryOperation that) => super.transformBinaryOperation(that);
    shared default void visitBlock(Block that) => super.transformBlock(that);
    shared default void visitBody(Body that) => super.transformBody(that);
    shared default void visitBound(Bound that) => super.transformBound(that);
    shared default void visitCallableParameter(CallableParameter that) => super.transformCallableParameter(that);
    shared default void visitCallableType(CallableType that) => super.transformCallableType(that);
    shared default void visitCaseTypes(CaseTypes that) => super.transformCaseTypes(that);
    shared default void visitCharacterLiteral(CharacterLiteral that) => super.transformCharacterLiteral(that);
    shared default void visitClassBody(ClassBody that) => super.transformClassBody(that);
    shared default void visitClosedBound(ClosedBound that) => super.transformClosedBound(that);
    shared default void visitCompareOperation(CompareOperation that) => super.transformCompareOperation(that);
    shared default void visitComparisonOperation(ComparisonOperation that) => super.transformComparisonOperation(that);
    shared default void visitCompilationUnit(CompilationUnit that) => super.transformCompilationUnit(that);
    shared default void visitComplementAssignmentOperation(ComplementAssignmentOperation that) => super.transformComplementAssignmentOperation(that);
    shared default void visitComplementOperation(ComplementOperation that) => super.transformComplementOperation(that);
    shared default void visitDec(Dec that) => super.transformDec(that);
    shared default void visitDeclaration(Declaration that) => super.transformDeclaration(that);
    shared default void visitDefaultedCallableParameter(DefaultedCallableParameter that) => super.transformDefaultedCallableParameter(that);
    shared default void visitDefaultedParameter(DefaultedParameter that) => super.transformDefaultedParameter(that);
    shared default void visitDefaultedParameterReference(DefaultedParameterReference that) => super.transformDefaultedParameterReference(that);
    shared default void visitDefaultedType(DefaultedType that) => super.transformDefaultedType(that);
    shared default void visitDefaultedValueParameter(DefaultedValueParameter that) => super.transformDefaultedValueParameter(that);
    shared default void visitDifferenceOperation(DifferenceOperation that) => super.transformDifferenceOperation(that);
    shared default void visitDivideAssignmentOperation(DivideAssignmentOperation that) => super.transformDivideAssignmentOperation(that);
    shared default void visitDynamicModifier(DynamicModifier that) => super.transformDynamicModifier(that);
    shared default void visitDynamicValue(DynamicValue that) => super.transformDynamicValue(that);
    shared default void visitElseOperation(ElseOperation that) => super.transformElseOperation(that);
    shared default void visitEntryOperation(EntryOperation that) => super.transformEntryOperation(that);
    shared default void visitEqualOperation(EqualOperation that) => super.transformEqualOperation(that);
    shared default void visitEqualityOperation(EqualityOperation that) => super.transformEqualityOperation(that);
    shared default void visitExistsOperation(ExistsOperation that) => super.transformExistsOperation(that);
    shared default void visitExpressionStatement(ExpressionStatement that) => super.transformExpressionStatement(that);
    shared default void visitFullPackageName(FullPackageName that) => super.transformFullPackageName(that);
    shared default void visitFunctionDeclaration(FunctionDeclaration that) => super.transformFunctionDeclaration(that);
    shared default void visitFunctionDefinition(FunctionDefinition that) => super.transformFunctionDefinition(that);
    shared default void visitFunctionModifier(FunctionModifier that) => super.transformFunctionModifier(that);
    shared default void visitFunctionValueAlias(FunctionValueAlias that) => super.transformFunctionValueAlias(that);
    shared default void visitIdenticalOperation(IdenticalOperation that) => super.transformIdenticalOperation(that);
    shared default void visitImport(Import that) => super.transformImport(that);
    shared default void visitImportElements(ImportElements that) => super.transformImportElements(that);
    shared default void visitImportElement(ImportElement that) => super.transformImportElement(that);
    shared default void visitImportFunctionValueElement(ImportFunctionValueElement that) => super.transformImportFunctionValueElement(that);
    shared default void visitImportTypeElement(ImportTypeElement that) => super.transformImportTypeElement(that);
    shared default void visitImportWildcard(ImportWildcard that) => super.transformImportWildcard(that);
    shared default void visitInModifier(InModifier that) => super.transformInModifier(that);
    shared default void visitInOperation(InOperation that) => super.transformInOperation(that);
    shared default void visitInterfaceBody(InterfaceBody that) => super.transformInterfaceBody(that);
    shared default void visitIntersectAssignmentOperation(IntersectAssignmentOperation that) => super.transformIntersectAssignmentOperation(that);
    shared default void visitInvocation(Invocation that) => super.transformInvocation(that);
    shared default void visitInvocationStatement(InvocationStatement that) => super.transformInvocationStatement(that);
    shared default void visitIsOperation(IsOperation that) => super.transformIsOperation(that);
    shared default void visitIterable(Iterable that) => super.transformIterable(that);
    shared default void visitLargeAsOperation(LargeAsOperation that) => super.transformLargeAsOperation(that);
    shared default void visitLargerOperation(LargerOperation that) => super.transformLargerOperation(that);
    shared default void visitLazySpecifier(LazySpecifier that) => super.transformLazySpecifier(that);
    shared default void visitLogicalAssignmentOperation(LogicalAssignmentOperation that) => super.transformLogicalAssignmentOperation(that);
    shared default void visitLogicalOperation(LogicalOperation that) => super.transformLogicalOperation(that);
    shared default void visitMeasureOperation(MeasureOperation that) => super.transformMeasureOperation(that);
    shared default void visitModifier(Modifier that) => super.transformModifier(that);
    shared default void visitModuleBody(ModuleBody that) => super.transformModuleBody(that);
    shared default void visitModuleCompilationUnit(ModuleCompilationUnit that) => super.transformModuleCompilationUnit(that);
    shared default void visitModuleDec(ModuleDec that) => super.transformModuleDec(that);
    shared default void visitModuleDescriptor(ModuleDescriptor that) => super.transformModuleDescriptor(that);
    shared default void visitModuleImport(ModuleImport that) => super.transformModuleImport(that);
    shared default void visitMultiplyAssignmentOperation(MultiplyAssignmentOperation that) => super.transformMultiplyAssignmentOperation(that);
    shared default void visitNamedArgument(NamedArgument that) => super.transformNamedArgument(that);
    shared default void visitNamedArguments(NamedArguments that) => super.transformNamedArguments(that);
    shared default void visitNonemptyOperation(NonemptyOperation that) => super.transformNonemptyOperation(that);
    shared default void visitNotEqualOperation(NotEqualOperation that) => super.transformNotEqualOperation(that);
    shared default void visitNotOperation(NotOperation that) => super.transformNotOperation(that);
    shared default void visitOfOperation(OfOperation that) => super.transformOfOperation(that);
    shared default void visitOpenBound(OpenBound that) => super.transformOpenBound(that);
    shared default void visitOrAssignmentOperation(OrAssignmentOperation that) => super.transformOrAssignmentOperation(that);
    shared default void visitOrOperation(OrOperation that) => super.transformOrOperation(that);
    shared default void visitOutModifier(OutModifier that) => super.transformOutModifier(that);
    shared default void visitPackageCompilationUnit(PackageCompilationUnit that) => super.transformPackageCompilationUnit(that);
    shared default void visitPackageDec(PackageDec that) => super.transformPackageDec(that);
    shared default void visitPackageDescriptor(PackageDescriptor that) => super.transformPackageDescriptor(that);
    shared default void visitParameter(Parameter that) => super.transformParameter(that);
    shared default void visitParameterReference(ParameterReference that) => super.transformParameterReference(that);
    shared default void visitParameters(Parameters that) => super.transformParameters(that);
    shared default void visitPositionalArguments(PositionalArguments that) => super.transformPositionalArguments(that);
    shared default void visitPrefixPostfixStatement(PrefixPostfixStatement that) => super.transformPrefixPostfixStatement(that);
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
    shared default void visitSatisfiedTypes(SatisfiedTypes that) => super.transformSatisfiedTypes(that);
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
    shared default void visitStringTemplate(StringTemplate that) => super.transformStringTemplate(that);
    shared default void visitSubtractAssignmentOperation(SubtractAssignmentOperation that) => super.transformSubtractAssignmentOperation(that);
    shared default void visitSumOperation(SumOperation that) => super.transformSumOperation(that);
    shared default void visitSuper(Super that) => super.transformSuper(that);
    shared default void visitThenOperation(ThenOperation that) => super.transformThenOperation(that);
    shared default void visitThis(This that) => super.transformThis(that);
    shared default void visitTuple(Tuple that) => super.transformTuple(that);
    shared default void visitTupleType(TupleType that) => super.transformTupleType(that);
    shared default void visitType(Type that) => super.transformType(that);
    shared default void visitTypeAlias(TypeAlias that) => super.transformTypeAlias(that);
    shared default void visitTypeArgument(TypeArgument that) => super.transformTypeArgument(that);
    shared default void visitTypeArguments(TypeArguments that) => super.transformTypeArguments(that);
    shared default void visitTypeConstraint(TypeConstraint that) => super.transformTypeConstraint(that);
    shared default void visitTypeDec(TypeDec that) => super.transformTypeDec(that);
    shared default void visitTypeList(TypeList that) => super.transformTypeList(that);
    shared default void visitTypeMeta(TypeMeta that) => super.transformTypeMeta(that);
    shared default void visitTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => super.transformTypeNameWithTypeArguments(that);
    shared default void visitTypeParameter(TypeParameter that) => super.transformTypeParameter(that);
    shared default void visitTypeParameters(TypeParameters that) => super.transformTypeParameters(that);
    shared default void visitTypedDeclaration(TypedDeclaration that) => super.transformTypedDeclaration(that);
    shared default void visitUIdentifier(UIdentifier that) => super.transformUIdentifier(that);
    shared default void visitUnaryArithmeticOperation(UnaryArithmeticOperation that) => super.transformUnaryArithmeticOperation(that);
    shared default void visitUnaryIshOperation(UnaryIshOperation that) => super.transformUnaryIshOperation(that);
    shared default void visitUnaryOperation(UnaryOperation that) => super.transformUnaryOperation(that);
    shared default void visitUnaryTypeOperation(UnaryTypeOperation that) => super.transformUnaryTypeOperation(that);
    shared default void visitUnionAssignmentOperation(UnionAssignmentOperation that) => super.transformUnionAssignmentOperation(that);
    shared default void visitUnionOperation(UnionOperation that) => super.transformUnionOperation(that);
    shared default void visitUnionType(UnionType that) => super.transformUnionType(that);
    shared default void visitUnionableType(UnionableType that) => super.transformUnionableType(that);
    shared default void visitValueDeclaration(ValueDeclaration that) => super.transformValueDeclaration(that);
    shared default void visitValueDefinition(ValueDefinition that) => super.transformValueDefinition(that);
    shared default void visitValueExpression(ValueExpression that) => super.transformValueExpression(that);
    shared default void visitValueGetterDefinition(ValueGetterDefinition that) => super.transformValueGetterDefinition(that);
    shared default void visitValueModifier(ValueModifier that) => super.transformValueModifier(that);
    shared default void visitValueParameter(ValueParameter that) => super.transformValueParameter(that);
    shared default void visitValueSpecification(ValueSpecification that) => super.transformValueSpecification(that);
    shared default void visitVariadicParameter(VariadicParameter that) => super.transformVariadicParameter(that);
    shared default void visitVariance(Variance that) => super.transformVariance(that);
    shared default void visitVoidModifier(VoidModifier that) => super.transformVoidModifier(that);
    shared default void visitWithinOperation(WithinOperation that) => super.transformWithinOperation(that);
}
