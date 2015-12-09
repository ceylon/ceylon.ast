"""An AST editor.
   There is one method per AST node; override the methods for which you need to change the AST,
   and leave the others untouched.
   
   The default operation for “bottom“ node types’ methods is to copy the node, editing the children.
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
   will insert a print statement at the beginning and end of every function block in the AST.
   
   Note that this deep copy of the AST can be expensive; if you know that you will not touch
   certain parts of the AST – for example, you only edit function bodies, and never individual instructions –
   you might want to override some methods to `return this` instead of a deep copy
   (in this example, override [[transformStatement]])."""
shared interface Editor satisfies ImmediateNarrowingTransformer<Node> {
    shared actual default AddAssignmentOperation transformAddAssignmentOperation(AddAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default AliasDec transformAliasDec(AliasDec that)
            => that.copy(transformUIdentifier(that.name), transformDecQualifier(that.qualifier));
    shared actual default AndAssignmentOperation transformAndAssignmentOperation(AndAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default AndOperation transformAndOperation(AndOperation that)
            => that.copy(transformConjoiningExpression(that.leftOperand), transformNegatingExpression(that.rightOperand));
    shared actual default Annotation transformAnnotation(Annotation that)
            => that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.arguments, transformArguments));
    shared actual default Annotations transformAnnotations(Annotations that)
            => that.copy(nullsafeInvoke(that.anonymousAnnotation, transformStringLiteral), that.annotations.collect(transformAnnotation));
    shared actual default AnonymousArgument transformAnonymousArgument(AnonymousArgument that)
            => that.copy(transformExpression(that.expression));
    shared actual default AnyClass transformAnyClass(AnyClass that) {
        assert (is AnyClass ret = super.transformAnyClass(that));
        return ret;
    }
    shared actual default AnyCompilationUnit transformAnyCompilationUnit(AnyCompilationUnit that) {
        assert (is AnyCompilationUnit ret = super.transformAnyCompilationUnit(that));
        return ret;
    }
    shared actual default AnyFunction transformAnyFunction(AnyFunction that) {
        assert (is AnyFunction ret = super.transformAnyFunction(that));
        return ret;
    }
    shared actual default AnyInterface transformAnyInterface(AnyInterface that) {
        assert (is AnyInterface ret = super.transformAnyInterface(that));
        return ret;
    }
    shared actual default AnyInterfaceDefinition transformAnyInterfaceDefinition(AnyInterfaceDefinition that) {
        assert (is AnyInterfaceDefinition ret = super.transformAnyInterfaceDefinition(that));
        return ret;
    }
    shared actual default AnyMemberOperator transformAnyMemberOperator(AnyMemberOperator that) {
        assert (is AnyMemberOperator ret = super.transformAnyMemberOperator(that));
        return ret;
    }
    shared actual default AnyValue transformAnyValue(AnyValue that) {
        assert (is AnyValue ret = super.transformAnyValue(that));
        return ret;
    }
    shared actual default AnySpecifier transformAnySpecifier(AnySpecifier that) {
        assert (is AnySpecifier ret = super.transformAnySpecifier(that));
        return ret;
    }
    shared actual default ArgumentList transformArgumentList(ArgumentList that) {
        value listedArguments = [for (listedArgument in that.listedArguments) transformExpression(listedArgument)];
        SpreadArgument|Comprehension? sequenceArgument;
        if (exists seq = that.sequenceArgument) {
            switch (seq)
            case (is SpreadArgument) { sequenceArgument = transformSpreadArgument(seq); }
            case (is Comprehension) { sequenceArgument = transformComprehension(seq); }
        } else {
            sequenceArgument = null;
        }
        return that.copy(listedArguments, sequenceArgument);
    }
    shared actual default Arguments transformArguments(Arguments that) {
        assert (is Arguments ret = super.transformArguments(that));
        return ret;
    }
    shared actual default ArithmeticAssignmentOperation transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) {
        assert (is ArithmeticAssignmentOperation ret = super.transformArithmeticAssignmentOperation(that));
        return ret;
    }
    shared actual default ArithmeticOperation transformArithmeticOperation(ArithmeticOperation that) {
        assert (is ArithmeticOperation ret = super.transformArithmeticOperation(that));
        return ret;
    }
    shared actual default Assertion transformAssertion(Assertion that)
            => that.copy(transformConditions(that.conditions), transformAnnotations(that.annotations));
    shared actual default AssignOperation transformAssignOperation(AssignOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default AssignmentOperation transformAssignmentOperation(AssignmentOperation that) {
        assert (is AssignmentOperation ret = super.transformAssignmentOperation(that));
        return ret;
    }
    shared actual default AssignmentStatement transformAssignmentStatement(AssignmentStatement that)
            => that.copy(transformAssignmentOperation(that.expression));
    shared actual default Atom transformAtom(Atom that) {
        assert (is Atom ret = super.transformAtom(that));
        return ret;
    }
    shared actual default BaseExpression transformBaseExpression(BaseExpression that)
            => that.copy(transformNameWithTypeArguments(that.nameAndArgs));
    shared actual default BaseMeta transformBaseMeta(BaseMeta that)
            => that.copy(transformMemberNameWithTypeArguments(that.nameAndArgs), nullsafeInvoke(that.packageQualifier, transformPackageQualifier));
    shared actual default BaseType transformBaseType(BaseType that)
            => that.copy(transformTypeNameWithTypeArguments(that.nameAndArgs), nullsafeInvoke(that.qualifier, transformPackageQualifier));
    shared actual default BinaryOperation transformBinaryOperation(BinaryOperation that) {
        assert (is BinaryOperation ret = super.transformBinaryOperation(that));
        return ret;
    }
    shared actual default Block transformBlock(Block that)
            => that.copy(that.content.collect(transformStatementOrDeclaration));
    shared actual default Body transformBody(Body that) {
        assert (is Body ret = super.transformBody(that));
        return ret;
    }
    shared actual default BooleanCondition transformBooleanCondition(BooleanCondition that)
            => that.copy(transformExpression(that.condition));
    shared actual default Bound transformBound(Bound that) {
        assert (is Bound ret = super.transformBound(that));
        return ret;
    }
    shared actual default Break transformBreak(Break that)
            => that.copy();
    shared actual default CallableConstructorDefinition transformCallableConstructorDefinition(CallableConstructorDefinition that)
            => that.copy(nullsafeInvoke(that.name, transformLIdentifier), transformParameters(that.parameters), transformBlock(that.block), nullsafeInvoke(that.extendedType, transformExtendedType), transformAnnotations(that.annotations));
    shared actual default CallableParameter transformCallableParameter(CallableParameter that)
            => that.copy(transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), transformLIdentifier(that.name), that.parameterLists.collect(transformParameters), transformAnnotations(that.annotations));
    shared actual default CallableType transformCallableType(CallableType that)
            => that.copy(transformPrimaryType(that.returnType), transformTypeListOrSpreadType(that.argumentTypes));
    shared actual default CaseClause transformCaseClause(CaseClause that)
            => that.copy(transformCaseItem(that.caseItem), transformBlock(that.block));
    shared actual default CaseExpression transformCaseExpression(CaseExpression that)
            => that.copy(transformCaseItem(that.caseItem), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.expression));
    shared actual default CaseItem transformCaseItem(CaseItem that) {
        assert (is CaseItem ret = super.transformCaseItem(that));
        return ret;
    }
    shared actual default CaseTypes transformCaseTypes(CaseTypes that) {
        PrimaryType|LIdentifier transformPrimaryTypeOrLIdentifier(PrimaryType|LIdentifier that) {
            switch (that)
            case (is PrimaryType) { return transformPrimaryType(that); }
            case (is LIdentifier) { return transformLIdentifier(that); }
        }
        return that.copy(that.caseTypes.collect(transformPrimaryTypeOrLIdentifier));
    }
    shared actual default CatchClause transformCatchClause(CatchClause that)
            => that.copy(transformUnspecifiedVariable(that.variable), transformBlock(that.block));
    shared actual default CharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => that.copy();
    shared actual default ClassAliasDefinition transformClassAliasDefinition(ClassAliasDefinition that)
            => that.copy(transformUIdentifier(that.name), transformParameters(that.parameters), transformClassSpecifier(that.specifier), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default ClassBody transformClassBody(ClassBody that)
            => that.copy(that.content.collect(transformStatementOrDeclaration));
    shared actual default ClassDec transformClassDec(ClassDec that)
            => that.copy(nullsafeInvoke(that.name, transformIdentifier), nullsafeInvoke(that.qualifier, transformDecQualifier));
    shared actual default ClassDefinition transformClassDefinition(ClassDefinition that)
            => that.copy(transformUIdentifier(that.name), nullsafeInvoke(that.parameters, transformParameters), transformClassBody(that.body), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default ClassOrInterface transformClassOrInterface(ClassOrInterface that) {
        assert (is ClassOrInterface ret = super.transformClassOrInterface(that));
        return ret;
    }
    shared actual default ClassSpecifier transformClassSpecifier(ClassSpecifier that)
            => that.copy(transformExtensionOrConstruction(that.target));
    shared actual default ClosedBound transformClosedBound(ClosedBound that)
            => that.copy(transformExistsNonemptyExpression(that.endpoint));
    shared actual default CompareOperation transformCompareOperation(CompareOperation that)
            => that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand));
    shared actual default ComparisonOperation transformComparisonOperation(ComparisonOperation that) {
        assert (is ComparisonOperation ret = super.transformComparisonOperation(that));
        return ret;
    }
    shared actual default CompilationUnit transformCompilationUnit(CompilationUnit that)
            => that.copy(that.declarations.collect(transformDeclaration), that.imports.collect(transformImport));
    shared actual default ComplementAssignmentOperation transformComplementAssignmentOperation(ComplementAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default ComplementOperation transformComplementOperation(ComplementOperation that)
            => that.copy(transformUnioningExpression(that.leftOperand), transformIntersectingExpression(that.rightOperand));
    shared actual default Comprehension transformComprehension(Comprehension that)
            => that.copy(transformInitialComprehensionClause(that.clause));
    shared actual default ComprehensionClause transformComprehensionClause(ComprehensionClause that) {
        assert (is ComprehensionClause ret = super.transformComprehensionClause(that));
        return ret;
    }
    shared actual default Condition transformCondition(Condition that) {
        assert (is Condition ret = super.transformCondition(that));
        return ret;
    }
    shared actual default ConditionalExpression transformConditionalExpression(ConditionalExpression that) {
        assert (is ConditionalExpression ret = super.transformConditionalExpression(that));
        return ret;
    }
    shared actual default Conditions transformConditions(Conditions that)
            => that.copy(that.conditions.collect(transformCondition));
    shared actual default Construction transformConstruction(Construction that) {
        BaseType|Super transformBaseTypeOrSuper(BaseType|Super that) {
            switch (that)
            case (is BaseType) { return transformBaseType(that); }
            case (is Super) { return transformSuper(that); }
        }
        return that.copy(transformMemberNameWithTypeArguments(that.nameAndArgs), transformPositionalArguments(that.arguments), nullsafeInvoke(that.qualifier, transformBaseTypeOrSuper));
    }
    shared actual default ConstructorDec transformConstructorDec(ConstructorDec that)
            => that.copy(transformLIdentifier(that.name), transformDecQualifier(that.qualifier));
    shared actual default ConstructorDefinition transformConstructorDefinition(ConstructorDefinition that) {
        assert (is ConstructorDefinition ret = super.transformConstructorDefinition(that));
        return ret;
    }
    shared actual default Continue transformContinue(Continue that)
            => that.copy();
    shared actual default ControlStructure transformControlStructure(ControlStructure that) {
        assert (is ControlStructure ret = super.transformControlStructure(that));
        return ret;
    }
    shared actual default Dec transformDec(Dec that) {
        assert (is Dec ret = super.transformDec(that));
        return ret;
    }
    shared actual default DecQualifier transformDecQualifier(DecQualifier that)
            => that.copy(that.components.collect(transformIdentifier), nullsafeInvoke(that.packageQualifier, transformPackageQualifier));
    shared actual default Declaration transformDeclaration(Declaration that) {
        assert (is Declaration ret = super.transformDeclaration(that));
        return ret;
    }
    shared actual default DefaultedCallableParameter transformDefaultedCallableParameter(DefaultedCallableParameter that)
            => that.copy(transformCallableParameter(that.parameter), transformLazySpecifier(that.specifier));
    shared actual default DefaultedParameter transformDefaultedParameter(DefaultedParameter that) {
        assert (is DefaultedParameter ret = super.transformDefaultedParameter(that));
        return ret;
    }
    shared actual default DefaultedParameterReference transformDefaultedParameterReference(DefaultedParameterReference that)
            => that.copy(transformParameterReference(that.parameter), transformSpecifier(that.specifier));
    shared actual default DefaultedType transformDefaultedType(DefaultedType that)
            => that.copy(transformType(that.type));
    shared actual default DefaultedValueParameter transformDefaultedValueParameter(DefaultedValueParameter that)
            => that.copy(transformValueParameter(that.parameter), transformSpecifier(that.specifier));
    shared actual default Destructure transformDestructure(Destructure that)
            => that.copy(transformTuplePatternOrEntryPattern(that.pattern), transformSpecifier(that.specifier), transformValueModifier(that.valueModifier));
    shared actual default DifferenceOperation transformDifferenceOperation(DifferenceOperation that)
            => that.copy(transformAddingExpression(that.leftOperand), transformScalingExpression(that.rightOperand));
    shared actual default Directive transformDirective(Directive that) {
        assert (is Directive ret = super.transformDirective(that));
        return ret;
    }
    shared actual default DivideAssignmentOperation transformDivideAssignmentOperation(DivideAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default DynamicBlock transformDynamicBlock(DynamicBlock that)
            => that.copy(transformBlock(that.block));
    shared actual default DynamicInterfaceDefinition transformDynamicInterfaceDefinition(DynamicInterfaceDefinition that)
            => that.copy(transformUIdentifier(that.name), transformInterfaceBody(that.body), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default DynamicModifier transformDynamicModifier(DynamicModifier that)
            => that.copy();
    shared actual default DynamicValue transformDynamicValue(DynamicValue that)
            => that.copy(that.namedArguments.collect(transformNamedArgument), transformArgumentList(that.iterableArgument), transformDynamicModifier(that.modifier));
    shared actual default ElementOrSubrangeExpression transformElementOrSubrangeExpression(ElementOrSubrangeExpression that)
            => that.copy(transformPrimary(that.primary), transformSubscript(that.subscript));
    shared actual default ElseClause transformElseClause(ElseClause that) {
        Block|IfElse transformBlockOrIfElse(Block|IfElse that) {
            switch (that)
            case (is Block) { return transformBlock(that); }
            case (is IfElse) { return transformIfElse(that); }
        }
        return that.copy(transformBlockOrIfElse(that.child));
    }
    shared actual default ElseOperation transformElseOperation(ElseOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformDisjoiningExpression(that.rightOperand));
    shared actual default EntryOperation transformEntryOperation(EntryOperation that)
            => that.copy(transformAddingExpression(that.leftOperand), transformAddingExpression(that.rightOperand));
    shared actual default EntryPattern transformEntryPattern(EntryPattern that) {
        VariablePattern|TuplePattern transformVariablePatternOrTuplePattern(VariablePattern|TuplePattern that) {
            switch (that)
            case (is VariablePattern) { return transformVariablePattern(that); }
            case (is TuplePattern) { return transformTuplePattern(that); }
        }
        return that.copy(transformVariablePatternOrTuplePattern(that.key), transformVariablePatternOrTuplePattern(that.item));
    }
    shared actual default EntryType transformEntryType(EntryType that)
            => that.copy(transformMainType(that.key), transformMainType(that.item));
    shared actual default EqualOperation transformEqualOperation(EqualOperation that)
            => that.copy(transformComparingExpression(that.leftOperand), transformComparingExpression(that.rightOperand));
    shared actual default EqualityOperation transformEqualityOperation(EqualityOperation that) {
        assert (is EqualityOperation ret = super.transformEqualityOperation(that));
        return ret;
    }
    shared actual default ExistsCondition transformExistsCondition(ExistsCondition that)
            => that.copy(transformSpecifiedPatternOrLIdentifier(that.tested), that.negated);
    shared actual default ExistsOperation transformExistsOperation(ExistsOperation that)
            => that.copy(transformSpanningExpression(that.operand));
    shared actual default ExistsOrNonemptyCondition transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) {
        assert (is ExistsOrNonemptyCondition ret = super.transformExistsOrNonemptyCondition(that));
        return ret;
    }
    shared actual default ExponentiationOperation transformExponentiationOperation(ExponentiationOperation that)
            => that.copy(transformPrePostfixingExpression(that.leftOperand), transformExponentiatingExpression(that.rightOperand));
    shared actual default Expression transformExpression(Expression that) {
        assert (is Expression ret = super.transformExpression(that));
        return ret;
    }
    shared actual default ExpressionComprehensionClause transformExpressionComprehensionClause(ExpressionComprehensionClause that)
            => that.copy(transformExpression(that.expression));
    shared actual default ExpressionStatement transformExpressionStatement(ExpressionStatement that) {
        assert (is ExpressionStatement ret = super.transformExpressionStatement(that));
        return ret;
    }
    shared actual default ExtendedType transformExtendedType(ExtendedType that)
            => that.copy(transformExtensionOrConstruction(that.target));
    shared actual default Extension transformExtension(Extension that) {
        PackageQualifier|Super transformPackageQualifierOrSuper(PackageQualifier|Super that) { 
            switch (that)
            case (is PackageQualifier) { return transformPackageQualifier(that); }
            case (is Super) { return transformSuper(that); }
        }
        return that.copy(transformTypeNameWithTypeArguments(that.nameAndArgs), nullsafeInvoke(that.arguments, transformPositionalArguments), nullsafeInvoke(that.qualifier, transformPackageQualifierOrSuper));
    }
    shared actual default ExtensionOrConstruction transformExtensionOrConstruction(ExtensionOrConstruction that) {
        assert (is ExtensionOrConstruction ret = super.transformExtensionOrConstruction(that));
        return ret;
    }
    shared actual default FailClause transformFailClause(FailClause that)
            => that.copy(transformBlock(that.block));
    shared actual default FinallyClause transformFinallyClause(FinallyClause that)
            => that.copy(transformBlock(that.block));
    shared actual default FloatLiteral transformFloatLiteral(FloatLiteral that)
            => that.copy();
    shared actual default ForClause transformForClause(ForClause that)
            => that.copy(transformForIterator(that.iterator), transformBlock(that.block));
    shared actual default ForComprehensionClause transformForComprehensionClause(ForComprehensionClause that)
            => that.copy(transformForIterator(that.iterator), transformComprehensionClause(that.clause));
    shared actual default ForFail transformForFail(ForFail that)
            => that.copy(transformForClause(that.forClause), nullsafeInvoke(that.failClause, transformFailClause));
    shared actual default ForIterator transformForIterator(ForIterator that)
            => that.copy(transformPattern(that.pattern), transformExpression(that.iterated));
    shared actual default FullPackageName transformFullPackageName(FullPackageName that)
            => that.copy([for (component in that.components) transformLIdentifier(component)]);
    shared actual default FunctionArgument transformFunctionArgument(FunctionArgument that)
            => that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), transformLazySpecifierOrBlock(that.definition));
    shared actual default FunctionDec transformFunctionDec(FunctionDec that)
            => that.copy(transformLIdentifier(that.name), transformDecQualifier(that.qualifier));
    shared actual default FunctionDeclaration transformFunctionDeclaration(FunctionDeclaration that)
            => that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default FunctionDefinition transformFunctionDefinition(FunctionDefinition that) {
        return that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), transformBlock(that.definition), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    }
    shared actual default FunctionExpression transformFunctionExpression(FunctionExpression that) {
        FunctionModifier|VoidModifier transformFunctionModifierOrVoidModifier(FunctionModifier|VoidModifier that) {
            switch (that)
            case (is FunctionModifier) { return transformFunctionModifier(that); }
            case (is VoidModifier) { return transformVoidModifier(that); }
        }
        return that.copy(that.parameterLists.collect(transformParameters), transformLazySpecifierOrBlock(that.definition), nullsafeInvoke(that.type, transformFunctionModifierOrVoidModifier));
    }
    shared actual default FunctionModifier transformFunctionModifier(FunctionModifier that)
            => that.copy();
    shared actual default FunctionShortcutDefinition transformFunctionShortcutDefinition(FunctionShortcutDefinition that)
            => that.copy(transformLIdentifier(that.name), transformTypeOrVoidModifierOrFunctionModifierOrDynamicModifier(that.type), that.parameterLists.collect(transformParameters), transformLazySpecifier(that.definition), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default GivenDec transformGivenDec(GivenDec that)
            => that.copy(transformUIdentifier(that.name), transformDecQualifier(that.qualifier));
    shared actual default GroupedExpression transformGroupedExpression(GroupedExpression that)
            => that.copy(transformExpression(that.innerExpression));
    shared actual default GroupedType transformGroupedType(GroupedType that)
            => that.copy(transformType(that.type));
    shared actual default IdenticalOperation transformIdenticalOperation(IdenticalOperation that)
            => that.copy(transformComparingExpression(that.leftOperand), transformComparingExpression(that.rightOperand));
    shared actual default Identifier transformIdentifier(Identifier that) {
        assert (is Identifier ret = super.transformIdentifier(that));
        return ret;
    }
    shared actual default IdentityOperation transformIdentityOperation(IdentityOperation that)
            => that.copy(transformExponentiatingExpression(that.operand));
    shared actual default IfClause transformIfClause(IfClause that)
            => that.copy(transformConditions(that.conditions), transformBlock(that.block));
    shared actual default IfComprehensionClause transformIfComprehensionClause(IfComprehensionClause that)
            => that.copy(transformConditions(that.conditions), transformComprehensionClause(that.clause));
    shared actual default IfElse transformIfElse(IfElse that)
            => that.copy(transformIfClause(that.ifClause), nullsafeInvoke(that.elseClause, transformElseClause));
    shared actual default IfElseExpression transformIfElseExpression(IfElseExpression that) {
        return that.copy(transformConditions(that.conditions), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.thenExpression), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.elseExpression));
    }
    shared actual default Import transformImport(Import that)
            => that.copy(transformFullPackageName(that.packageName), transformImportElements(that.elements));
    shared actual default ImportAlias transformImportAlias(ImportAlias that) {
        assert (is ImportAlias ret = super.transformImportAlias(that));
        return ret;
    }
    shared actual default ImportElement transformImportElement(ImportElement that) {
        assert (is ImportElement ret = super.transformImportElement(that));
        return ret;
    }
    shared actual default ImportElements transformImportElements(ImportElements that)
            => that.copy(that.elements.collect(transformImportElement), nullsafeInvoke(that.wildcard, transformImportWildcard));
    shared actual default ImportFunctionValueAlias transformImportFunctionValueAlias(ImportFunctionValueAlias that)
            => that.copy(transformLIdentifier(that.name));
    shared actual default ImportFunctionValueElement transformImportFunctionValueElement(ImportFunctionValueElement that)
            => that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.importAlias, transformImportFunctionValueAlias), nullsafeInvoke(that.nestedImports, transformImportElements));
    shared actual default ImportTypeAlias transformImportTypeAlias(ImportTypeAlias that)
            => that.copy(transformUIdentifier(that.name));
    shared actual default ImportTypeElement transformImportTypeElement(ImportTypeElement that)
            => that.copy(transformUIdentifier(that.name), nullsafeInvoke(that.importAlias, transformImportTypeAlias), nullsafeInvoke(that.nestedImports, transformImportElements));
    shared actual default ImportWildcard transformImportWildcard(ImportWildcard that)
            => that.copy();
    shared actual default InModifier transformInModifier(InModifier that)
            => that.copy();
    shared actual default InOperation transformInOperation(InOperation that)
            => that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand));
    shared actual default InitialComprehensionClause transformInitialComprehensionClause(InitialComprehensionClause that) {
        assert (is InitialComprehensionClause ret = super.transformInitialComprehensionClause(that));
        return ret;
    }
    shared actual default InlineDefinitionArgument transformInlineDefinitionArgument(InlineDefinitionArgument that) {
        assert (is InlineDefinitionArgument ret = super.transformInlineDefinitionArgument(that));
        return ret;
    }
    shared actual default IntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => that.copy();
    shared actual default InterfaceAliasDefinition transformInterfaceAliasDefinition(InterfaceAliasDefinition that)
            => that.copy(transformUIdentifier(that.name), transformTypeSpecifier(that.specifier), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default InterfaceBody transformInterfaceBody(InterfaceBody that) {
        Declaration|Specification transformDeclarationOrSpecification(Declaration|Specification that) {
            switch (that)
            case (is Declaration) { return transformDeclaration(that); }
            case (is Specification) { return transformSpecification(that); }
        }
        return that.copy(that.content.collect(transformDeclarationOrSpecification));
    }
    shared actual default InterfaceDec transformInterfaceDec(InterfaceDec that)
            => that.copy(nullsafeInvoke(that.name, transformUIdentifier), nullsafeInvoke(that.qualifier, transformDecQualifier));
    shared actual default InterfaceDefinition transformInterfaceDefinition(InterfaceDefinition that)
            => that.copy(transformUIdentifier(that.name), transformInterfaceBody(that.body), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default IntersectAssignmentOperation transformIntersectAssignmentOperation(IntersectAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default IntersectionOperation transformIntersectionOperation(IntersectionOperation that)
            => that.copy(transformIntersectingExpression(that.leftOperand), transformInvertingExpression(that.rightOperand));
    shared actual default IntersectionType transformIntersectionType(IntersectionType that)
            => that.copy([for (child in that.children) transformPrimaryType(child)]);
    shared actual default Invocation transformInvocation(Invocation that)
            => that.copy(transformPrimary(that.invoked), transformArguments(that.arguments));
    shared actual default InvocationStatement transformInvocationStatement(InvocationStatement that)
            => that.copy(transformInvocation(that.expression));
    shared actual default IsCase transformIsCase(IsCase that)
            => that.copy(transformType(that.type));
    shared actual default IsCondition transformIsCondition(IsCondition that)
            => that.copy(transformTypedVariable(that.variable), that.negated);
    shared actual default IterableType transformIterableType(IterableType that)
            => that.copy(transformVariadicType(that.variadicType));
    shared actual default IsOperation transformIsOperation(IsOperation that)
            => that.copy(transformExistsNonemptyExpression(that.operand), transformType(that.type));
    shared actual default Iterable transformIterable(Iterable that)
            => that.copy(transformArgumentList(that.argumentList));
    shared actual default KeySubscript transformKeySubscript(KeySubscript that)
            => that.copy(transformAddingExpression(that.key));
    shared actual default LargeAsOperation transformLargeAsOperation(LargeAsOperation that)
            => that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand));
    shared actual default LargerOperation transformLargerOperation(LargerOperation that)
            => that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand));
    shared actual default LIdentifier transformLIdentifier(LIdentifier that)
            => that.copy();
    shared actual default LazySpecification transformLazySpecification(LazySpecification that)
            => that.copy(transformLIdentifier(that.name), transformLazySpecifier(that.specifier), that.parameterLists.collect(transformParameters), nullsafeInvoke(that.qualifier, transformThis));
    shared actual default LazySpecifier transformLazySpecifier(LazySpecifier that)
            => that.copy(transformExpression(that.expression));
    shared actual default LetExpression transformLetExpression(LetExpression that)
            => that.copy(transformPatternList(that.patterns), transformDisjoiningExpressionOrIfElseExpressionOrLetExpression(that.expression));
    shared actual default Literal transformLiteral(Literal that) {
        assert (is Literal ret = super.transformLiteral(that));
        return ret;
    }
    shared actual default LocalModifier transformLocalModifier(LocalModifier that) {
        assert (is LocalModifier ret = super.transformLocalModifier(that));
        return ret;
    }
    shared actual default LogicalAssignmentOperation transformLogicalAssignmentOperation(LogicalAssignmentOperation that) {
        assert (is LogicalAssignmentOperation ret = super.transformLogicalAssignmentOperation(that));
        return ret;
    }
    shared actual default LogicalOperation transformLogicalOperation(LogicalOperation that) {
        assert (is LogicalOperation ret = super.transformLogicalOperation(that));
        return ret;
    }
    shared actual default MainType transformMainType(MainType that) {
        assert (is MainType ret = super.transformMainType(that));
        return ret;
    }
    shared actual default MatchCase transformMatchCase(MatchCase that) {
        IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression transformIntegerLiteralOrCharacterLiteralOrStringLiteralOrNegationOperationOrBaseExpressionOrQualifiedExpression(IntegerLiteral|CharacterLiteral|StringLiteral|NegationOperation|BaseExpression|QualifiedExpression that) {
            switch (that)
            case (is IntegerLiteral) { return transformIntegerLiteral(that); }
            case (is CharacterLiteral) { return transformCharacterLiteral(that); }
            case (is StringLiteral) { return transformStringLiteral(that); }
            case (is NegationOperation) { return transformNegationOperation(that); }
            case (is BaseExpression) { return transformBaseExpression(that); }
            case (is QualifiedExpression) { return transformQualifiedExpression(that); }
        }
        return that.copy(that.expressions.collect(transformIntegerLiteralOrCharacterLiteralOrStringLiteralOrNegationOperationOrBaseExpressionOrQualifiedExpression));
    }
    shared actual default MeasureOperation transformMeasureOperation(MeasureOperation that)
            => that.copy(transformAddingExpression(that.leftOperand), transformAddingExpression(that.rightOperand));
    shared actual default MeasureSubscript transformMeasureSubscript(MeasureSubscript that)
            => that.copy(transformAddingExpression(that.from), transformAddingExpression(that.length));
    shared actual default MemberDec transformMemberDec(MemberDec that) {
        assert (is MemberDec ret = super.transformMemberDec(that));
        return ret;
    }
    shared actual default MemberMeta transformMemberMeta(MemberMeta that)
            => that.copy(transformPrimaryType(that.qualifier), transformMemberNameWithTypeArguments(that.nameAndArgs));
    shared actual default MemberNameWithTypeArguments transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that)
            => that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.typeArguments, transformTypeArguments));
    shared actual default MemberOperator transformMemberOperator(MemberOperator that)
            => that.copy();
    shared actual default Meta transformMeta(Meta that) {
        assert (is Meta ret = super.transformMeta(that));
        return ret;
    }
    shared actual default Modifier transformModifier(Modifier that) {
        assert (is Modifier ret = super.transformModifier(that));
        return ret;
    }
    shared actual default ModuleBody transformModuleBody(ModuleBody that)
            => that.copy(that.moduleImports.collect(transformModuleImport));
    shared actual default ModuleCompilationUnit transformModuleCompilationUnit(ModuleCompilationUnit that)
            => that.copy(transformModuleDescriptor(that.moduleDescriptor), that.imports.collect(transformImport));
    shared actual default ModuleDec transformModuleDec(ModuleDec that)
            => that.copy(nullsafeInvoke(that.moduleName, transformFullPackageName));
    shared actual default ModuleDescriptor transformModuleDescriptor(ModuleDescriptor that)
            => that.copy(transformFullPackageName(that.name), transformStringLiteral(that.version), transformModuleBody(that.body), transformAnnotations(that.annotations));
    shared actual default ModuleImport transformModuleImport(ModuleImport that) {
        FullPackageName|StringLiteral transformFullPackageNameOrStringLiteral(FullPackageName|StringLiteral that) {
            switch (that)
            case (is FullPackageName) { return transformFullPackageName(that); }
            case (is StringLiteral) { return transformStringLiteral(that); }
        }
        return that.copy(transformFullPackageNameOrStringLiteral(that.name), transformStringLiteral(that.version), transformAnnotations(that.annotations));
    }
    shared actual default MultiplyAssignmentOperation transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default NameWithTypeArguments transformNameWithTypeArguments(NameWithTypeArguments that) {
        assert (is NameWithTypeArguments ret = super.transformNameWithTypeArguments(that));
        return ret;
    }
    shared actual default NamedArgument transformNamedArgument(NamedArgument that) {
        assert (is NamedArgument ret = super.transformNamedArgument(that));
        return ret;
    }
    shared actual default NamedArguments transformNamedArguments(NamedArguments that)
            => that.copy([for (namedArgument in that.namedArguments) transformNamedArgument(namedArgument)], transformArgumentList(that.iterableArgument));
    shared actual default NegationOperation transformNegationOperation(NegationOperation that)
            => that.copy(transformExponentiatingExpression(that.operand));
    shared actual default NonemptyCondition transformNonemptyCondition(NonemptyCondition that)
            => that.copy(transformSpecifiedPatternOrLIdentifier(that.tested), that.negated);
    shared actual default NonemptyOperation transformNonemptyOperation(NonemptyOperation that)
            => that.copy(transformSpanningExpression(that.operand));
    shared actual default NotEqualOperation transformNotEqualOperation(NotEqualOperation that)
            => that.copy(transformComparingExpression(that.leftOperand), transformComparingExpression(that.rightOperand));
    shared actual default NotOperation transformNotOperation(NotOperation that)
            => that.copy(transformNegatingExpression(that.operand));
    shared actual default ObjectArgument transformObjectArgument(ObjectArgument that)
            => that.copy(transformLIdentifier(that.name), transformClassBody(that.body), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes));
    shared actual default ObjectDefinition transformObjectDefinition(ObjectDefinition that)
            => that.copy(transformLIdentifier(that.name), transformClassBody(that.body), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes), transformAnnotations(that.annotations));
    shared actual default ObjectExpression transformObjectExpression(ObjectExpression that)
            => that.copy(transformClassBody(that.body), nullsafeInvoke(that.extendedType, transformExtendedType), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes));
    shared actual default OfOperation transformOfOperation(OfOperation that)
            => that.copy(transformExistsNonemptyExpression(that.operand), transformType(that.type));
    shared actual default OpenBound transformOpenBound(OpenBound that)
            => that.copy(transformExistsNonemptyExpression(that.endpoint));
    shared actual default Operation transformOperation(Operation that) {
        assert (is Operation ret = super.transformOperation(that));
        return ret;
    }
    shared actual default OptionalType transformOptionalType(OptionalType that)
            => that.copy(transformPrimaryType(that.definiteType));
    shared actual default OrAssignmentOperation transformOrAssignmentOperation(OrAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default OrOperation transformOrOperation(OrOperation that)
            => that.copy(transformDisjoiningExpression(that.leftOperand), transformConjoiningExpression(that.rightOperand));
    shared actual default OutModifier transformOutModifier(OutModifier that)
            => that.copy();
    shared actual default Outer transformOuter(Outer that)
            => that.copy();
    shared actual default Package transformPackage(Package that)
            => that.copy();
    shared actual default PackageCompilationUnit transformPackageCompilationUnit(PackageCompilationUnit that)
            => that.copy(transformPackageDescriptor(that.packageDescriptor), that.imports.collect(transformImport));
    shared actual default PackageDec transformPackageDec(PackageDec that)
            => that.copy(nullsafeInvoke(that.packageName, transformFullPackageName));
    shared actual default PackageDescriptor transformPackageDescriptor(PackageDescriptor that)
            => that.copy(transformFullPackageName(that.name), transformAnnotations(that.annotations));
    shared actual default PackageQualifier transformPackageQualifier(PackageQualifier that)
            => that.copy();
    shared actual default Parameter transformParameter(Parameter that) {
        assert (is Parameter ret = super.transformParameter(that));
        return ret;
    }
    shared actual default ParameterReference transformParameterReference(ParameterReference that)
            => that.copy(transformLIdentifier(that.name));
    shared actual default Parameters transformParameters(Parameters that)
            => that.copy(that.parameters.collect(transformParameter));
    shared actual default Pattern transformPattern(Pattern that) {
        assert (is Pattern ret = super.transformPattern(that));
        return ret;
    }
    shared actual default PatternList transformPatternList(PatternList that)
            => that.copy(that.patterns.collect(transformSpecifiedPattern));
    shared actual default PositionalArguments transformPositionalArguments(PositionalArguments that)
            => that.copy(transformArgumentList(that.argumentList));
    shared actual default PostfixDecrementOperation transformPostfixDecrementOperation(PostfixDecrementOperation that)
            => that.copy(transformPrimary(that.operand));
    shared actual default PostfixIncrementOperation transformPostfixIncrementOperation(PostfixIncrementOperation that)
            => that.copy(transformPrimary(that.operand));
    shared actual default PostfixOperation transformPostfixOperation(PostfixOperation that) {
        assert (is PostfixOperation ret = super.transformPostfixOperation(that));
        return ret;
    }
    shared actual default PrePostfixingExpression transformPrePostfixingExpression(PrePostfixingExpression that) {
        assert (is PrePostfixingExpression ret = super.transformPrePostfixingExpression(that));
        return ret;
    }
    shared actual default ExponentiatingExpression transformExponentiatingExpression(ExponentiatingExpression that) {
        assert (is ExponentiatingExpression ret = super.transformExponentiatingExpression(that));
        return ret;
    }
    shared actual default InvertingExpression transformInvertingExpression(InvertingExpression that) {
        assert (is InvertingExpression ret = super.transformInvertingExpression(that));
        return ret;
    }
    shared actual default IntersectingExpression transformIntersectingExpression(IntersectingExpression that) {
        assert (is IntersectingExpression ret = super.transformIntersectingExpression(that));
        return ret;
    }
    shared actual default SpecifiedPattern transformSpecifiedPattern(SpecifiedPattern that)
            => that.copy(transformPattern(that.pattern), transformSpecifier(that.specifier));
    shared actual default StructureExpression transformStructureExpression(StructureExpression that) {
        assert (is StructureExpression ret = super.transformStructureExpression(that));
        return ret;
    }
    shared actual default SwitchCaseElseExpression transformSwitchCaseElseExpression(SwitchCaseElseExpression that)
            => that.copy(transformSwitchClause(that.clause), that.caseExpressions.collect(transformCaseExpression), nullsafeInvoke(that.elseExpression, transformDisjoiningExpressionOrIfElseExpressionOrLetExpression));
    shared actual default TuplePattern transformTuplePattern(TuplePattern that)
            => that.copy(that.elementPatterns.collect(transformPattern), nullsafeInvoke(that.variadicElementPattern, transformVariadicVariable));
    shared actual default UnioningExpression transformUnioningExpression(UnioningExpression that) {
        assert (is UnioningExpression ret = super.transformUnioningExpression(that));
        return ret;
    }
    shared actual default MultiplyingExpression transformMultiplyingExpression(MultiplyingExpression that) {
        assert (is MultiplyingExpression ret = super.transformMultiplyingExpression(that));
        return ret;
    }
    shared actual default ScalingExpression transformScalingExpression(ScalingExpression that) {
        assert (is ScalingExpression ret = super.transformScalingExpression(that));
        return ret;
    }
    shared actual default AddingExpression transformAddingExpression(AddingExpression that) {
        assert (is AddingExpression ret = super.transformAddingExpression(that));
        return ret;
    }
    shared actual default SpanningExpression transformSpanningExpression(SpanningExpression that) {
        assert (is SpanningExpression ret = super.transformSpanningExpression(that));
        return ret;
    }
    shared actual default ExistsNonemptyExpression transformExistsNonemptyExpression(ExistsNonemptyExpression that) {
        assert (is ExistsNonemptyExpression ret = super.transformExistsNonemptyExpression(that));
        return ret;
    }
    shared actual default ComparingExpression transformComparingExpression(ComparingExpression that) {
        assert (is ComparingExpression ret = super.transformComparingExpression(that));
        return ret;
    }
    shared actual default EquatingExpression transformEquatingExpression(EquatingExpression that) {
        assert (is EquatingExpression ret = super.transformEquatingExpression(that));
        return ret;
    }
    shared actual default NegatingExpression transformNegatingExpression(NegatingExpression that) {
        assert (is NegatingExpression ret = super.transformNegatingExpression(that));
        return ret;
    }
    shared actual default ConjoiningExpression transformConjoiningExpression(ConjoiningExpression that) {
        assert (is ConjoiningExpression ret = super.transformConjoiningExpression(that));
        return ret;
    }
    shared actual default DisjoiningExpression transformDisjoiningExpression(DisjoiningExpression that) {
        assert (is DisjoiningExpression ret = super.transformDisjoiningExpression(that));
        return ret;
    }
    shared actual default ThenElseExpression transformThenElseExpression(ThenElseExpression that) {
        assert (is ThenElseExpression ret = super.transformThenElseExpression(that));
        return ret;
    }
    shared actual default AssigningExpression transformAssigningExpression(AssigningExpression that) {
        assert (is AssigningExpression ret = super.transformAssigningExpression(that));
        return ret;
    }
    shared actual default PrefixDecrementOperation transformPrefixDecrementOperation(PrefixDecrementOperation that)
            => that.copy(transformPrimary(that.operand));
    shared actual default PrefixIncrementOperation transformPrefixIncrementOperation(PrefixIncrementOperation that)
            => that.copy(transformPrimary(that.operand));
    shared actual default PrefixOperation transformPrefixOperation(PrefixOperation that) {
        assert (is PrefixOperation ret = super.transformPrefixOperation(that));
        return ret;
    }
    shared actual default PrefixPostfixStatement transformPrefixPostfixStatement(PrefixPostfixStatement that) {
        PrefixOperation|PostfixOperation transformPrefixOperationOrPostfixOperation(PrefixOperation|PostfixOperation that) {
            switch (that)
            case (is PrefixOperation) { return transformPrefixOperation(that); }
            case (is PostfixOperation) { return transformPostfixOperation(that); }
        }
        return that.copy(transformPrefixOperationOrPostfixOperation(that.expression));
    }
    shared actual default Primary transformPrimary(Primary that) {
        assert (is Primary ret = super.transformPrimary(that));
        return ret;
    }
    shared actual default PrimaryType transformPrimaryType(PrimaryType that) {
        assert (is PrimaryType ret = super.transformPrimaryType(that));
        return ret;
    }
    shared actual default ProductOperation transformProductOperation(ProductOperation that)
            => that.copy(transformMultiplyingExpression(that.leftOperand), transformUnioningExpression(that.rightOperand));
    shared actual default QualifiedExpression transformQualifiedExpression(QualifiedExpression that)
            => that.copy(transformPrimary(that.receiverExpression), transformNameWithTypeArguments(that.nameAndArgs), transformAnyMemberOperator(that.memberOperator));
    shared actual default QualifiedType transformQualifiedType(QualifiedType that) {
        SimpleType|GroupedType transformSimpleTypeOrGroupedType(SimpleType|GroupedType that) {
            switch (that)
            case (is SimpleType) { return transformSimpleType(that); }
            case (is GroupedType) { return transformGroupedType(that); }
        }
        return that.copy(transformSimpleTypeOrGroupedType(that.qualifyingType), transformTypeNameWithTypeArguments(that.nameAndArgs));
    }
    shared actual default QuotientOperation transformQuotientOperation(QuotientOperation that)
            => that.copy(transformMultiplyingExpression(that.leftOperand), transformUnioningExpression(that.rightOperand));
    shared actual default RangeSubscript transformRangeSubscript(RangeSubscript that) {
        assert (is RangeSubscript ret = super.transformRangeSubscript(that));
        return ret;
    }
    shared actual default RemainderAssignmentOperation transformRemainderAssignmentOperation(RemainderAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default RemainderOperation transformRemainderOperation(RemainderOperation that)
            => that.copy(transformMultiplyingExpression(that.leftOperand), transformUnioningExpression(that.rightOperand));
    shared actual default RequiredParameter transformRequiredParameter(RequiredParameter that) {
        assert (is RequiredParameter ret = super.transformRequiredParameter(that));
        return ret;
    }
    shared actual default Resource transformResource(Resource that)
            => that.copy(transformExpressionOrSpecifiedVariable(that.resource));
    shared actual default Resources transformResources(Resources that)
            => that.copy(that.resources.collect(transformResource));
    shared actual default Return transformReturn(Return that)
            => that.copy(nullsafeInvoke(that.result, transformExpression));
    shared actual default SafeMemberOperator transformSafeMemberOperator(SafeMemberOperator that)
            => that.copy();
    shared actual default SatisfiedTypes transformSatisfiedTypes(SatisfiedTypes that)
            => that.copy(that.satisfiedTypes.collect(transformPrimaryType));
    shared actual default ScaleOperation transformScaleOperation(ScaleOperation that)
            => that.copy(transformMultiplyingExpression(that.leftOperand), transformScalingExpression(that.rightOperand));
    shared actual default SelfReference transformSelfReference(SelfReference that) {
        assert (is SelfReference ret = super.transformSelfReference(that));
        return ret;
    }
    shared actual default SequentialType transformSequentialType(SequentialType that)
            => that.copy(transformPrimaryType(that.elementType), nullsafeInvoke(that.length, transformIntegerLiteral));
    shared actual default SetAssignmentOperation transformSetAssignmentOperation(SetAssignmentOperation that) {
        assert (is SetAssignmentOperation ret = super.transformSetAssignmentOperation(that));
        return ret;
    }
    shared actual default SetOperation transformSetOperation(SetOperation that) {
        assert (is SetOperation ret = super.transformSetOperation(that));
        return ret;
    }
    shared actual default SimpleType transformSimpleType(SimpleType that) {
        assert (is SimpleType ret = super.transformSimpleType(that));
        return ret;
    }
    shared actual default SmallAsOperation transformSmallAsOperation(SmallAsOperation that)
            => that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand));
    shared actual default SmallerOperation transformSmallerOperation(SmallerOperation that)
            => that.copy(transformExistsNonemptyExpression(that.leftOperand), transformExistsNonemptyExpression(that.rightOperand));
    shared actual default SpanFromSubscript transformSpanFromSubscript(SpanFromSubscript that)
            => that.copy(transformAddingExpression(that.from));
    shared actual default SpanOperation transformSpanOperation(SpanOperation that)
            => that.copy(transformAddingExpression(that.leftOperand), transformAddingExpression(that.rightOperand));
    shared actual default SpanSubscript transformSpanSubscript(SpanSubscript that)
            => that.copy(transformAddingExpression(that.from), transformAddingExpression(that.to));
    shared actual default SpanToSubscript transformSpanToSubscript(SpanToSubscript that)
            => that.copy(transformAddingExpression(that.to));
    shared actual default Specification transformSpecification(Specification that) {
        assert (is Specification ret = super.transformSpecification(that));
        return ret;
    }
    shared actual default SpecifiedArgument transformSpecifiedArgument(SpecifiedArgument that)
            => that.copy(transformSpecification(that.specification));
    shared actual default SpecifiedVariable transformSpecifiedVariable(SpecifiedVariable that)
            => that.copy(transformLIdentifier(that.name), transformSpecifier(that.specifier), nullsafeInvoke(that.type, transformTypeOrValueModifier));
    shared actual default Specifier transformSpecifier(Specifier that)
            => that.copy(transformExpression(that.expression));
    shared actual default SpreadArgument transformSpreadArgument(SpreadArgument that)
            => that.copy(transformUnioningExpression(that.argument));
    shared actual default SpreadMemberOperator transformSpreadMemberOperator(SpreadMemberOperator that)
            => that.copy();
    shared actual default SpreadType transformSpreadType(SpreadType that)
            => that.copy(transformType(that.type));
    shared actual default Statement transformStatement(Statement that) {
        assert (is Statement ret = super.transformStatement(that));
        return ret;
    }
    shared actual default StringLiteral transformStringLiteral(StringLiteral that)
            => that.copy();
    shared actual default StringTemplate transformStringTemplate(StringTemplate that)
            => that.copy(that.literals.collect(transformStringLiteral), that.expressions.collect(transformExpression));
    shared actual default Subscript transformSubscript(Subscript that) {
        assert (is Subscript ret = super.transformSubscript(that));
        return ret;
    }
    shared actual default SubtractAssignmentOperation transformSubtractAssignmentOperation(SubtractAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default SumOperation transformSumOperation(SumOperation that)
            => that.copy(transformAddingExpression(that.leftOperand), transformScalingExpression(that.rightOperand));
    shared actual default Super transformSuper(Super that)
            => that.copy();
    shared actual default SwitchCaseElse transformSwitchCaseElse(SwitchCaseElse that)
            => that.copy(transformSwitchClause(that.clause), transformSwitchCases(that.cases));
    shared actual default SwitchCases transformSwitchCases(SwitchCases that)
            => that.copy(that.caseClauses.collect(transformCaseClause), nullsafeInvoke(that.elseClause, transformElseClause));
    shared actual default SwitchClause transformSwitchClause(SwitchClause that)
            => that.copy(transformExpressionOrSpecifiedVariable(that.switched));
    shared actual default ThenOperation transformThenOperation(ThenOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformDisjoiningExpression(that.rightOperand));
    shared actual default This transformThis(This that)
            => that.copy();
    shared actual default Throw transformThrow(Throw that)
            => that.copy(nullsafeInvoke(that.result, transformExpression));
    shared actual default TryCatchFinally transformTryCatchFinally(TryCatchFinally that)
            => that.copy(transformTryClause(that.tryClause), that.catchClauses.collect(transformCatchClause), nullsafeInvoke(that.finallyClause, transformFinallyClause));
    shared actual default TryClause transformTryClause(TryClause that)
            => that.copy(transformBlock(that.block), nullsafeInvoke(that.resources, transformResources));
    shared actual default Tuple transformTuple(Tuple that)
            => that.copy(transformArgumentList(that.argumentList));
    shared actual default TupleType transformTupleType(TupleType that)
            => that.copy(transformTypeList(that.typeList));
    shared actual default Type transformType(Type that) {
        assert (is Type ret = super.transformType(that));
        return ret;
    }
    shared actual default TypeAliasDefinition transformTypeAliasDefinition(TypeAliasDefinition that)
            => that.copy(transformUIdentifier(that.name), transformTypeSpecifier(that.specifier), nullsafeInvoke(that.typeParameters, transformTypeParameters), that.typeConstraints.collect(transformTypeConstraint), transformAnnotations(that.annotations));
    shared actual default TypeArgument transformTypeArgument(TypeArgument that)
            => that.copy(transformType(that.type), nullsafeInvoke(that.variance, transformVariance));
    shared actual default TypeArguments transformTypeArguments(TypeArguments that)
            => that.copy(that.typeArguments.collect(transformTypeArgument));
    shared actual default TypeConstraint transformTypeConstraint(TypeConstraint that)
            => that.copy(transformUIdentifier(that.parameterName), nullsafeInvoke(that.caseTypes, transformCaseTypes), nullsafeInvoke(that.satisfiedTypes, transformSatisfiedTypes));
    shared actual default TypeDec transformTypeDec(TypeDec that) {
        assert (is TypeDec ret = super.transformTypeDec(that));
        return ret;
    }
    shared actual default TypeDeclaration transformTypeDeclaration(TypeDeclaration that) {
        assert (is TypeDeclaration ret = super.transformTypeDeclaration(that));
        return ret;
    }
    shared actual default TypeIsh transformTypeIsh(TypeIsh that) {
        assert (is TypeIsh ret = super.transformTypeIsh(that));
        return ret;
    }
    shared actual default TypeList transformTypeList(TypeList that) {
        Type|DefaultedType transformTypeOrDefaultedType(Type|DefaultedType that) {
            switch (that)
            case (is Type) { return transformType(that); }
            case (is DefaultedType) { return transformDefaultedType(that); }
        }
        return that.copy(that.elements.collect(transformTypeOrDefaultedType), nullsafeInvoke(that.variadic, transformVariadicType));
    }
    shared actual default TypeMeta transformTypeMeta(TypeMeta that)
            => that.copy(transformType(that.type));
    shared actual default TypeModifier transformTypeModifier(TypeModifier that) {
        assert (is TypeModifier ret = super.transformTypeModifier(that));
        return ret;
    }
    shared actual default TypeNameWithTypeArguments transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that)
            => that.copy(transformUIdentifier(that.name), nullsafeInvoke(that.typeArguments, transformTypeArguments));
    shared actual default TypeParameter transformTypeParameter(TypeParameter that)
            => that.copy(transformUIdentifier(that.parameterName), nullsafeInvoke(that.variance, transformVariance), nullsafeInvoke(that.defaultArgument, transformType));
    shared actual default TypeParameters transformTypeParameters(TypeParameters that)
            => that.copy(that.typeParameters.collect(transformTypeParameter));
    shared actual default TypeSpecifier transformTypeSpecifier(TypeSpecifier that)
            => that.copy(transformType(that.type));
    shared actual default TypedDeclaration transformTypedDeclaration(TypedDeclaration that) {
        assert (is TypedDeclaration ret = super.transformTypedDeclaration(that));
        return ret;
    }
    shared actual default TypedVariable transformTypedVariable(TypedVariable that)
            => that.copy(transformLIdentifier(that.name), transformType(that.type), nullsafeInvoke(that.specifier, transformSpecifier));
    shared actual default UIdentifier transformUIdentifier(UIdentifier that)
            => that.copy();
    shared actual default UnaryArithmeticOperation transformUnaryArithmeticOperation(UnaryArithmeticOperation that) {
        assert (is UnaryArithmeticOperation ret = super.transformUnaryArithmeticOperation(that));
        return ret;
    }
    
    shared actual default UnaryIshOperation transformUnaryIshOperation(UnaryIshOperation that) {
        assert (is UnaryIshOperation ret = super.transformUnaryIshOperation(that));
        return ret;
    }
    shared actual default UnaryOperation transformUnaryOperation(UnaryOperation that) {
        assert (is UnaryOperation ret = super.transformUnaryOperation(that));
        return ret;
    }
    shared actual default UnaryTypeOperation transformUnaryTypeOperation(UnaryTypeOperation that) {
        assert (is UnaryTypeOperation ret = super.transformUnaryTypeOperation(that));
        return ret;
    }
    shared actual default UnionAssignmentOperation transformUnionAssignmentOperation(UnionAssignmentOperation that)
            => that.copy(transformThenElseExpression(that.leftOperand), transformAssigningExpression(that.rightOperand));
    shared actual default UnionOperation transformUnionOperation(UnionOperation that)
            => that.copy(transformUnioningExpression(that.leftOperand), transformIntersectingExpression(that.rightOperand));
    shared actual default UnionType transformUnionType(UnionType that) {
        IntersectionType|PrimaryType transformIntersectionTypeOrPrimaryType(IntersectionType|PrimaryType that) {
            switch (that)
            case (is IntersectionType) { return transformIntersectionType(that); }
            case (is PrimaryType) { return transformPrimaryType(that); }
        }
        return that.copy([for (child in that.children) transformIntersectionTypeOrPrimaryType(child)]);
    }
    shared actual default UnionableType transformUnionableType(UnionableType that) {
        assert (is UnionableType ret = super.transformUnionableType(that));
        return ret;
    }
    shared actual default UnspecifiedVariable transformUnspecifiedVariable(UnspecifiedVariable that)
            => that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.type, transformTypeOrValueModifier));
    shared actual default ValueArgument transformValueArgument(ValueArgument that) {
        AnySpecifier|Block transformAnySpecifierOrBlock(AnySpecifier|Block that) {
            switch (that)
            case (is AnySpecifier) { return transformAnySpecifier(that); }
            case (is Block) { return transformBlock(that); }
        }
        return that.copy(transformLIdentifier(that.name), transformTypeOrValueModifierOrDynamicModifier(that.type), transformAnySpecifierOrBlock(that.definition));
    }
    shared actual default ValueConstructorDefinition transformValueConstructorDefinition(ValueConstructorDefinition that)
            => that.copy(transformLIdentifier(that.name), transformBlock(that.block), nullsafeInvoke(that.extendedType, transformExtendedType), transformAnnotations(that.annotations));
    shared actual default ValueDec transformValueDec(ValueDec that)
            => that.copy(transformLIdentifier(that.name), transformDecQualifier(that.qualifier));
    shared actual default ValueDeclaration transformValueDeclaration(ValueDeclaration that) {
        Type|VariadicType|DynamicModifier transformTypeOrVariadicTypeOrDynamicModifier(Type|VariadicType|DynamicModifier that) {
            switch (that)
            case (is Type) { return transformType(that); }
            case (is VariadicType) { return transformVariadicType(that); }
            case (is DynamicModifier) { return transformDynamicModifier(that); }
        }
        return that.copy(transformLIdentifier(that.name), transformTypeOrVariadicTypeOrDynamicModifier(that.type), transformAnnotations(that.annotations));
    }
    shared actual default ValueDefinition transformValueDefinition(ValueDefinition that) {
        return that.copy(transformLIdentifier(that.name), transformTypeOrValueModifierOrDynamicModifier(that.type), transformAnySpecifier(that.definition), transformAnnotations(that.annotations));
    }
    shared actual default ValueExpression transformValueExpression(ValueExpression that) {
        assert (is ValueExpression ret = super.transformValueExpression(that));
        return ret;
    }
    shared actual default ValueGetterDefinition transformValueGetterDefinition(ValueGetterDefinition that)
            => that.copy(transformLIdentifier(that.name), transformTypeOrValueModifierOrDynamicModifier(that.type), transformBlock(that.definition), transformAnnotations(that.annotations));
    shared actual default ValueModifier transformValueModifier(ValueModifier that)
            => that.copy();
    shared actual default ValueParameter transformValueParameter(ValueParameter that) {
        Type|DynamicModifier transformTypeOrDynamicModifier(Type|DynamicModifier that) {
            switch (that)
            case (is Type) { return transformType(that); }
            case (is DynamicModifier) { return transformDynamicModifier(that); }
        }
        return that.copy(transformTypeOrDynamicModifier(that.type), transformLIdentifier(that.name), transformAnnotations(that.annotations));
    }
    shared actual default ValueSetterDefinition transformValueSetterDefinition(ValueSetterDefinition that) {
        Block|LazySpecifier transformBlockOrLazySpecifier(Block|LazySpecifier that) {
            switch (that)
            case (is Block) { return transformBlock(that); }
            case (is LazySpecifier) { return transformLazySpecifier(that); }
        }
        return that.copy(transformLIdentifier(that.name), transformBlockOrLazySpecifier(that.definition), transformAnnotations(that.annotations));
    }
    shared actual default ValueSpecification transformValueSpecification(ValueSpecification that)
            => that.copy(transformLIdentifier(that.name), transformSpecifier(that.specifier), nullsafeInvoke(that.qualifier, transformThis));
    shared actual default Variable transformVariable(Variable that) {
        assert (is Variable ret = super.transformVariable(that));
        return ret;
    }
    shared actual default VariablePattern transformVariablePattern(VariablePattern that)
            => that.copy(transformUnspecifiedVariable(that.variable));
    shared actual default VariadicParameter transformVariadicParameter(VariadicParameter that)
            => that.copy(transformVariadicType(that.type), transformLIdentifier(that.name), transformAnnotations(that.annotations));
    shared actual default VariadicType transformVariadicType(VariadicType that)
            => that.copy(transformMainType(that.elementType));
    shared actual default VariadicVariable transformVariadicVariable(VariadicVariable that)
            => that.copy(transformLIdentifier(that.name), nullsafeInvoke(that.type, transformUnionType));
    shared actual default Variance transformVariance(Variance that) {
        assert (is Variance ret = super.transformVariance(that));
        return ret;
    }
    shared actual default VoidModifier transformVoidModifier(VoidModifier that)
            => that.copy();
    shared actual default While transformWhile(While that)
            => that.copy(transformConditions(that.conditions), transformBlock(that.block));
    shared actual default WithinOperation transformWithinOperation(WithinOperation that)
            => that.copy(transformExistsNonemptyExpression(that.operand), transformBound(that.lowerBound), transformBound(that.upperBound));
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
}
