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
 anywhere in the AST, you can simply override that particular method and leave the rest as it is.
 
 Note: conceptually, a `Visitor` is a `WideningTransformer<Anything>`,
 that is, a `WideningTransformer` without any result.
 However, for performance reasons, this notion was dropped in the 1.2.1 release,
 and `Visitor` is now an independent, unparameterized interface.
 See [#109](https://github.com/ceylon/ceylon.ast/pull/109) for more information."
shared interface Visitor {
    shared default void visitAddAssignmentOperation(AddAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    shared default void visitAliasDec(AliasDec that) => visitTypeDec(that);
    shared default void visitAndAssignmentOperation(AndAssignmentOperation that) => visitLogicalAssignmentOperation(that);
    shared default void visitAndOperation(AndOperation that) => visitLogicalOperation(that);
    shared default void visitAnnotation(Annotation that) => visitNode(that);
    shared default void visitAnnotations(Annotations that) => visitNode(that);
    shared default void visitAnonymousArgument(AnonymousArgument that) => visitNamedArgument(that);
    shared default void visitAnyClass(AnyClass that) => visitClassOrInterface(that);
    shared default void visitAnyCompilationUnit(AnyCompilationUnit that) => visitNode(that);
    shared default void visitAnyFunction(AnyFunction that) => visitTypedDeclaration(that);
    shared default void visitAnyInterface(AnyInterface that) => visitClassOrInterface(that);
    shared default void visitAnyInterfaceDefinition(AnyInterfaceDefinition that) => visitAnyInterface(that);
    shared default void visitAnyMemberOperator(AnyMemberOperator that) => visitNode(that);
    shared default void visitAnyValue(AnyValue that) => visitTypedDeclaration(that);
    shared default void visitAnySpecifier(AnySpecifier that) => visitNode(that);
    shared default void visitArgumentList(ArgumentList that) => visitNode(that);
    shared default void visitArguments(Arguments that) => visitNode(that);
    shared default void visitArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => visitAssignmentOperation(that);
    shared default void visitArithmeticOperation(ArithmeticOperation that) => visitBinaryOperation(that);
    shared default void visitAssertion(Assertion that) => visitStatement(that);
    shared default void visitAssignOperation(AssignOperation that) => visitAssignmentOperation(that);
    shared default void visitAssignmentOperation(AssignmentOperation that) => visitBinaryOperation(that);
    shared default void visitAssignmentStatement(AssignmentStatement that) => visitExpressionStatement(that);
    shared default void visitAtom(Atom that) => visitPrimary(that);
    shared default void visitBaseExpression(BaseExpression that) => visitPrimary(that);
    shared default void visitBaseMeta(BaseMeta that) => visitMeta(that);
    shared default void visitBaseType(BaseType that) => visitSimpleType(that);
    shared default void visitBinaryOperation(BinaryOperation that) => visitOperation(that);
    shared default void visitBlock(Block that) => visitBody(that);
    shared default void visitBody(Body that) => visitNode(that);
    shared default void visitBooleanCondition(BooleanCondition that) => visitCondition(that);
    shared default void visitBound(Bound that) => visitNode(that);
    shared default void visitBreak(Break that) => visitDirective(that);
    shared default void visitCallableConstructorDefinition(CallableConstructorDefinition that) => visitConstructorDefinition(that);
    shared default void visitCallableParameter(CallableParameter that) => visitRequiredParameter(that);
    shared default void visitCallableType(CallableType that) => visitPrimaryType(that);
    shared default void visitCaseClause(CaseClause that) => visitNode(that);
    shared default void visitCaseExpression(CaseExpression that) => visitNode(that);
    shared default void visitCaseItem(CaseItem that) => visitNode(that);
    shared default void visitCaseTypes(CaseTypes that) => visitNode(that);
    shared default void visitCatchClause(CatchClause that) => visitNode(that);
    shared default void visitCharacterLiteral(CharacterLiteral that) => visitLiteral(that);
    shared default void visitClassAliasDefinition(ClassAliasDefinition that) => visitAnyClass(that);
    shared default void visitClassBody(ClassBody that) => visitBody(that);
    shared default void visitClassDec(ClassDec that) => visitTypeDec(that);
    shared default void visitClassDefinition(ClassDefinition that) => visitAnyClass(that);
    shared default void visitClassOrInterface(ClassOrInterface that) => visitTypeDeclaration(that);
    shared default void visitClassSpecifier(ClassSpecifier that) => visitNode(that);
    shared default void visitClosedBound(ClosedBound that) => visitBound(that);
    shared default void visitCompareOperation(CompareOperation that) => visitBinaryOperation(that);
    shared default void visitComparisonOperation(ComparisonOperation that) => visitBinaryOperation(that);
    shared default void visitCompilationUnit(CompilationUnit that) => visitAnyCompilationUnit(that);
    shared default void visitComplementAssignmentOperation(ComplementAssignmentOperation that) => visitSetAssignmentOperation(that);
    shared default void visitComplementOperation(ComplementOperation that) => visitSetOperation(that);
    shared default void visitComprehension(Comprehension that) => visitNode(that);
    shared default void visitComprehensionClause(ComprehensionClause that) => visitNode(that);
    shared default void visitCondition(Condition that) => visitNode(that);
    shared default void visitConditionalExpression(ConditionalExpression that) => visitExpression(that);
    shared default void visitConditions(Conditions that) => visitNode(that);
    shared default void visitConstruction(Construction that) => visitExtensionOrConstruction(that);
    shared default void visitConstructorDec(ConstructorDec that) => visitDec(that);
    shared default void visitConstructorDefinition(ConstructorDefinition that) => visitDeclaration(that);
    shared default void visitContinue(Continue that) => visitDirective(that);
    shared default void visitControlStructure(ControlStructure that) => visitStatement(that);
    shared default void visitDec(Dec that) => visitPrimary(that);
    shared default void visitDecQualifier(DecQualifier that) => visitNode(that);
    shared default void visitDeclaration(Declaration that) => visitNode(that);
    shared default void visitDefaultedCallableParameter(DefaultedCallableParameter that) => visitDefaultedParameter(that);
    shared default void visitDefaultedParameter(DefaultedParameter that) => visitParameter(that);
    shared default void visitDefaultedParameterReference(DefaultedParameterReference that) => visitDefaultedParameter(that);
    shared default void visitDefaultedType(DefaultedType that) => visitTypeIsh(that);
    shared default void visitDefaultedValueParameter(DefaultedValueParameter that) => visitDefaultedParameter(that);
    shared default void visitDestructure(Destructure that) => visitStatement(that);
    shared default void visitDifferenceOperation(DifferenceOperation that) => visitArithmeticOperation(that);
    shared default void visitDirective(Directive that) => visitStatement(that);
    shared default void visitDivideAssignmentOperation(DivideAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    shared default void visitDynamicBlock(DynamicBlock that) => visitControlStructure(that);
    shared default void visitDynamicInterfaceDefinition(DynamicInterfaceDefinition that) => visitAnyInterfaceDefinition(that);
    shared default void visitDynamicModifier(DynamicModifier that) => visitTypeModifier(that);
    shared default void visitDynamicValue(DynamicValue that) => visitAtom(that);
    shared default void visitElementOrSubrangeExpression(ElementOrSubrangeExpression that) => visitPrimary(that);
    shared default void visitElseClause(ElseClause that) => visitNode(that);
    shared default void visitElseOperation(ElseOperation that) => visitBinaryOperation(that);
    shared default void visitEntryOperation(EntryOperation that) => visitBinaryOperation(that);
    shared default void visitEntryPattern(EntryPattern that) => visitPattern(that);
    shared default void visitEntryType(EntryType that) => visitType(that);
    shared default void visitEqualOperation(EqualOperation that) => visitEqualityOperation(that);
    shared default void visitEqualityOperation(EqualityOperation that) => visitBinaryOperation(that);
    shared default void visitExistsCondition(ExistsCondition that) => visitExistsOrNonemptyCondition(that);
    shared default void visitExistsOperation(ExistsOperation that) => visitUnaryOperation(that);
    shared default void visitExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) => visitCondition(that);
    shared default void visitExponentiationOperation(ExponentiationOperation that) => visitArithmeticOperation(that);
    shared default void visitExpression(Expression that) => visitNode(that);
    shared default void visitExpressionComprehensionClause(ExpressionComprehensionClause that) => visitComprehensionClause(that);
    shared default void visitExpressionStatement(ExpressionStatement that) => visitStatement(that);
    shared default void visitExtendedType(ExtendedType that) => visitNode(that);
    shared default void visitExtension(Extension that) => visitExtensionOrConstruction(that);
    shared default void visitExtensionOrConstruction(ExtensionOrConstruction that) => visitNode(that);
    shared default void visitFailClause(FailClause that) => visitNode(that);
    shared default void visitFinallyClause(FinallyClause that) => visitNode(that);
    shared default void visitFloatLiteral(FloatLiteral that) => visitLiteral(that);
    shared default void visitForClause(ForClause that) => visitNode(that);
    shared default void visitForComprehensionClause(ForComprehensionClause that) => visitInitialComprehensionClause(that);
    shared default void visitForFail(ForFail that) => visitControlStructure(that);
    shared default void visitForIterator(ForIterator that) => visitNode(that);
    shared default void visitFullPackageName(FullPackageName that) => visitNode(that);
    shared default void visitFunctionArgument(FunctionArgument that) => visitInlineDefinitionArgument(that);
    shared default void visitFunctionDec(FunctionDec that) => visitMemberDec(that);
    shared default void visitFunctionDeclaration(FunctionDeclaration that) => visitAnyFunction(that);
    shared default void visitFunctionDefinition(FunctionDefinition that) => visitAnyFunction(that);
    shared default void visitFunctionExpression(FunctionExpression that) => visitExpression(that);
    shared default void visitFunctionModifier(FunctionModifier that) => visitLocalModifier(that);
    shared default void visitFunctionShortcutDefinition(FunctionShortcutDefinition that) => visitAnyFunction(that);
    shared default void visitGivenDec(GivenDec that) => visitTypeDec(that);
    shared default void visitGroupedExpression(GroupedExpression that) => visitAtom(that);
    shared default void visitGroupedType(GroupedType that) => visitPrimaryType(that);
    shared default void visitIdenticalOperation(IdenticalOperation that) => visitEqualityOperation(that);
    shared default void visitIdentifier(Identifier that) => visitNode(that);
    shared default void visitIdentityOperation(IdentityOperation that) => visitUnaryArithmeticOperation(that);
    shared default void visitIfClause(IfClause that) => visitNode(that);
    shared default void visitIfComprehensionClause(IfComprehensionClause that) => visitInitialComprehensionClause(that);
    shared default void visitIfElse(IfElse that) => visitControlStructure(that);
    shared default void visitIfElseExpression(IfElseExpression that) => visitConditionalExpression(that);
    shared default void visitImport(Import that) => visitNode(that);
    shared default void visitImportAlias(ImportAlias that) => visitNode(that);
    shared default void visitImportElement(ImportElement that) => visitNode(that);
    shared default void visitImportElements(ImportElements that) => visitNode(that);
    shared default void visitImportFunctionValueAlias(ImportFunctionValueAlias that) => visitImportAlias(that);
    shared default void visitImportFunctionValueElement(ImportFunctionValueElement that) => visitImportElement(that);
    shared default void visitImportTypeAlias(ImportTypeAlias that) => visitImportAlias(that);
    shared default void visitImportTypeElement(ImportTypeElement that) => visitImportElement(that);
    shared default void visitImportWildcard(ImportWildcard that) => visitNode(that);
    shared default void visitInModifier(InModifier that) => visitVariance(that);
    shared default void visitInOperation(InOperation that) => visitBinaryOperation(that);
    shared default void visitInitialComprehensionClause(InitialComprehensionClause that) => visitComprehensionClause(that);
    shared default void visitInlineDefinitionArgument(InlineDefinitionArgument that) => visitNamedArgument(that);
    shared default void visitIntegerLiteral(IntegerLiteral that) => visitLiteral(that);
    shared default void visitInterfaceAliasDefinition(InterfaceAliasDefinition that) => visitAnyInterface(that);
    shared default void visitInterfaceBody(InterfaceBody that) => visitBody(that);
    shared default void visitInterfaceDec(InterfaceDec that) => visitTypeDec(that);
    shared default void visitInterfaceDefinition(InterfaceDefinition that) => visitAnyInterfaceDefinition(that);
    shared default void visitIntersectAssignmentOperation(IntersectAssignmentOperation that) => visitSetAssignmentOperation(that);
    shared default void visitIntersectionOperation(IntersectionOperation that) => visitSetOperation(that);
    shared default void visitIntersectionType(IntersectionType that) => visitUnionableType(that);
    shared default void visitInvocation(Invocation that) => visitPrimary(that);
    shared default void visitInvocationStatement(InvocationStatement that) => visitExpressionStatement(that);
    shared default void visitIsCase(IsCase that) => visitCaseItem(that);
    shared default void visitIsCondition(IsCondition that) => visitCondition(that);
    shared default void visitIsOperation(IsOperation that) => visitUnaryTypeOperation(that);
    shared default void visitIterable(Iterable that) => visitAtom(that);
    shared default void visitIterableType(IterableType that) => visitPrimaryType(that);
    shared default void visitKeySubscript(KeySubscript that) => visitSubscript(that);
    shared default void visitLIdentifier(LIdentifier that) => visitIdentifier(that);
    shared default void visitLargeAsOperation(LargeAsOperation that) => visitComparisonOperation(that);
    shared default void visitLargerOperation(LargerOperation that) => visitComparisonOperation(that);
    shared default void visitLazySpecification(LazySpecification that) => visitSpecification(that);
    shared default void visitLazySpecifier(LazySpecifier that) => visitAnySpecifier(that);
    shared default void visitLetExpression(LetExpression that) => visitExpression(that);
    shared default void visitLiteral(Literal that) => visitAtom(that);
    shared default void visitLocalModifier(LocalModifier that) => visitTypeModifier(that);
    shared default void visitLogicalAssignmentOperation(LogicalAssignmentOperation that) => visitAssignmentOperation(that);
    shared default void visitLogicalOperation(LogicalOperation that) => visitBinaryOperation(that);
    shared default void visitMainType(MainType that) => visitType(that);
    shared default void visitMatchCase(MatchCase that) => visitCaseItem(that);
    shared default void visitMeasureOperation(MeasureOperation that) => visitBinaryOperation(that);
    shared default void visitMeasureSubscript(MeasureSubscript that) => visitRangeSubscript(that);
    shared default void visitMemberDec(MemberDec that) => visitDec(that);
    shared default void visitMemberMeta(MemberMeta that) => visitMeta(that);
    shared default void visitMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => visitNameWithTypeArguments(that);
    shared default void visitMemberOperator(MemberOperator that) => visitAnyMemberOperator(that);
    shared default void visitMeta(Meta that) => visitPrimary(that);
    shared default void visitModifier(Modifier that) => visitNode(that);
    shared default void visitModuleBody(ModuleBody that) => visitNode(that);
    shared default void visitModuleCompilationUnit(ModuleCompilationUnit that) => visitAnyCompilationUnit(that);
    shared default void visitModuleDec(ModuleDec that) => visitDec(that);
    shared default void visitModuleDescriptor(ModuleDescriptor that) => visitNode(that);
    shared default void visitModuleImport(ModuleImport that) => visitNode(that);
    shared default void visitMultiplyAssignmentOperation(MultiplyAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    shared default void visitNameWithTypeArguments(NameWithTypeArguments that) => visitTypeIsh(that);
    shared default void visitNamedArgument(NamedArgument that) => visitNode(that);
    shared default void visitNamedArguments(NamedArguments that) => visitArguments(that);
    shared default void visitNegationOperation(NegationOperation that) => visitUnaryArithmeticOperation(that);
    shared default void visitNode(Node that) => that.visitChildren(this);
    shared default void visitNonemptyCondition(NonemptyCondition that) => visitExistsOrNonemptyCondition(that);
    shared default void visitNonemptyOperation(NonemptyOperation that) => visitUnaryOperation(that);
    shared default void visitNotEqualOperation(NotEqualOperation that) => visitEqualityOperation(that);
    shared default void visitNotOperation(NotOperation that) => visitUnaryOperation(that);
    shared default void visitObjectArgument(ObjectArgument that) => visitInlineDefinitionArgument(that);
    shared default void visitObjectDefinition(ObjectDefinition that) => visitDeclaration(that);
    shared default void visitObjectExpression(ObjectExpression that) => visitAtom(that);
    shared default void visitOfOperation(OfOperation that) => visitUnaryTypeOperation(that);
    shared default void visitOpenBound(OpenBound that) => visitBound(that);
    shared default void visitOperation(Operation that) => visitValueExpression(that);
    shared default void visitOptionalType(OptionalType that) => visitPrimaryType(that);
    shared default void visitOrAssignmentOperation(OrAssignmentOperation that) => visitLogicalAssignmentOperation(that);
    shared default void visitOrOperation(OrOperation that) => visitLogicalOperation(that);
    shared default void visitOutModifier(OutModifier that) => visitVariance(that);
    shared default void visitOuter(Outer that) => visitSelfReference(that);
    shared default void visitPackage(Package that) => visitSelfReference(that);
    shared default void visitPackageCompilationUnit(PackageCompilationUnit that) => visitAnyCompilationUnit(that);
    shared default void visitPackageDec(PackageDec that) => visitDec(that);
    shared default void visitPackageDescriptor(PackageDescriptor that) => visitNode(that);
    shared default void visitPackageQualifier(PackageQualifier that) => visitTypeIsh(that);
    shared default void visitParameter(Parameter that) => visitNode(that);
    shared default void visitParameterReference(ParameterReference that) => visitRequiredParameter(that);
    shared default void visitParameters(Parameters that) => visitNode(that);
    shared default void visitPattern(Pattern that) => visitNode(that);
    shared default void visitPatternList(PatternList that) => visitNode(that);
    shared default void visitPositionalArguments(PositionalArguments that) => visitArguments(that);
    shared default void visitPostfixDecrementOperation(PostfixDecrementOperation that) => visitPostfixOperation(that);
    shared default void visitPostfixIncrementOperation(PostfixIncrementOperation that) => visitPostfixOperation(that);
    shared default void visitPostfixOperation(PostfixOperation that) => visitUnaryOperation(that);
    shared default void visitPrefixDecrementOperation(PrefixDecrementOperation that) => visitPrefixOperation(that);
    shared default void visitPrefixIncrementOperation(PrefixIncrementOperation that) => visitPrefixOperation(that);
    shared default void visitPrefixOperation(PrefixOperation that) => visitUnaryOperation(that);
    shared default void visitPrefixPostfixStatement(PrefixPostfixStatement that) => visitExpressionStatement(that);
    shared default void visitPrimary(Primary that) => visitValueExpression(that);
    shared default void visitPrimaryType(PrimaryType that) => visitUnionableType(that);
    shared default void visitProductOperation(ProductOperation that) => visitArithmeticOperation(that);
    shared default void visitQualifiedExpression(QualifiedExpression that) => visitPrimary(that);
    shared default void visitQualifiedType(QualifiedType that) => visitSimpleType(that);
    shared default void visitQuotientOperation(QuotientOperation that) => visitArithmeticOperation(that);
    shared default void visitRangeSubscript(RangeSubscript that) => visitSubscript(that);
    shared default void visitRemainderAssignmentOperation(RemainderAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    shared default void visitRemainderOperation(RemainderOperation that) => visitArithmeticOperation(that);
    shared default void visitRequiredParameter(RequiredParameter that) => visitParameter(that);
    shared default void visitResource(Resource that) => visitNode(that);
    shared default void visitResources(Resources that) => visitNode(that);
    shared default void visitReturn(Return that) => visitDirective(that);
    shared default void visitSafeMemberOperator(SafeMemberOperator that) => visitAnyMemberOperator(that);
    shared default void visitSatisfiedTypes(SatisfiedTypes that) => visitNode(that);
    shared default void visitScaleOperation(ScaleOperation that) => visitBinaryOperation(that);
    shared default void visitSelfReference(SelfReference that) => visitExpression(that);
    shared default void visitSequentialType(SequentialType that) => visitPrimaryType(that);
    shared default void visitSetAssignmentOperation(SetAssignmentOperation that) => visitAssignmentOperation(that);
    shared default void visitSetOperation(SetOperation that) => visitBinaryOperation(that);
    shared default void visitSimpleType(SimpleType that) => visitPrimaryType(that);
    shared default void visitSmallAsOperation(SmallAsOperation that) => visitComparisonOperation(that);
    shared default void visitSmallerOperation(SmallerOperation that) => visitComparisonOperation(that);
    shared default void visitSpanFromSubscript(SpanFromSubscript that) => visitRangeSubscript(that);
    shared default void visitSpanOperation(SpanOperation that) => visitBinaryOperation(that);
    shared default void visitSpanSubscript(SpanSubscript that) => visitRangeSubscript(that);
    shared default void visitSpanToSubscript(SpanToSubscript that) => visitRangeSubscript(that);
    shared default void visitSpecification(Specification that) => visitStatement(that);
    shared default void visitSpecifiedArgument(SpecifiedArgument that) => visitNamedArgument(that);
    shared default void visitSpecifiedPattern(SpecifiedPattern that) => visitNode(that);
    shared default void visitSpecifiedVariable(SpecifiedVariable that) => visitVariable(that);
    shared default void visitSpecifier(Specifier that) => visitNode(that);
    shared default void visitSpreadArgument(SpreadArgument that) => visitNode(that);
    shared default void visitSpreadMemberOperator(SpreadMemberOperator that) => visitAnyMemberOperator(that);
    shared default void visitSpreadType(SpreadType that) => visitTypeIsh(that);
    shared default void visitStatement(Statement that) => visitNode(that);
    shared default void visitStringLiteral(StringLiteral that) => visitLiteral(that);
    shared default void visitStringTemplate(StringTemplate that) => visitAtom(that);
    shared default void visitSubscript(Subscript that) => visitNode(that);
    shared default void visitSubtractAssignmentOperation(SubtractAssignmentOperation that) => visitArithmeticAssignmentOperation(that);
    shared default void visitSumOperation(SumOperation that) => visitArithmeticOperation(that);
    shared default void visitSuper(Super that) => visitSelfReference(that);
    shared default void visitSwitchCaseElse(SwitchCaseElse that) => visitControlStructure(that);
    shared default void visitSwitchCaseElseExpression(SwitchCaseElseExpression that) => visitConditionalExpression(that);
    shared default void visitSwitchCases(SwitchCases that) => visitNode(that);
    shared default void visitSwitchClause(SwitchClause that) => visitNode(that);
    shared default void visitThenOperation(ThenOperation that) => visitBinaryOperation(that);
    shared default void visitThis(This that) => visitSelfReference(that);
    shared default void visitThrow(Throw that) => visitDirective(that);
    shared default void visitTryCatchFinally(TryCatchFinally that) => visitControlStructure(that);
    shared default void visitTryClause(TryClause that) => visitNode(that);
    shared default void visitTuple(Tuple that) => visitAtom(that);
    shared default void visitTuplePattern(TuplePattern that) => visitPattern(that);
    shared default void visitTupleType(TupleType that) => visitPrimaryType(that);
    shared default void visitType(Type that) => visitTypeIsh(that);
    shared default void visitTypeAliasDefinition(TypeAliasDefinition that) => visitTypeDeclaration(that);
    shared default void visitTypeArgument(TypeArgument that) => visitTypeIsh(that);
    shared default void visitTypeArguments(TypeArguments that) => visitTypeIsh(that);
    shared default void visitTypeConstraint(TypeConstraint that) => visitNode(that);
    shared default void visitTypeDec(TypeDec that) => visitDec(that);
    shared default void visitTypeDeclaration(TypeDeclaration that) => visitDeclaration(that);
    shared default void visitTypeIsh(TypeIsh that) => visitNode(that);
    shared default void visitTypeList(TypeList that) => visitTypeIsh(that);
    shared default void visitTypeMeta(TypeMeta that) => visitMeta(that);
    shared default void visitTypeModifier(TypeModifier that) => visitModifier(that);
    shared default void visitTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => visitNameWithTypeArguments(that);
    shared default void visitTypeParameter(TypeParameter that) => visitNode(that);
    shared default void visitTypeParameters(TypeParameters that) => visitNode(that);
    shared default void visitTypeSpecifier(TypeSpecifier that) => visitNode(that);
    shared default void visitTypedDeclaration(TypedDeclaration that) => visitDeclaration(that);
    shared default void visitTypedVariable(TypedVariable that) => visitVariable(that);
    shared default void visitUIdentifier(UIdentifier that) => visitIdentifier(that);
    shared default void visitUnaryArithmeticOperation(UnaryArithmeticOperation that) => visitUnaryOperation(that);
    shared default void visitUnaryIshOperation(UnaryIshOperation that) => visitOperation(that);
    shared default void visitUnaryOperation(UnaryOperation that) => visitUnaryIshOperation(that);
    shared default void visitUnaryTypeOperation(UnaryTypeOperation that) => visitUnaryIshOperation(that);
    shared default void visitUnionAssignmentOperation(UnionAssignmentOperation that) => visitSetAssignmentOperation(that);
    shared default void visitUnionOperation(UnionOperation that) => visitSetOperation(that);
    shared default void visitUnionType(UnionType that) => visitMainType(that);
    shared default void visitUnionableType(UnionableType that) => visitMainType(that);
    shared default void visitUnspecifiedVariable(UnspecifiedVariable that) => visitVariable(that);
    shared default void visitValueArgument(ValueArgument that) => visitInlineDefinitionArgument(that);
    shared default void visitValueConstructorDefinition(ValueConstructorDefinition that) => visitConstructorDefinition(that);
    shared default void visitValueDec(ValueDec that) => visitMemberDec(that);
    shared default void visitValueDeclaration(ValueDeclaration that) => visitAnyValue(that);
    shared default void visitValueDefinition(ValueDefinition that) => visitAnyValue(that);
    shared default void visitValueExpression(ValueExpression that) => visitExpression(that);
    shared default void visitValueGetterDefinition(ValueGetterDefinition that) => visitAnyValue(that);
    shared default void visitValueModifier(ValueModifier that) => visitLocalModifier(that);
    shared default void visitValueParameter(ValueParameter that) => visitRequiredParameter(that);
    shared default void visitValueSetterDefinition(ValueSetterDefinition that) => visitDeclaration(that);
    shared default void visitValueSpecification(ValueSpecification that) => visitSpecification(that);
    shared default void visitVariable(Variable that) => visitNode(that);
    shared default void visitVariablePattern(VariablePattern that) => visitPattern(that);
    shared default void visitVariadicParameter(VariadicParameter that) => visitParameter(that);
    shared default void visitVariadicType(VariadicType that) => visitTypeIsh(that);
    shared default void visitVariadicVariable(VariadicVariable that) => visitVariable(that);
    shared default void visitVariance(Variance that) => visitModifier(that);
    shared default void visitVoidModifier(VoidModifier that) => visitTypeModifier(that);
    shared default void visitWhile(While that) => visitControlStructure(that);
    shared default void visitWithinOperation(WithinOperation that) => visitOperation(that);
}
