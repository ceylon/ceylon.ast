"""An AST editor.
   There is one method per AST node; override the methods for which you need to change the AST,
   and leave the others untouched.
   
   The default operation for “bottom“ non-leaf node types’ methods is to check [[editNode]] for that node;
   if it returns `true`, the node is copied, editing the children,
   and if it returns `false`, the same node is returned without changes (shortcut).
   The default operation for leaf node types’ methods (nodes with no children) is to return the same node.
   (The default operation for non-“bottom” node types’ methods is inherited from [[ImmediateNarrowingTransformer]],
   see there.)
   By itself, an [[Editor]] will not actually edit the AST –
   it’s only scaffolding that allows you to easily edit parts of the AST without having to bother with
   the deep nesting of the nodes.
   
   For example:
   ~~~
   class TraceFunctionEditor() satisfies Editor {
       shared actual FunctionDefinition transformFunctionDefinition(FunctionDefinition that) {
           value print = BaseExpression(MemberNameWithTypeArguments(LIdentifier("print")));
           value enterArgs = PositionalArguments(ArgumentList([StringLiteral("enter ``that.name.name``")]));
           value leaveArgs = PositionalArguments(ArgumentList([StringLiteral("leave ``that.name.name``")]));
           value enter = InvocationStatement(Invocation(print.copy(), enterArgs));
           value leave = InvocationStatement(Invocation(print.copy(), leaveArgs));
           return that.copy {
               definition = Block(concatenate([enter], that.definition.content, [leave]));
           };
       }
   }
   ~~~
   will insert a print statement at the beginning and end of every function block in the AST."""
shared interface Editor satisfies ImmediateNarrowingTransformer<Node> {
    
    "Heuristic to predict if this node may be edited ([[true]])
     or if it will definitely not be edited ([[false]]).
     
     Every non-loaf node type edit method by default edits the node
     if and only if this method returns `true`.
     By default, it unconditionally returns `true`,
     so that an unmodified `Editor` performs a deep copy of the tree.
     However, you can override this method to decide that some nodes will definitely not be edited,
     and then (that is, if this method returns `false`)
     the default implementations of the edit methods will just return the same node."
    shared default Boolean editNode(Node node) => true;
    
    shared actual Artifact transformArtifact(Artifact that) {
        assert (is Artifact ret = super.transformArtifact(that));
        return ret;
    }
    shared actual Classifier transformClassifier(Classifier that) {
        assert (is Classifier ret = super.transformClassifier(that));
        return ret;
    }
    shared actual Repository transformRepository(Repository that) {
        assert (is Repository ret = super.transformRepository(that));
        return ret;
    }
    shared actual default AddAssignmentOperation transformAddAssignmentOperation(AddAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default AliasDec transformAliasDec(AliasDec that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformDecQualifier(that.qualifier)) else that;
    shared actual default AndAssignmentOperation transformAndAssignmentOperation(AndAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default AndOperation transformAndOperation(AndOperation that)
            => editNode(that) then that.copy(transformConjoiningExpression(that.leftOperand), transformNegatingExpression(that.rightOperand)) else that;
    shared actual default Annotation transformAnnotation(Annotation that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.arguments, transformArguments)) else that;
    shared actual default Annotations transformAnnotations(Annotations that)
            => editNode(that) then that.copy(nullsafeInvoke(that.anonymousAnnotation, transformStringLiteral), that.annotations.collect(transformAnnotation)) else that;
    shared actual default AnonymousArgument transformAnonymousArgument(AnonymousArgument that)
            => editNode(that) then that.copy(transformExpression(that.expression)) else that;
    shared actual AnyClass transformAnyClass(AnyClass that) {
        assert (is AnyClass ret = super.transformAnyClass(that));
        return ret;
    }
    shared actual AnyCompilationUnit transformAnyCompilationUnit(AnyCompilationUnit that) {
        assert (is AnyCompilationUnit ret = super.transformAnyCompilationUnit(that));
        return ret;
    }
    shared actual AnyFunction transformAnyFunction(AnyFunction that) {
        assert (is AnyFunction ret = super.transformAnyFunction(that));
        return ret;
    }
    shared actual AnyInterface transformAnyInterface(AnyInterface that) {
        assert (is AnyInterface ret = super.transformAnyInterface(that));
        return ret;
    }
    shared actual AnyInterfaceDefinition transformAnyInterfaceDefinition(AnyInterfaceDefinition that) {
        assert (is AnyInterfaceDefinition ret = super.transformAnyInterfaceDefinition(that));
        return ret;
    }
    shared actual AnyMemberOperator transformAnyMemberOperator(AnyMemberOperator that) {
        assert (is AnyMemberOperator ret = super.transformAnyMemberOperator(that));
        return ret;
    }
    shared actual AnyValue transformAnyValue(AnyValue that) {
        assert (is AnyValue ret = super.transformAnyValue(that));
        return ret;
    }
    shared actual AnySpecifier transformAnySpecifier(AnySpecifier that) {
        assert (is AnySpecifier ret = super.transformAnySpecifier(that));
        return ret;
    }
    shared actual default ArgumentList transformArgumentList(ArgumentList that)
            => editNode(that) then that.copy(that.listedArguments.collect(transformExpression), nullsafeInvoke(that.sequenceArgument, transformSpreadArgumentOrComprehension)) else that;
    shared actual Arguments transformArguments(Arguments that) {
        assert (is Arguments ret = super.transformArguments(that));
        return ret;
    }
    shared actual ArithmeticAssignmentOperation transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) {
        assert (is ArithmeticAssignmentOperation ret = super.transformArithmeticAssignmentOperation(that));
        return ret;
    }
    shared actual ArithmeticOperation transformArithmeticOperation(ArithmeticOperation that) {
        assert (is ArithmeticOperation ret = super.transformArithmeticOperation(that));
        return ret;
    }
    shared actual default Assertion transformAssertion(Assertion that)
            => editNode(that) then that.copy(transformConditions(that.conditions), nullsafeInvoke(that.message, transformAssertionMessage)) else that;
    shared actual AssertionMessage transformAssertionMessage(AssertionMessage that) {
        assert (is AssertionMessage ret = super.transformAssertionMessage(that));
        return ret;
    }
    shared actual default AssignOperation transformAssignOperation(AssignOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual AssignmentOperation transformAssignmentOperation(AssignmentOperation that) {
        assert (is AssignmentOperation ret = super.transformAssignmentOperation(that));
        return ret;
    }
    shared actual default AssignmentStatement transformAssignmentStatement(AssignmentStatement that)
            => editNode(that) then that.copy(transformAssignmentOperation(that.expression)) else that;
    shared actual Atom transformAtom(Atom that) {
        assert (is Atom ret = super.transformAtom(that));
        return ret;
    }
    shared actual default BaseExpression transformBaseExpression(BaseExpression that)
            => editNode(that) then that.copy(transformNameWithTypeArguments(that.nameAndArgs)) else that;
    shared actual default BaseMeta transformBaseMeta(BaseMeta that)
            => editNode(that) then that.copy(transformMemberNameWithTypeArguments(that.nameAndArgs), nullsafeInvoke(that.packageQualifier, transformPackageQualifier)) else that;
    shared actual default BaseType transformBaseType(BaseType that)
            => editNode(that) then that.copy(transformTypeNameWithTypeArguments(that.nameAndArgs), nullsafeInvoke(that.qualifier, transformPackageQualifier)) else that;
    shared actual BinaryOperation transformBinaryOperation(BinaryOperation that) {
        assert (is BinaryOperation ret = super.transformBinaryOperation(that));
        return ret;
    }
    shared actual default Block transformBlock(Block that)
            => editNode(that) then that.copy(that.content.collect(transformStatementOrDeclaration), that.imports.collect(transformImport)) else that;
    shared actual Body transformBody(Body that) {
        assert (is Body ret = super.transformBody(that));
        return ret;
    }
    shared actual default BooleanCondition transformBooleanCondition(BooleanCondition that)
            => editNode(that) then that.copy(transformExpression(that.condition)) else that;
    shared actual Bound transformBound(Bound that) {
        assert (is Bound ret = super.transformBound(that));
        return ret;
    }
    shared actual default Break transformBreak(Break that)
            => that;
    shared actual default CallableConstructorDefinition transformCallableConstructorDefinition(CallableConstructorDefinition that)
            => editNode(that) then that.copy(nullsafeInvoke(that.name, transformLIdentifier), transformParameters(that.parameters), transformBlock(that.block), nullsafeInvoke(that.extendedType, transformExtendedType), transformAnnotations(that.annotations)) else that;
    shared actual default CallableParameter transformCallableParameter(CallableParameter that)
            => editNode(that) then that.copy(transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), transformLIdentifier(that.name), that.parameterLists.collect(transformParameters), transformAnnotations(that.annotations)) else that;
    shared actual default CallableType transformCallableType(CallableType that)
            => editNode(that) then that.copy(transformPrimaryType(that.returnType), transformTypeListOrSpreadType(that.argumentTypes)) else that;
    shared actual default CaseClause transformCaseClause(CaseClause that)
            => editNode(that) then that.copy(transformCaseItem(that.caseItem), transformBlock(that.block), that.elseCase) else that;
    shared actual default CaseExpression transformCaseExpression(CaseExpression that)
            => editNode(that) then that.copy(transformCaseItem(that.caseItem), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.expression), that.elseCase) else that;
    shared actual CaseItem transformCaseItem(CaseItem that) {
        assert (is CaseItem ret = super.transformCaseItem(that));
        return ret;
    }
    shared actual default CaseTypes transformCaseTypes(CaseTypes that)
            => editNode(that) then that.copy(that.caseTypes.collect(transformPrimaryTypeOrLIdentifier)) else that;
    shared actual default CatchClause transformCatchClause(CatchClause that)
            => editNode(that) then that.copy(transformUnspecifiedVariable(that.variable), transformBlock(that.block)) else that;
    shared actual default CharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => that;
    shared actual default ClassAliasDefinition transformClassAliasDefinition(ClassAliasDefinition that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformParameters(that.parameters), transformClassSpecifier(that.specifier), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default ClassBody transformClassBody(ClassBody that)
            => editNode(that) then that.copy(that.content.collect(transformStatementOrDeclaration), that.imports.collect(transformImport)) else that;
    shared actual default ClassDec transformClassDec(ClassDec that)
            => editNode(that) then that.copy(nullsafeInvoke(that.name, transformIdentifier), nullsafeInvoke(that.qualifier, transformDecQualifier)) else that;
    shared actual default ClassDefinition transformClassDefinition(ClassDefinition that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), nullsafeInvoke(that.parameters, transformParameters), transformClassBody(that.body), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual ClassOrInterface transformClassOrInterface(ClassOrInterface that) {
        assert (is ClassOrInterface ret = super.transformClassOrInterface(that));
        return ret;
    }
    shared actual default ClassSpecifier transformClassSpecifier(ClassSpecifier that)
            => editNode(that) then that.copy(transformExtensionOrConstruction(that.target)) else that;
    shared actual default ClosedBound transformClosedBound(ClosedBound that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.endpoint)) else that;
    shared actual default CompareOperation transformCompareOperation(CompareOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand)) else that;
    shared actual ComparisonOperation transformComparisonOperation(ComparisonOperation that) {
        assert (is ComparisonOperation ret = super.transformComparisonOperation(that));
        return ret;
    }
    shared actual default CompilationUnit transformCompilationUnit(CompilationUnit that)
            => editNode(that) then that.copy(that.declarations.collect(transformDeclaration), that.imports.collect(transformImport)) else that;
    shared actual default ComplementAssignmentOperation transformComplementAssignmentOperation(ComplementAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default ComplementOperation transformComplementOperation(ComplementOperation that)
            => editNode(that) then that.copy(transformUnioningExpression(that.leftOperand), transformIntersectingExpression(that.rightOperand)) else that;
    shared actual default Comprehension transformComprehension(Comprehension that)
            => editNode(that) then that.copy(transformInitialComprehensionClause(that.clause)) else that;
    shared actual ComprehensionClause transformComprehensionClause(ComprehensionClause that) {
        assert (is ComprehensionClause ret = super.transformComprehensionClause(that));
        return ret;
    }
    shared actual Condition transformCondition(Condition that) {
        assert (is Condition ret = super.transformCondition(that));
        return ret;
    }
    shared actual ConditionalExpression transformConditionalExpression(ConditionalExpression that) {
        assert (is ConditionalExpression ret = super.transformConditionalExpression(that));
        return ret;
    }
    shared actual default Conditions transformConditions(Conditions that)
            => editNode(that) then that.copy(that.conditions.collect(transformCondition)) else that;
    shared actual default Construction transformConstruction(Construction that)
            => editNode(that) then that.copy(transformMemberNameWithTypeArguments(that.nameAndArgs), transformPositionalArguments(that.arguments), nullsafeInvoke(that.qualifier, transformBaseTypeOrSuper)) else that;
    shared actual default ConstructorDec transformConstructorDec(ConstructorDec that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformDecQualifier(that.qualifier)) else that;
    shared actual ConstructorDefinition transformConstructorDefinition(ConstructorDefinition that) {
        assert (is ConstructorDefinition ret = super.transformConstructorDefinition(that));
        return ret;
    }
    shared actual default Continue transformContinue(Continue that)
            => that;
    shared actual ControlStructure transformControlStructure(ControlStructure that) {
        assert (is ControlStructure ret = super.transformControlStructure(that));
        return ret;
    }
    shared actual Dec transformDec(Dec that) {
        assert (is Dec ret = super.transformDec(that));
        return ret;
    }
    shared actual default DecQualifier transformDecQualifier(DecQualifier that)
            => editNode(that) then that.copy(that.components.collect(transformIdentifier), nullsafeInvoke(that.packageQualifier, transformPackageQualifier)) else that;
    shared actual Declaration transformDeclaration(Declaration that) {
        assert (is Declaration ret = super.transformDeclaration(that));
        return ret;
    }
    shared actual default DefaultedCallableParameter transformDefaultedCallableParameter(DefaultedCallableParameter that)
            => editNode(that) then that.copy(transformCallableParameter(that.parameter), transformLazySpecifier(that.specifier)) else that;
    shared actual DefaultedParameter transformDefaultedParameter(DefaultedParameter that) {
        assert (is DefaultedParameter ret = super.transformDefaultedParameter(that));
        return ret;
    }
    shared actual default DefaultedParameterReference transformDefaultedParameterReference(DefaultedParameterReference that)
            => editNode(that) then that.copy(transformParameterReference(that.parameter), transformSpecifier(that.specifier)) else that;
    shared actual default DefaultedType transformDefaultedType(DefaultedType that)
            => editNode(that) then that.copy(transformType(that.type)) else that;
    shared actual default DefaultedValueParameter transformDefaultedValueParameter(DefaultedValueParameter that)
            => editNode(that) then that.copy(transformValueParameter(that.parameter), transformSpecifier(that.specifier)) else that;
    shared actual default Destructure transformDestructure(Destructure that)
            => editNode(that) then that.copy(transformTuplePatternOrEntryPattern(that.pattern), transformSpecifier(that.specifier), transformValueModifier(that.valueModifier)) else that;
    shared actual default DifferenceOperation transformDifferenceOperation(DifferenceOperation that)
            => editNode(that) then that.copy(transformAddingExpression(that.leftOperand), transformScalingExpression(that.rightOperand)) else that;
    shared actual Directive transformDirective(Directive that) {
        assert (is Directive ret = super.transformDirective(that));
        return ret;
    }
    shared actual default DivideAssignmentOperation transformDivideAssignmentOperation(DivideAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default DynamicBlock transformDynamicBlock(DynamicBlock that)
            => editNode(that) then that.copy(transformBlock(that.block)) else that;
    shared actual default DynamicInterfaceDefinition transformDynamicInterfaceDefinition(DynamicInterfaceDefinition that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformInterfaceBody(that.body), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default DynamicModifier transformDynamicModifier(DynamicModifier that)
            => that;
    shared actual default DynamicValue transformDynamicValue(DynamicValue that)
            => editNode(that) then that.copy(that.namedArguments.collect(transformNamedArgument), transformArgumentList(that.iterableArgument), transformDynamicModifier(that.modifier)) else that;
    shared actual default ElementOrSubrangeExpression transformElementOrSubrangeExpression(ElementOrSubrangeExpression that)
            => editNode(that) then that.copy(transformPrimary(that.primary), transformSubscript(that.subscript)) else that;
    shared actual default ElseClause transformElseClause(ElseClause that)
            => editNode(that) then that.copy(transformBlockOrIfElse(that.child)) else that;
    shared actual default ElseOperation transformElseOperation(ElseOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformDisjoiningExpression(that.rightOperand)) else that;
    shared actual default EntryOperation transformEntryOperation(EntryOperation that)
            => editNode(that) then that.copy(transformAddingExpression(that.leftOperand), transformAddingExpression(that.rightOperand)) else that;
    shared actual default EntryPattern transformEntryPattern(EntryPattern that)
            => editNode(that) then that.copy(transformVariablePatternOrTuplePattern(that.key), transformVariablePatternOrTuplePattern(that.item)) else that;
    shared actual default EntryType transformEntryType(EntryType that)
            => editNode(that) then that.copy(transformMainType(that.key), transformMainType(that.item)) else that;
    shared actual default EqualOperation transformEqualOperation(EqualOperation that)
            => editNode(that) then that.copy(transformComparingExpression(that.leftOperand), transformComparingExpression(that.rightOperand)) else that;
    shared actual EqualityOperation transformEqualityOperation(EqualityOperation that) {
        assert (is EqualityOperation ret = super.transformEqualityOperation(that));
        return ret;
    }
    shared actual default ExistsCondition transformExistsCondition(ExistsCondition that)
            => editNode(that) then that.copy(transformSpecifiedPatternOrLIdentifier(that.tested), that.negated) else that;
    shared actual default ExistsOperation transformExistsOperation(ExistsOperation that)
            => editNode(that) then that.copy(transformSpanningExpression(that.operand)) else that;
    shared actual ExistsOrNonemptyCondition transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) {
        assert (is ExistsOrNonemptyCondition ret = super.transformExistsOrNonemptyCondition(that));
        return ret;
    }
    shared actual default ExponentiationOperation transformExponentiationOperation(ExponentiationOperation that)
            => editNode(that) then that.copy(transformPrePostfixingExpression(that.leftOperand), transformExponentiatingExpression(that.rightOperand)) else that;
    shared actual Expression transformExpression(Expression that) {
        assert (is Expression ret = super.transformExpression(that));
        return ret;
    }
    shared actual default ExpressionComprehensionClause transformExpressionComprehensionClause(ExpressionComprehensionClause that)
            => editNode(that) then that.copy(transformExpression(that.expression)) else that;
    shared actual ExpressionStatement transformExpressionStatement(ExpressionStatement that) {
        assert (is ExpressionStatement ret = super.transformExpressionStatement(that));
        return ret;
    }
    shared actual default ExtendedType transformExtendedType(ExtendedType that)
            => editNode(that) then that.copy(transformExtensionOrConstruction(that.target)) else that;
    shared actual default Extension transformExtension(Extension that)
            => editNode(that) then that.copy(transformTypeNameWithTypeArguments(that.nameAndArgs), nullsafeInvoke(that.arguments, transformPositionalArguments), nullsafeInvoke(that.qualifier, transformPackageQualifierOrSuperOrSimpleType)) else that;
    shared actual ExtensionOrConstruction transformExtensionOrConstruction(ExtensionOrConstruction that) {
        assert (is ExtensionOrConstruction ret = super.transformExtensionOrConstruction(that));
        return ret;
    }
    shared actual default FailClause transformFailClause(FailClause that)
            => editNode(that) then that.copy(transformBlock(that.block)) else that;
    shared actual default FinallyClause transformFinallyClause(FinallyClause that)
            => editNode(that) then that.copy(transformBlock(that.block)) else that;
    shared actual default FloatLiteral transformFloatLiteral(FloatLiteral that)
            => that;
    shared actual default ForClause transformForClause(ForClause that)
            => editNode(that) then that.copy(transformForIterator(that.iterator), transformBlock(that.block)) else that;
    shared actual default ForComprehensionClause transformForComprehensionClause(ForComprehensionClause that)
            => editNode(that) then that.copy(transformForIterator(that.iterator), transformComprehensionClause(that.clause)) else that;
    shared actual default ForFail transformForFail(ForFail that)
            => editNode(that) then that.copy(transformForClause(that.forClause), nullsafeInvoke(that.failClause, transformFailClause)) else that;
    shared actual default ForIterator transformForIterator(ForIterator that)
            => editNode(that) then that.copy(transformPattern(that.pattern), transformExpression(that.iterated)) else that;
    shared actual default FullPackageName transformFullPackageName(FullPackageName that)
            => editNode(that) then that.copy([for (component in that.components) transformLIdentifier(component)]) else that;
    shared actual default FunctionArgument transformFunctionArgument(FunctionArgument that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), transformLazySpecifierOrBlock(that.definition)) else that;
    shared actual default FunctionDec transformFunctionDec(FunctionDec that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformDecQualifier(that.qualifier)) else that;
    shared actual default FunctionDeclaration transformFunctionDeclaration(FunctionDeclaration that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default FunctionDefinition transformFunctionDefinition(FunctionDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), transformBlock(that.definition), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default FunctionExpression transformFunctionExpression(FunctionExpression that)
            => editNode(that) then that.copy(that.parameterLists.collect(transformParameters), transformLazySpecifierOrBlock(that.definition), nullsafeInvoke(that.type, transformFunctionModifierOrVoidModifier)) else that;
    shared actual default FunctionModifier transformFunctionModifier(FunctionModifier that)
            => that;
    shared actual default FunctionShortcutDefinition transformFunctionShortcutDefinition(FunctionShortcutDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), transformLazySpecifier(that.definition), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default GivenDec transformGivenDec(GivenDec that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformDecQualifier(that.qualifier)) else that;
    shared actual default GroupedExpression transformGroupedExpression(GroupedExpression that)
            => editNode(that) then that.copy(transformExpression(that.innerExpression)) else that;
    shared actual default GroupedType transformGroupedType(GroupedType that)
            => editNode(that) then that.copy(transformType(that.type)) else that;
    shared actual default IdenticalOperation transformIdenticalOperation(IdenticalOperation that)
            => editNode(that) then that.copy(transformComparingExpression(that.leftOperand), transformComparingExpression(that.rightOperand)) else that;
    shared actual Identifier transformIdentifier(Identifier that) {
        assert (is Identifier ret = super.transformIdentifier(that));
        return ret;
    }
    shared actual default IdentityOperation transformIdentityOperation(IdentityOperation that)
            => editNode(that) then that.copy(transformExponentiatingExpression(that.operand)) else that;
    shared actual default IfClause transformIfClause(IfClause that)
            => editNode(that) then that.copy(transformConditions(that.conditions), transformBlock(that.block)) else that;
    shared actual default IfComprehensionClause transformIfComprehensionClause(IfComprehensionClause that)
            => editNode(that) then that.copy(transformConditions(that.conditions), transformComprehensionClause(that.clause)) else that;
    shared actual default IfElse transformIfElse(IfElse that)
            => editNode(that) then that.copy(transformIfClause(that.ifClause), nullsafeInvoke(that.elseClause, transformElseClause)) else that;
    shared actual default IfElseExpression transformIfElseExpression(IfElseExpression that)
            => editNode(that) then that.copy(transformConditions(that.conditions), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.thenExpression), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.elseExpression)) else that;
    shared actual default Import transformImport(Import that)
            => editNode(that) then that.copy(transformFullPackageName(that.packageName), transformImportElements(that.elements)) else that;
    shared actual default ImportAlias transformImportAlias(ImportAlias that)
            => editNode(that) then that.copy(transformIdentifier(that.name)) else that;
    shared actual default ImportElement transformImportElement(ImportElement that)
            => editNode(that) then that.copy(transformIdentifier(that.name), nullsafeInvoke(that.importAlias, transformImportAlias), nullsafeInvoke(that.nestedImports, transformImportElements)) else that;
    shared actual default ImportElements transformImportElements(ImportElements that)
            => editNode(that) then that.copy(that.elements.collect(transformImportElement), nullsafeInvoke(that.wildcard, transformImportWildcard)) else that;
    shared actual default ImportWildcard transformImportWildcard(ImportWildcard that)
            => that;
    shared actual default InModifier transformInModifier(InModifier that)
            => that;
    shared actual default InOperation transformInOperation(InOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand)) else that;
    shared actual InitialComprehensionClause transformInitialComprehensionClause(InitialComprehensionClause that) {
        assert (is InitialComprehensionClause ret = super.transformInitialComprehensionClause(that));
        return ret;
    }
    shared actual InlineDefinitionArgument transformInlineDefinitionArgument(InlineDefinitionArgument that) {
        assert (is InlineDefinitionArgument ret = super.transformInlineDefinitionArgument(that));
        return ret;
    }
    shared actual default IntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => that;
    shared actual default InterfaceAliasDefinition transformInterfaceAliasDefinition(InterfaceAliasDefinition that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformTypeSpecifier(that.specifier), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default InterfaceBody transformInterfaceBody(InterfaceBody that)
            => editNode(that) then that.copy(that.content.collect(transformDeclarationOrSpecification), that.imports.collect(transformImport)) else that;
    shared actual default InterfaceDec transformInterfaceDec(InterfaceDec that)
            => editNode(that) then that.copy(nullsafeInvoke(that.name, transformUIdentifier), nullsafeInvoke(that.qualifier, transformDecQualifier)) else that;
    shared actual default InterfaceDefinition transformInterfaceDefinition(InterfaceDefinition that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformInterfaceBody(that.body), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default IntersectAssignmentOperation transformIntersectAssignmentOperation(IntersectAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default IntersectionOperation transformIntersectionOperation(IntersectionOperation that)
            => editNode(that) then that.copy(transformIntersectingExpression(that.leftOperand), transformInvertingExpression(that.rightOperand)) else that;
    shared actual default IntersectionType transformIntersectionType(IntersectionType that)
            => editNode(that) then that.copy([for (child in that.children) transformPrimaryType(child)]) else that;
    shared actual default Invocation transformInvocation(Invocation that)
            => editNode(that) then that.copy(transformPrimary(that.invoked), transformArguments(that.arguments)) else that;
    shared actual default InvocationStatement transformInvocationStatement(InvocationStatement that)
            => editNode(that) then that.copy(transformInvocation(that.expression)) else that;
    shared actual default IsCase transformIsCase(IsCase that)
            => editNode(that) then that.copy(transformType(that.type)) else that;
    shared actual default IsCondition transformIsCondition(IsCondition that)
            => editNode(that) then that.copy(transformTypedVariable(that.variable), that.negated) else that;
    shared actual default IterableType transformIterableType(IterableType that)
            => editNode(that) then that.copy(transformVariadicType(that.variadicType)) else that;
    shared actual default IsOperation transformIsOperation(IsOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.operand), transformType(that.type)) else that;
    shared actual default Iterable transformIterable(Iterable that)
            => editNode(that) then that.copy(transformArgumentList(that.argumentList)) else that;
    shared actual default KeySubscript transformKeySubscript(KeySubscript that)
            => editNode(that) then that.copy(transformExpression(that.key)) else that;
    shared actual default LargeAsOperation transformLargeAsOperation(LargeAsOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand)) else that;
    shared actual default LargerOperation transformLargerOperation(LargerOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand)) else that;
    shared actual default LIdentifier transformLIdentifier(LIdentifier that)
            => that;
    shared actual default LazySpecification transformLazySpecification(LazySpecification that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformLazySpecifier(that.specifier), that.parameterLists.collect(transformParameters), nullsafeInvoke(that.qualifier, transformThis)) else that;
    shared actual default LazySpecifier transformLazySpecifier(LazySpecifier that)
            => editNode(that) then that.copy(transformExpression(that.expression)) else that;
    shared actual default LetExpression transformLetExpression(LetExpression that)
            => editNode(that) then that.copy(transformPatternList(that.patterns), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.expression)) else that;
    shared actual Literal transformLiteral(Literal that) {
        assert (is Literal ret = super.transformLiteral(that));
        return ret;
    }
    shared actual LocalModifier transformLocalModifier(LocalModifier that) {
        assert (is LocalModifier ret = super.transformLocalModifier(that));
        return ret;
    }
    shared actual LogicalAssignmentOperation transformLogicalAssignmentOperation(LogicalAssignmentOperation that) {
        assert (is LogicalAssignmentOperation ret = super.transformLogicalAssignmentOperation(that));
        return ret;
    }
    shared actual LogicalOperation transformLogicalOperation(LogicalOperation that) {
        assert (is LogicalOperation ret = super.transformLogicalOperation(that));
        return ret;
    }
    shared actual MainType transformMainType(MainType that) {
        assert (is MainType ret = super.transformMainType(that));
        return ret;
    }
    shared actual default MatchCase transformMatchCase(MatchCase that)
            => editNode(that) then that.copy(that.expressions.collect(transformIntegerLiteralOrCharacterLiteralOrStringLiteralOrNegationOperationOrBaseExpressionOrQualifiedExpressionOrTuple)) else that;
    shared actual default MeasureOperation transformMeasureOperation(MeasureOperation that)
            => editNode(that) then that.copy(transformAddingExpression(that.leftOperand), transformAddingExpression(that.rightOperand)) else that;
    shared actual default MeasureSubscript transformMeasureSubscript(MeasureSubscript that)
            => editNode(that) then that.copy(transformAddingExpression(that.from), transformAddingExpression(that.length)) else that;
    shared actual MemberDec transformMemberDec(MemberDec that) {
        assert (is MemberDec ret = super.transformMemberDec(that));
        return ret;
    }
    shared actual default MemberMeta transformMemberMeta(MemberMeta that)
            => editNode(that) then that.copy(transformPrimaryType(that.qualifier), transformMemberNameWithTypeArguments(that.nameAndArgs)) else that;
    shared actual default MemberNameWithTypeArguments transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.typeArguments, transformTypeArguments)) else that;
    shared actual default MemberOperator transformMemberOperator(MemberOperator that)
            => that;
    shared actual Meta transformMeta(Meta that) {
        assert (is Meta ret = super.transformMeta(that));
        return ret;
    }
    shared actual Modifier transformModifier(Modifier that) {
        assert (is Modifier ret = super.transformModifier(that));
        return ret;
    }
    shared actual Module transformModule(Module that) {
        assert (is Module ret = super.transformModule(that));
        return ret;
    }
    shared actual default ModuleBody transformModuleBody(ModuleBody that)
            => editNode(that) then that.copy(that.moduleImports.collect(transformModuleImport)) else that;
    shared actual default ModuleCompilationUnit transformModuleCompilationUnit(ModuleCompilationUnit that)
            => editNode(that) then that.copy(transformModuleDescriptor(that.moduleDescriptor), that.imports.collect(transformImport)) else that;
    shared actual default ModuleDec transformModuleDec(ModuleDec that)
            => editNode(that) then that.copy(nullsafeInvoke(that.moduleName, transformModuleName)) else that;
    shared actual default ModuleDescriptor transformModuleDescriptor(ModuleDescriptor that)
            => editNode(that) then that.copy(transformModuleName(that.name), transformStringLiteral(that.version), transformModuleBody(that.body), transformAnnotations(that.annotations), nullsafeInvoke(that.specifier, transformModuleSpecifier)) else that;
    shared actual default ModuleImport transformModuleImport(ModuleImport that)
            => editNode(that) then that.copy(transformModuleOrModuleSpecifier(that.name), transformStringLiteral(that.version), transformAnnotations(that.annotations)) else that;
    shared actual ModuleName transformModuleName(ModuleName that) {
        assert (is ModuleName ret = super.transformModuleName(that));
        return ret;
    }
    shared actual default ModuleSpecifier transformModuleSpecifier(ModuleSpecifier that)
            => editNode(that) then that.copy(transformRepository(that.repository), transformModule(that.moduleName), nullsafeInvoke(that.artifact, transformArtifact), nullsafeInvoke(that.classifier, transformClassifier)) else that;
    shared actual default MultiplyAssignmentOperation transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual NameWithTypeArguments transformNameWithTypeArguments(NameWithTypeArguments that) {
        assert (is NameWithTypeArguments ret = super.transformNameWithTypeArguments(that));
        return ret;
    }
    shared actual NamedArgument transformNamedArgument(NamedArgument that) {
        assert (is NamedArgument ret = super.transformNamedArgument(that));
        return ret;
    }
    shared actual default NamedArguments transformNamedArguments(NamedArguments that)
            => editNode(that) then that.copy([for (namedArgument in that.namedArguments) transformNamedArgument(namedArgument)], transformArgumentList(that.iterableArgument)) else that;
    shared actual default NegationOperation transformNegationOperation(NegationOperation that)
            => editNode(that) then that.copy(transformExponentiatingExpression(that.operand)) else that;
    shared actual default NonemptyCondition transformNonemptyCondition(NonemptyCondition that)
            => editNode(that) then that.copy(transformSpecifiedPatternOrLIdentifier(that.tested), that.negated) else that;
    shared actual default NonemptyOperation transformNonemptyOperation(NonemptyOperation that)
            => editNode(that) then that.copy(transformSpanningExpression(that.operand)) else that;
    shared actual default NotEqualOperation transformNotEqualOperation(NotEqualOperation that)
            => editNode(that) then that.copy(transformComparingExpression(that.leftOperand), transformComparingExpression(that.rightOperand)) else that;
    shared actual default NotOperation transformNotOperation(NotOperation that)
            => editNode(that) then that.copy(transformNegatingExpression(that.operand)) else that;
    shared actual default ObjectArgument transformObjectArgument(ObjectArgument that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformClassBody(that.body), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes)) else that;
    shared actual default ObjectDefinition transformObjectDefinition(ObjectDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformClassBody(that.body), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), transformAnnotations(that.annotations)) else that;
    shared actual default ObjectExpression transformObjectExpression(ObjectExpression that)
            => editNode(that) then that.copy(transformClassBody(that.body), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes)) else that;
    shared actual default OfOperation transformOfOperation(OfOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.operand), transformType(that.type)) else that;
    shared actual default OpenBound transformOpenBound(OpenBound that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.endpoint)) else that;
    shared actual Operation transformOperation(Operation that) {
        assert (is Operation ret = super.transformOperation(that));
        return ret;
    }
    shared actual default OptionalType transformOptionalType(OptionalType that)
            => editNode(that) then that.copy(transformPrimaryType(that.definiteType)) else that;
    shared actual default OrAssignmentOperation transformOrAssignmentOperation(OrAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default OrOperation transformOrOperation(OrOperation that)
            => editNode(that) then that.copy(transformDisjoiningExpression(that.leftOperand), transformConjoiningExpression(that.rightOperand)) else that;
    shared actual default OutModifier transformOutModifier(OutModifier that)
            => that;
    shared actual default Outer transformOuter(Outer that)
            => that;
    shared actual default Package transformPackage(Package that)
            => that;
    shared actual default PackageCompilationUnit transformPackageCompilationUnit(PackageCompilationUnit that)
            => editNode(that) then that.copy(transformPackageDescriptor(that.packageDescriptor), that.imports.collect(transformImport)) else that;
    shared actual default PackageDec transformPackageDec(PackageDec that)
            => editNode(that) then that.copy(nullsafeInvoke(that.packageName, transformFullPackageName)) else that;
    shared actual default PackageDescriptor transformPackageDescriptor(PackageDescriptor that)
            => editNode(that) then that.copy(transformFullPackageName(that.name), transformAnnotations(that.annotations)) else that;
    shared actual default PackageQualifier transformPackageQualifier(PackageQualifier that)
            => that;
    shared actual Parameter transformParameter(Parameter that) {
        assert (is Parameter ret = super.transformParameter(that));
        return ret;
    }
    shared actual default ParameterReference transformParameterReference(ParameterReference that)
            => editNode(that) then that.copy(transformLIdentifier(that.name)) else that;
    shared actual default Parameters transformParameters(Parameters that)
            => editNode(that) then that.copy(that.parameters.collect(transformParameter)) else that;
    shared actual Pattern transformPattern(Pattern that) {
        assert (is Pattern ret = super.transformPattern(that));
        return ret;
    }
    shared actual default PatternList transformPatternList(PatternList that)
            => editNode(that) then that.copy(that.patterns.collect(transformSpecifiedPattern)) else that;
    shared actual default PositionalArguments transformPositionalArguments(PositionalArguments that)
            => editNode(that) then that.copy(transformArgumentList(that.argumentList)) else that;
    shared actual default PostfixDecrementOperation transformPostfixDecrementOperation(PostfixDecrementOperation that)
            => editNode(that) then that.copy(transformPrimary(that.operand)) else that;
    shared actual default PostfixIncrementOperation transformPostfixIncrementOperation(PostfixIncrementOperation that)
            => editNode(that) then that.copy(transformPrimary(that.operand)) else that;
    shared actual PostfixOperation transformPostfixOperation(PostfixOperation that) {
        assert (is PostfixOperation ret = super.transformPostfixOperation(that));
        return ret;
    }
    shared actual PrePostfixingExpression transformPrePostfixingExpression(PrePostfixingExpression that) {
        assert (is PrePostfixingExpression ret = super.transformPrePostfixingExpression(that));
        return ret;
    }
    shared actual ExponentiatingExpression transformExponentiatingExpression(ExponentiatingExpression that) {
        assert (is ExponentiatingExpression ret = super.transformExponentiatingExpression(that));
        return ret;
    }
    shared actual InvertingExpression transformInvertingExpression(InvertingExpression that) {
        assert (is InvertingExpression ret = super.transformInvertingExpression(that));
        return ret;
    }
    shared actual IntersectingExpression transformIntersectingExpression(IntersectingExpression that) {
        assert (is IntersectingExpression ret = super.transformIntersectingExpression(that));
        return ret;
    }
    shared actual default SpecifiedPattern transformSpecifiedPattern(SpecifiedPattern that)
            => editNode(that) then that.copy(transformPattern(that.pattern), transformSpecifier(that.specifier)) else that;
    shared actual StructureExpression transformStructureExpression(StructureExpression that) {
        assert (is StructureExpression ret = super.transformStructureExpression(that));
        return ret;
    }
    shared actual default SwitchCaseElseExpression transformSwitchCaseElseExpression(SwitchCaseElseExpression that)
            => editNode(that) then that.copy(transformSwitchClause(that.clause), that.caseExpressions.collect(transformCaseExpression), nullsafeInvoke(that.elseExpression, transformDisjoiningExpressionOrIfElseExpressionOrLetExpression)) else that;
    shared actual default TuplePattern transformTuplePattern(TuplePattern that)
            => editNode(that) then that.copy(that.elementPatterns.collect(transformPattern), nullsafeInvoke(that.variadicElementPattern, transformVariadicVariable)) else that;
    shared actual UnioningExpression transformUnioningExpression(UnioningExpression that) {
        assert (is UnioningExpression ret = super.transformUnioningExpression(that));
        return ret;
    }
    shared actual MultiplyingExpression transformMultiplyingExpression(MultiplyingExpression that) {
        assert (is MultiplyingExpression ret = super.transformMultiplyingExpression(that));
        return ret;
    }
    shared actual ScalingExpression transformScalingExpression(ScalingExpression that) {
        assert (is ScalingExpression ret = super.transformScalingExpression(that));
        return ret;
    }
    shared actual AddingExpression transformAddingExpression(AddingExpression that) {
        assert (is AddingExpression ret = super.transformAddingExpression(that));
        return ret;
    }
    shared actual SpanningExpression transformSpanningExpression(SpanningExpression that) {
        assert (is SpanningExpression ret = super.transformSpanningExpression(that));
        return ret;
    }
    shared actual ExistsNonemptyExpression transformExistsNonemptyExpression(ExistsNonemptyExpression that) {
        assert (is ExistsNonemptyExpression ret = super.transformExistsNonemptyExpression(that));
        return ret;
    }
    shared actual ComparingExpression transformComparingExpression(ComparingExpression that) {
        assert (is ComparingExpression ret = super.transformComparingExpression(that));
        return ret;
    }
    shared actual EquatingExpression transformEquatingExpression(EquatingExpression that) {
        assert (is EquatingExpression ret = super.transformEquatingExpression(that));
        return ret;
    }
    shared actual NegatingExpression transformNegatingExpression(NegatingExpression that) {
        assert (is NegatingExpression ret = super.transformNegatingExpression(that));
        return ret;
    }
    shared actual ConjoiningExpression transformConjoiningExpression(ConjoiningExpression that) {
        assert (is ConjoiningExpression ret = super.transformConjoiningExpression(that));
        return ret;
    }
    shared actual DisjoiningExpression transformDisjoiningExpression(DisjoiningExpression that) {
        assert (is DisjoiningExpression ret = super.transformDisjoiningExpression(that));
        return ret;
    }
    shared actual ThenElseExpression transformThenElseExpression(ThenElseExpression that) {
        assert (is ThenElseExpression ret = super.transformThenElseExpression(that));
        return ret;
    }
    shared actual AssigningExpression transformAssigningExpression(AssigningExpression that) {
        assert (is AssigningExpression ret = super.transformAssigningExpression(that));
        return ret;
    }
    shared actual default PrefixDecrementOperation transformPrefixDecrementOperation(PrefixDecrementOperation that)
            => editNode(that) then that.copy(transformPrimary(that.operand)) else that;
    shared actual default PrefixIncrementOperation transformPrefixIncrementOperation(PrefixIncrementOperation that)
            => editNode(that) then that.copy(transformPrimary(that.operand)) else that;
    shared actual PrefixOperation transformPrefixOperation(PrefixOperation that) {
        assert (is PrefixOperation ret = super.transformPrefixOperation(that));
        return ret;
    }
    shared actual default PrefixPostfixStatement transformPrefixPostfixStatement(PrefixPostfixStatement that)
            => editNode(that) then that.copy(transformPrefixOperationOrPostfixOperation(that.expression)) else that;
    shared actual Primary transformPrimary(Primary that) {
        assert (is Primary ret = super.transformPrimary(that));
        return ret;
    }
    shared actual PrimaryType transformPrimaryType(PrimaryType that) {
        assert (is PrimaryType ret = super.transformPrimaryType(that));
        return ret;
    }
    shared actual default ProductOperation transformProductOperation(ProductOperation that)
            => editNode(that) then that.copy(transformMultiplyingExpression(that.leftOperand), transformUnioningExpression(that.rightOperand)) else that;
    shared actual default QualifiedExpression transformQualifiedExpression(QualifiedExpression that)
            => editNode(that) then that.copy(transformPrimary(that.receiverExpression), transformNameWithTypeArguments(that.nameAndArgs), transformAnyMemberOperator(that.memberOperator)) else that;
    shared actual default QualifiedType transformQualifiedType(QualifiedType that)
            => editNode(that) then that.copy(transformSimpleTypeOrGroupedType(that.qualifyingType), transformTypeNameWithTypeArguments(that.nameAndArgs)) else that;
    shared actual default QuotientOperation transformQuotientOperation(QuotientOperation that)
            => editNode(that) then that.copy(transformMultiplyingExpression(that.leftOperand), transformUnioningExpression(that.rightOperand)) else that;
    shared actual RangeSubscript transformRangeSubscript(RangeSubscript that) {
        assert (is RangeSubscript ret = super.transformRangeSubscript(that));
        return ret;
    }
    shared actual default RemainderAssignmentOperation transformRemainderAssignmentOperation(RemainderAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default RemainderOperation transformRemainderOperation(RemainderOperation that)
            => editNode(that) then that.copy(transformMultiplyingExpression(that.leftOperand), transformUnioningExpression(that.rightOperand)) else that;
    shared actual RequiredParameter transformRequiredParameter(RequiredParameter that) {
        assert (is RequiredParameter ret = super.transformRequiredParameter(that));
        return ret;
    }
    shared actual default Resource transformResource(Resource that)
            => editNode(that) then that.copy(transformExpressionOrSpecifiedVariable(that.resource)) else that;
    shared actual default Resources transformResources(Resources that)
            => editNode(that) then that.copy(that.resources.collect(transformResource)) else that;
    shared actual default Return transformReturn(Return that)
            => editNode(that) then that.copy(nullsafeInvoke(that.result, transformExpression)) else that;
    shared actual default SafeMemberOperator transformSafeMemberOperator(SafeMemberOperator that)
            => that;
    shared actual default SatisfiedTypes transformSatisfiedTypes(SatisfiedTypes that)
            => editNode(that) then that.copy(that.satisfiedTypes.collect(transformPrimaryType)) else that;
    shared actual default ScaleOperation transformScaleOperation(ScaleOperation that)
            => editNode(that) then that.copy(transformMultiplyingExpression(that.leftOperand), transformScalingExpression(that.rightOperand)) else that;
    shared actual SelfReference transformSelfReference(SelfReference that) {
        assert (is SelfReference ret = super.transformSelfReference(that));
        return ret;
    }
    shared actual default SequentialType transformSequentialType(SequentialType that)
            => editNode(that) then that.copy(transformPrimaryType(that.elementType), nullsafeInvoke(that.length, transformIntegerLiteral)) else that;
    shared actual SetAssignmentOperation transformSetAssignmentOperation(SetAssignmentOperation that) {
        assert (is SetAssignmentOperation ret = super.transformSetAssignmentOperation(that));
        return ret;
    }
    shared actual SetOperation transformSetOperation(SetOperation that) {
        assert (is SetOperation ret = super.transformSetOperation(that));
        return ret;
    }
    shared actual SimpleType transformSimpleType(SimpleType that) {
        assert (is SimpleType ret = super.transformSimpleType(that));
        return ret;
    }
    shared actual default SmallAsOperation transformSmallAsOperation(SmallAsOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand)) else that;
    shared actual default SmallerOperation transformSmallerOperation(SmallerOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand)) else that;
    shared actual default SpanFromSubscript transformSpanFromSubscript(SpanFromSubscript that)
            => editNode(that) then that.copy(transformAddingExpression(that.from)) else that;
    shared actual default SpanOperation transformSpanOperation(SpanOperation that)
            => editNode(that) then that.copy(transformAddingExpression(that.leftOperand), transformAddingExpression(that.rightOperand)) else that;
    shared actual default SpanSubscript transformSpanSubscript(SpanSubscript that)
            => editNode(that) then that.copy(transformAddingExpression(that.from), transformAddingExpression(that.to)) else that;
    shared actual default SpanToSubscript transformSpanToSubscript(SpanToSubscript that)
            => editNode(that) then that.copy(transformAddingExpression(that.to)) else that;
    shared actual Specification transformSpecification(Specification that) {
        assert (is Specification ret = super.transformSpecification(that));
        return ret;
    }
    shared actual default SpecifiedArgument transformSpecifiedArgument(SpecifiedArgument that)
            => editNode(that) then that.copy(transformSpecification(that.specification)) else that;
    shared actual default SpecifiedVariable transformSpecifiedVariable(SpecifiedVariable that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformSpecifier(that.specifier), nullsafeInvoke(that.type, transformTypeOrValueModifier)) else that;
    shared actual default Specifier transformSpecifier(Specifier that)
            => editNode(that) then that.copy(transformExpression(that.expression)) else that;
    shared actual default SpreadArgument transformSpreadArgument(SpreadArgument that)
            => editNode(that) then that.copy(transformUnioningExpression(that.argument)) else that;
    shared actual default SpreadMemberOperator transformSpreadMemberOperator(SpreadMemberOperator that)
            => that;
    shared actual default SpreadType transformSpreadType(SpreadType that)
            => editNode(that) then that.copy(transformType(that.type)) else that;
    shared actual Statement transformStatement(Statement that) {
        assert (is Statement ret = super.transformStatement(that));
        return ret;
    }
    shared actual default StringLiteral transformStringLiteral(StringLiteral that)
            => that;
    shared actual default StringTemplate transformStringTemplate(StringTemplate that)
            => editNode(that) then that.copy(that.literals.collect(transformStringLiteral), that.expressions.collect(transformExpression)) else that;
    shared actual Subscript transformSubscript(Subscript that) {
        assert (is Subscript ret = super.transformSubscript(that));
        return ret;
    }
    shared actual default SubtractAssignmentOperation transformSubtractAssignmentOperation(SubtractAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default SumOperation transformSumOperation(SumOperation that)
            => editNode(that) then that.copy(transformAddingExpression(that.leftOperand), transformScalingExpression(that.rightOperand)) else that;
    shared actual default Super transformSuper(Super that)
            => that;
    shared actual default SwitchCaseElse transformSwitchCaseElse(SwitchCaseElse that)
            => editNode(that) then that.copy(transformSwitchClause(that.clause), transformSwitchCases(that.cases)) else that;
    shared actual default SwitchCases transformSwitchCases(SwitchCases that)
            => editNode(that) then that.copy(that.caseClauses.collect(transformCaseClause), nullsafeInvoke(that.elseClause, transformElseClause)) else that;
    shared actual default SwitchClause transformSwitchClause(SwitchClause that)
            => editNode(that) then that.copy(transformExpressionOrSpecifiedVariable(that.switched)) else that;
    shared actual default ThenOperation transformThenOperation(ThenOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformDisjoiningExpression(that.rightOperand)) else that;
    shared actual default This transformThis(This that)
            => that;
    shared actual default Throw transformThrow(Throw that)
            => editNode(that) then that.copy(nullsafeInvoke(that.result, transformExpression)) else that;
    shared actual default TryCatchFinally transformTryCatchFinally(TryCatchFinally that)
            => editNode(that) then that.copy(transformTryClause(that.tryClause), that.catchClauses.collect(transformCatchClause), nullsafeInvoke(that.finallyClause, transformFinallyClause)) else that;
    shared actual default TryClause transformTryClause(TryClause that)
            => editNode(that) then that.copy(transformBlock(that.block), nullsafeInvoke(that.resources, transformResources)) else that;
    shared actual default Tuple transformTuple(Tuple that)
            => editNode(that) then that.copy(transformArgumentList(that.argumentList)) else that;
    shared actual default TupleType transformTupleType(TupleType that)
            => editNode(that) then that.copy(transformTypeList(that.typeList)) else that;
    shared actual Type transformType(Type that) {
        assert (is Type ret = super.transformType(that));
        return ret;
    }
    shared actual default TypeAliasDefinition transformTypeAliasDefinition(TypeAliasDefinition that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), transformTypeSpecifier(that.specifier), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations)) else that;
    shared actual default TypeArgument transformTypeArgument(TypeArgument that)
            => editNode(that) then that.copy(transformType(that.type), nullsafeInvoke(that.variance, transformVariance)) else that;
    shared actual default TypeArguments transformTypeArguments(TypeArguments that)
            => editNode(that) then that.copy(that.typeArguments.collect(transformTypeArgument)) else that;
    shared actual default TypeConstraint transformTypeConstraint(TypeConstraint that)
            => editNode(that) then that.copy(transformUIdentifier(that.parameterName), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes)) else that;
    shared actual TypeDec transformTypeDec(TypeDec that) {
        assert (is TypeDec ret = super.transformTypeDec(that));
        return ret;
    }
    shared actual TypeDeclaration transformTypeDeclaration(TypeDeclaration that) {
        assert (is TypeDeclaration ret = super.transformTypeDeclaration(that));
        return ret;
    }
    shared actual default TypeIsh transformTypeIsh(TypeIsh that) {
        assert (is TypeIsh ret = super.transformTypeIsh(that));
        return ret;
    }
    shared actual default TypeList transformTypeList(TypeList that)
            => editNode(that) then that.copy(that.elements.collect(transformTypeOrDefaultedType), nullsafeInvoke(that.variadic, transformVariadicType)) else that;
    shared actual default TypeMeta transformTypeMeta(TypeMeta that)
            => editNode(that) then that.copy(transformType(that.type)) else that;
    shared actual TypeModifier transformTypeModifier(TypeModifier that) {
        assert (is TypeModifier ret = super.transformTypeModifier(that));
        return ret;
    }
    shared actual default TypeNameWithTypeArguments transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that)
            => editNode(that) then that.copy(transformUIdentifier(that.name), nullsafeInvoke(that.typeArguments, transformTypeArguments)) else that;
    shared actual default TypeParameter transformTypeParameter(TypeParameter that)
            => editNode(that) then that.copy(transformUIdentifier(that.parameterName), nullsafeInvoke(that.variance, transformVariance), nullsafeInvoke(that.defaultArgument, transformType)) else that;
    shared actual default TypeParameters transformTypeParameters(TypeParameters that)
            => editNode(that) then that.copy(that.typeParameters.collect(transformTypeParameter)) else that;
    shared actual default TypeSpecifier transformTypeSpecifier(TypeSpecifier that)
            => editNode(that) then that.copy(transformType(that.type)) else that;
    shared actual TypedDeclaration transformTypedDeclaration(TypedDeclaration that) {
        assert (is TypedDeclaration ret = super.transformTypedDeclaration(that));
        return ret;
    }
    shared actual default TypedVariable transformTypedVariable(TypedVariable that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformType(that.type), nullsafeInvoke(that.specifier, transformSpecifier)) else that;
    shared actual default UIdentifier transformUIdentifier(UIdentifier that)
            => that;
    shared actual UnaryArithmeticOperation transformUnaryArithmeticOperation(UnaryArithmeticOperation that) {
        assert (is UnaryArithmeticOperation ret = super.transformUnaryArithmeticOperation(that));
        return ret;
    }
    shared actual UnaryIshOperation transformUnaryIshOperation(UnaryIshOperation that) {
        assert (is UnaryIshOperation ret = super.transformUnaryIshOperation(that));
        return ret;
    }
    shared actual UnaryOperation transformUnaryOperation(UnaryOperation that) {
        assert (is UnaryOperation ret = super.transformUnaryOperation(that));
        return ret;
    }
    shared actual UnaryTypeOperation transformUnaryTypeOperation(UnaryTypeOperation that) {
        assert (is UnaryTypeOperation ret = super.transformUnaryTypeOperation(that));
        return ret;
    }
    shared actual default UnionAssignmentOperation transformUnionAssignmentOperation(UnionAssignmentOperation that)
            => editNode(that) then that.copy(transformThenElseExpression(that.leftOperand), transformExpression(that.rightOperand)) else that;
    shared actual default UnionOperation transformUnionOperation(UnionOperation that)
            => editNode(that) then that.copy(transformUnioningExpression(that.leftOperand), transformIntersectingExpression(that.rightOperand)) else that;
    shared actual default UnionType transformUnionType(UnionType that)
            => editNode(that) then that.copy([for (child in that.children) transformIntersectionTypeOrPrimaryType(child)]) else that;
    shared actual UnionableType transformUnionableType(UnionableType that) {
        assert (is UnionableType ret = super.transformUnionableType(that));
        return ret;
    }
    shared actual default UnspecifiedVariable transformUnspecifiedVariable(UnspecifiedVariable that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.type, transformTypeOrValueModifier)) else that;
    shared actual default ValueArgument transformValueArgument(ValueArgument that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrValueModifierOrDynamicModifier(that.type), transformAnySpecifierOrBlock(that.definition)) else that;
    shared actual default ValueConstructorDefinition transformValueConstructorDefinition(ValueConstructorDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformBlock(that.block), nullsafeInvoke(that.extendedType, transformExtendedType), transformAnnotations(that.annotations)) else that;
    shared actual default ValueDec transformValueDec(ValueDec that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformDecQualifier(that.qualifier)) else that;
    shared actual default ValueDeclaration transformValueDeclaration(ValueDeclaration that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrVariadicTypeOrDynamicModifier(that.type), transformAnnotations(that.annotations)) else that;
    shared actual default ValueDefinition transformValueDefinition(ValueDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrValueModifierOrDynamicModifier(that.type), transformAnySpecifier(that.definition), transformAnnotations(that.annotations)) else that;
    shared actual ValueExpression transformValueExpression(ValueExpression that) {
        assert (is ValueExpression ret = super.transformValueExpression(that));
        return ret;
    }
    shared actual default ValueGetterDefinition transformValueGetterDefinition(ValueGetterDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformTypeOrValueModifierOrDynamicModifier(that.type), transformBlock(that.definition), transformAnnotations(that.annotations)) else that;
    shared actual default ValueModifier transformValueModifier(ValueModifier that)
            => that;
    shared actual default ValueParameter transformValueParameter(ValueParameter that)
            => editNode(that) then that.copy(transformTypeOrDynamicModifier(that.type), transformLIdentifier(that.name), transformAnnotations(that.annotations)) else that;
    shared actual default ValueSetterDefinition transformValueSetterDefinition(ValueSetterDefinition that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformBlockOrLazySpecifier(that.definition), transformAnnotations(that.annotations)) else that;
    shared actual default ValueSpecification transformValueSpecification(ValueSpecification that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), transformSpecifier(that.specifier), nullsafeInvoke(that.qualifier, transformThis)) else that;
    shared actual Variable transformVariable(Variable that) {
        assert (is Variable ret = super.transformVariable(that));
        return ret;
    }
    shared actual default VariablePattern transformVariablePattern(VariablePattern that)
            => editNode(that) then that.copy(transformUnspecifiedVariable(that.variable)) else that;
    shared actual default VariadicParameter transformVariadicParameter(VariadicParameter that)
            => editNode(that) then that.copy(transformVariadicType(that.type), transformLIdentifier(that.name), transformAnnotations(that.annotations)) else that;
    shared actual default VariadicType transformVariadicType(VariadicType that)
            => editNode(that) then that.copy(transformMainType(that.elementType)) else that;
    shared actual default VariadicVariable transformVariadicVariable(VariadicVariable that)
            => editNode(that) then that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.type, transformUnionType)) else that;
    shared actual Variance transformVariance(Variance that) {
        assert (is Variance ret = super.transformVariance(that));
        return ret;
    }
    shared actual default VoidModifier transformVoidModifier(VoidModifier that)
            => that;
    shared actual default While transformWhile(While that)
            => editNode(that) then that.copy(transformConditions(that.conditions), transformBlock(that.block)) else that;
    shared actual default WithinOperation transformWithinOperation(WithinOperation that)
            => editNode(that) then that.copy(transformExistsNonemptyExpression(that.operand), transformBound(that.lowerBound), transformBound(that.upperBound)) else that;
    
    // auxiliary methods
    
    SpreadArgument|Comprehension transformSpreadArgumentOrComprehension(SpreadArgument|Comprehension that) {
        switch (that)
        case (is SpreadArgument) { return transformSpreadArgument(that); }
        case (is Comprehension) { return transformComprehension(that); }
    }
    PrimaryType|LIdentifier transformPrimaryTypeOrLIdentifier(PrimaryType|LIdentifier that) {
        switch (that)
        case (is PrimaryType) { return transformPrimaryType(that); }
        case (is LIdentifier) { return transformLIdentifier(that); }
    }
    BaseType|Super transformBaseTypeOrSuper(BaseType|Super that) {
        switch (that)
        case (is BaseType) { return transformBaseType(that); }
        case (is Super) { return transformSuper(that); }
    }
    Block|IfElse transformBlockOrIfElse(Block|IfElse that) {
        switch (that)
        case (is Block) { return transformBlock(that); }
        case (is IfElse) { return transformIfElse(that); }
    }
    VariablePattern|TuplePattern transformVariablePatternOrTuplePattern(VariablePattern|TuplePattern that) {
        switch (that)
        case (is VariablePattern) { return transformVariablePattern(that); }
        case (is TuplePattern) { return transformTuplePattern(that); }
    }
    PackageQualifier|Super|SimpleType transformPackageQualifierOrSuperOrSimpleType(PackageQualifier|Super|SimpleType that) {
        switch (that)
        case (is PackageQualifier) { return transformPackageQualifier(that); }
        case (is Super) { return transformSuper(that); }
        case (is SimpleType) { return transformSimpleType(that); }
    }
    FunctionModifier|VoidModifier transformFunctionModifierOrVoidModifier(FunctionModifier|VoidModifier that) {
        switch (that)
        case (is FunctionModifier) { return transformFunctionModifier(that); }
        case (is VoidModifier) { return transformVoidModifier(that); }
    }
    Declaration|Specification transformDeclarationOrSpecification(Declaration|Specification that) {
        switch (that)
        case (is Declaration) { return transformDeclaration(that); }
        case (is Specification) { return transformSpecification(that); }
    }
    IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression|Tuple transformIntegerLiteralOrCharacterLiteralOrStringLiteralOrNegationOperationOrBaseExpressionOrQualifiedExpressionOrTuple(IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression|Tuple that) {
        switch (that)
        case (is IntegerLiteral) { return transformIntegerLiteral(that); }
        case (is CharacterLiteral) { return transformCharacterLiteral(that); }
        case (is StringLiteral) { return transformStringLiteral(that); }
        case (is NegationOperation) { return transformNegationOperation(that); }
        case (is BaseExpression) { return transformBaseExpression(that); }
        case (is QualifiedExpression) { return transformQualifiedExpression(that); }
        case (is Tuple) { return transformTuple(that); }
    }
    PrefixOperation|PostfixOperation transformPrefixOperationOrPostfixOperation(PrefixOperation|PostfixOperation that) {
        switch (that)
        case (is PrefixOperation) { return transformPrefixOperation(that); }
        case (is PostfixOperation) { return transformPostfixOperation(that); }
    }
    SimpleType|GroupedType transformSimpleTypeOrGroupedType(SimpleType|GroupedType that) {
        switch (that)
        case (is SimpleType) { return transformSimpleType(that); }
        case (is GroupedType) { return transformGroupedType(that); }
    }
    Type|DefaultedType transformTypeOrDefaultedType(Type|DefaultedType that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is DefaultedType) { return transformDefaultedType(that); }
    }
    IntersectionType|PrimaryType transformIntersectionTypeOrPrimaryType(IntersectionType|PrimaryType that) {
        switch (that)
        case (is IntersectionType) { return transformIntersectionType(that); }
        case (is PrimaryType) { return transformPrimaryType(that); }
    }
    AnySpecifier|Block transformAnySpecifierOrBlock(AnySpecifier|Block that) {
        switch (that)
        case (is AnySpecifier) { return transformAnySpecifier(that); }
        case (is Block) { return transformBlock(that); }
    }
    Type|VariadicType|DynamicModifier transformTypeOrVariadicTypeOrDynamicModifier(Type|VariadicType|DynamicModifier that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is VariadicType) { return transformVariadicType(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
    }
    Type|DynamicModifier transformTypeOrDynamicModifier(Type|DynamicModifier that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
    }
    Block|LazySpecifier transformBlockOrLazySpecifier(Block|LazySpecifier that) {
        switch (that)
        case (is Block) { return transformBlock(that); }
        case (is LazySpecifier) { return transformLazySpecifier(that); }
    }
    LazySpecifier|Block transformLazySpecifierOrBlock(LazySpecifier|Block that) {
        switch (that)
        case (is LazySpecifier) { return transformLazySpecifier(that); }
        case (is Block) { return transformBlock(that); }
    }
    SpecifiedPattern|LIdentifier transformSpecifiedPatternOrLIdentifier(SpecifiedPattern|LIdentifier that) {
        switch (that)
        case (is SpecifiedPattern) { return transformSpecifiedPattern(that); }
        case (is LIdentifier) { return transformLIdentifier(that); }
    }
    Statement|Declaration transformStatementOrDeclaration(Statement|Declaration that) {
        switch (that)
        case (is Statement) { return transformStatement(that); }
        case (is Declaration) { return transformDeclaration(that); }
    }
    Type|ValueModifier transformTypeOrValueModifier(Type|ValueModifier that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is ValueModifier) { return transformValueModifier(that); }
    }
    Type|ValueModifier|DynamicModifier transformTypeOrValueModifierOrDynamicModifier(Type|ValueModifier|DynamicModifier that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is ValueModifier) { return transformValueModifier(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
    }
    Type|VoidModifier|FunctionModifier|DynamicModifier transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(Type|VoidModifier|FunctionModifier|DynamicModifier that) {
        switch (that)
        case (is Type) { return transformType(that); }
        case (is VoidModifier) { return transformVoidModifier(that); }
        case (is FunctionModifier) { return transformFunctionModifier(that); }
        case (is DynamicModifier) { return transformDynamicModifier(that); }
    }
    Expression|SpecifiedVariable transformExpressionOrSpecifiedVariable(Expression|SpecifiedVariable that) {
        switch (that)
        case (is Expression) { return transformExpression(that); }
        case (is SpecifiedVariable) { return transformSpecifiedVariable(that); }
    }
    TypeList|SpreadType transformTypeListOrSpreadType(TypeList|SpreadType that) {
        switch (that)
        case (is TypeList) { return transformTypeList(that); }
        case (is SpreadType) { return transformSpreadType(that); }
    }
    DisjoiningExpression|IfElseExpression|LetExpression transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(DisjoiningExpression|IfElseExpression|LetExpression that) {
        switch (that)
        case (is DisjoiningExpression) { return transformDisjoiningExpression(that); }
        case (is IfElseExpression) { return transformIfElseExpression(that); }
        case (is LetExpression) { return transformLetExpression(that); }
    }
    TuplePattern|EntryPattern transformTuplePatternOrEntryPattern(TuplePattern|EntryPattern that) {
        switch (that)
        case (is TuplePattern) { return transformTuplePattern(that); }
        case (is EntryPattern) { return transformEntryPattern(that); }
    }
    Module|ModuleSpecifier transformModuleOrModuleSpecifier(Module|ModuleSpecifier that) {
        switch (that)
        case (is Module) { return transformModule(that); }
        case (is ModuleSpecifier) { return transformModuleSpecifier(that); }
    }
}
