import ceylon.ast.core {
    ...
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAlias=Alias,
        JAddAssignOp=AddAssignOp,
        JAliasLiteral=AliasLiteral,
        JAndAssignOp=AndAssignOp,
        JAndOp=AndOp,
        JAnnotation=Annotation,
        JAnnotationList=AnnotationList,
        JAnonymousAnnotation=AnonymousAnnotation,
        JAnyAttribute=AnyAttribute,
        JAnyClass=AnyClass,
        JAnyMethod=AnyMethod,
        JArgumentList=ArgumentList,
        JArithmeticAssignmentOp=ArithmeticAssignmentOp,
        JArithmeticOp=ArithmeticOp,
        JAssertion=Assertion,
        JAssignmentOp=AssignmentOp,
        JAssignOp=AssignOp,
        JAtom=Atom,
        JAttributeDeclaration=AttributeDeclaration,
        JAttributeGetterDefinition=AttributeGetterDefinition,
        JAttributeSetterDefinition=AttributeSetterDefinition,
        JBaseMemberExpression=BaseMemberExpression,
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression,
        JBaseType=BaseType,
        JBaseTypeExpression=BaseTypeExpression,
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JBitwiseAssignmentOp=BitwiseAssignmentOp,
        JBitwiseOp=BitwiseOp,
        JBlock=Block,
        JBody=Body,
        JBooleanCondition=BooleanCondition,
        JBound=Bound,
        JBreak=Break,
        JCaseClause=CaseClause,
        JCaseItem=CaseItem,
        JCaseTypes=CaseTypes,
        JCatchClause=CatchClause,
        JCatchVariable=CatchVariable,
        JCharacterLiteral=CharLiteral,
        JClassBody=ClassBody,
        JClassDeclaration=ClassDeclaration,
        JClassDefinition=ClassDefinition,
        JClassLiteral=ClassLiteral,
        JClassOrInterface=ClassOrInterface,
        JClassSpecifier=ClassSpecifier,
        JClosedBound=ClosedBound,
        JCompareOp=CompareOp,
        JComparisonOp=ComparisonOp,
        JCompilationUnit=CompilationUnit,
        JComplementAssignOp=ComplementAssignOp,
        JComplementOp=ComplementOp,
        JComprehension=Comprehension,
        JComprehensionClause=ComprehensionClause,
        JCondition=Condition,
        JConditionList=ConditionList,
        JContinue=Continue,
        JControlStatement=ControlStatement,
        JDeclaration=Declaration,
        JDecrementOp=DecrementOp,
        JDefaultedType=DefaultedType,
        JDefaultOp=DefaultOp,
        JDefaultTypeArgument=DefaultTypeArgument,
        JDifferenceOp=DifferenceOp,
        JDirective=Directive,
        JDivideAssignOp=DivideAssignOp,
        JDynamic=Dynamic,
        JDynamicClause=DynamicClause,
        JDynamicModifier=DynamicModifier,
        JDynamicStatement=DynamicStatement,
        JElement=Element,
        JElementOrRange=ElementOrRange,
        JElementRange=ElementRange,
        JElseClause=ElseClause,
        JEntryOp=EntryOp,
        JEntryType=EntryType,
        JEqualOp=EqualOp,
        JEqualityOp=EqualityOp,
        JExecutableStatement=ExecutableStatement,
        JExists=Exists,
        JExistsCondition=ExistsCondition,
        JExistsOrNonemptyCondition=ExistsOrNonemptyCondition,
        JExpression=Expression,
        JExpressionComprehensionClause=ExpressionComprehensionClause,
        JExpressionList=ExpressionList,
        JExpressionStatement=ExpressionStatement,
        JExtendedType=ExtendedType,
        JFinallyClause=FinallyClause,
        JFloatLiteral=FloatLiteral,
        JForClause=ForClause,
        JForComprehensionClause=ForComprehensionClause,
        JForIterator=ForIterator,
        JForStatement=ForStatement,
        JFunctionArgument=FunctionArgument,
        JFunctionLiteral=FunctionLiteral,
        JFunctionModifier=FunctionModifier,
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JFunctionType=FunctionType,
        JGroupedType=GroupedType,
        JIdenticalOp=IdenticalOp,
        JIdentifier=Identifier,
        JIfClause=IfClause,
        JIfComprehensionClause=IfComprehensionClause,
        JIfStatement=IfStatement,
        JImport=Import,
        JImportList=ImportList,
        JImportMember=ImportMember,
        JImportMemberOrType=ImportMemberOrType,
        JImportMemberOrTypeList=ImportMemberOrTypeList,
        JImportModule=ImportModule,
        JImportModuleList=ImportModuleList,
        JImportPath=ImportPath,
        JImportWildcard=ImportWildcard,
        JInOp=InOp,
        JIncrementOp=IncrementOp,
        JIndexExpression=IndexExpression,
        JInferredTypeArguments=InferredTypeArguments,
        JInitialComprehensionClause=InitialComprehensionClause,
        JInitializerParameter=InitializerParameter,
        JIntegerLiteral=NaturalLiteral,
        JInterfaceBody=InterfaceBody,
        JInterfaceLiteral=InterfaceLiteral,
        JIntersectAssignOp=IntersectAssignOp,
        JIntersectionOp=IntersectionOp,
        JIntersectionType=IntersectionType,
        JInvocationExpression=InvocationExpression,
        JIsCase=IsCase,
        JIsCondition=IsCondition,
        JIsOp=IsOp,
        JIterableType=IterableType,
        JKeyValueIterator=KeyValueIterator,
        JLargeAsOp=LargeAsOp,
        JLargerOp=LargerOp,
        JLazySpecifierExpression=LazySpecifierExpression,
        JListedArgument=ListedArgument,
        JLocalModifier=LocalModifier,
        JLogicalAssignmentOp=LogicalAssignmentOp,
        JLogicalOp=LogicalOp,
        JLiteral=Literal,
        JMatchCase=MatchCase,
        JMemberLiteral=MemberLiteral,
        JMemberOp=MemberOp,
        JMemberOperator=MemberOperator,
        JMetaLiteral=MetaLiteral,
        JMethodDeclaration=MethodDeclaration,
        JMethodDefinition=MethodDefinition,
        JModuleDescriptor=ModuleDescriptor,
        JModuleLiteral=ModuleLiteral,
        JMultiplyAssignOp=MultiplyAssignOp,
        JNamedArgument=NamedArgument,
        JNamedArgumentList=NamedArgumentList,
        JNegativeOp=NegativeOp,
        JNonempty=Nonempty,
        JNonemptyCondition=NonemptyCondition,
        JNotEqualOp=NotEqualOp,
        JNotOp=NotOp,
        JObjectDefinition=ObjectDefinition,
        JOfOp=OfOp,
        JOpenBound=OpenBound,
        JOperatorExpression=OperatorExpression,
        JOptionalType=OptionalType,
        JOrAssignOp=OrAssignOp,
        JOrOp=OrOp,
        JOuter=Outer,
        JPackage=Package,
        JPackageDescriptor=PackageDescriptor,
        JPackageLiteral=PackageLiteral,
        JParameter=Parameter,
        JParameterList=ParameterList,
        JPositionalArgumentList=PositionalArgumentList,
        JPositiveOp=PositiveOp,
        JPostfixDecrementOp=PostfixDecrementOp,
        JPostfixIncrementOp=PostfixIncrementOp,
        JPostfixOperatorExpression=PostfixOperatorExpression,
        JPowerOp=PowerOp,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPrimary=Primary,
        JProductOp=ProductOp,
        JQualifiedMemberExpression=QualifiedMemberExpression,
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression,
        JQualifiedTypeExpression=QualifiedTypeExpression,
        JQualifiedType=QualifiedType,
        JQuotedLiteral=QuotedLiteral,
        JQuotientOp=QuotientOp,
        JRangeOp=RangeOp,
        JRemainderAssignOp=RemainderAssignOp,
        JRemainderOp=RemainderOp,
        JResource=Resource,
        JResourceList=ResourceList,
        JReturn=Return,
        JSafeMemberOp=SafeMemberOp,
        JSatisfiedTypes=SatisfiedTypes,
        JScaleOp=ScaleOp,
        JSegmentOp=SegmentOp,
        JSelfExpression=SelfExpression,
        JSequencedArgument=SequencedArgument,
        JSequencedType=SequencedType,
        JSequenceEnumeration=SequenceEnumeration,
        JSequenceType=SequenceType,
        JSimpleType=SimpleType,
        JSmallAsOp=SmallAsOp,
        JSmallerOp=SmallerOp,
        JSpecifiedArgument=SpecifiedArgument,
        JSpecifierExpression=SpecifierExpression,
        JSpecifierStatement=SpecifierStatement,
        JSpreadArgument=SpreadArgument,
        JSpreadOp=SpreadOp,
        JStatement=Statement,
        JStaticType=StaticType,
        JStringLiteral=StringLiteral,
        JStringTemplate=StringTemplate,
        JSubtractAssignOp=SubtractAssignOp,
        JSumOp=SumOp,
        JSuper=Super,
        JSuperType=SuperType,
        JSwitchCaseList=SwitchCaseList,
        JSwitchClause=SwitchClause,
        JSwitchStatement=SwitchStatement,
        JSyntheticVariable=SyntheticVariable,
        JTerm=Term,
        JThenOp=ThenOp,
        JThis=This,
        JThrow=Throw,
        JTryCatchStatement=TryCatchStatement,
        JTryClause=TryClause,
        JTuple=Tuple,
        JTupleType=TupleType,
        JTypeArgumentList=TypeArgumentList,
        JTypeConstraint=TypeConstraint,
        JTypeConstriantList=TypeConstraintList,
        JTypeParameterDeclaration=TypeParameterDeclaration,
        JTypeParameterList=TypeParameterList,
        JTypeSpecifier=TypeSpecifier,
        JTypedDeclaration=TypedDeclaration,
        JTypeLiteral=TypeLiteral,
        JTypeOperatorExpression=TypeOperatorExpression,
        JTypeParameterLiteral=TypeParameterLiteral,
        JTypeVariance=TypeVariance,
        JType=Type,
        JTypeDeclaration=TypeDeclaration,
        JUnaryOperatorExpression=UnaryOperatorExpression,
        JUnionAssignOp=UnionAssignOp,
        JUnionOp=UnionOp,
        JUnionType=UnionType,
        JValueLiteral=ValueLiteral,
        JValueIterator=ValueIterator,
        JValueModifier=ValueModifier,
        JValueParameterDeclaration=ValueParameterDeclaration,
        JVariable=Variable,
        JVoidModifier=VoidModifier,
        JWhileClause=WhileClause,
        JWhileStatement=WhileStatement,
        JWithinOp=WithinOp
    },
    CustomTree {
        JExtendedTypeExpression=ExtendedTypeExpression
    },
    JVisitorAdaptor=VisitorAdaptor
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        add_specify=\iADD_SPECIFY,
        aidentifier=\iAIDENTIFIER,
        aliasType=\iALIAS,
        assignType=\iASSIGN,
        astring_literal=\iASTRING_LITERAL,
        averbatim_string=\iAVERBATIM_STRING,
        and_op=\iAND_OP,
        and_specify=\iAND_SPECIFY,
        assertType=\iASSERT,
        backtick=\iBACKTICK,
        breakType=\iBREAK,
        case_clause=\iCASE_CLAUSE,
        case_types=\iCASE_TYPES,
        catch_clause=\iCATCH_CLAUSE,
        character_literal=\iCHAR_LITERAL,
        class_definition=\iCLASS_DEFINITION,
        comma=\iCOMMA,
        compare_op=\iCOMPARE_OP,
        complement_op=\iCOMPLEMENT_OP,
        complement_specify=\iCOMPLEMENT_SPECIFY,
        compute=\iCOMPUTE,
        continueType=\iCONTINUE,
        decrement_op=\iDECREMENT_OP,
        difference_op=\iDIFFERENCE_OP,
        divide_specify=\iDIVIDE_SPECIFY,
        dynamicType=\iDYNAMIC,
        ellipsis=\iELLIPSIS,
        else_clause=\iELSE_CLAUSE,
        entry_op=\iENTRY_OP,
        eof=\iEOF,
        equal_op=\iEQUAL_OP,
        exists_op=\iEXISTS,
        extendsType=\iEXTENDS,
        finally_clause=\iFINALLY_CLAUSE,
        float_literal=\iFLOAT_LITERAL,
        for_clause=\iFOR_CLAUSE,
        function_modifier=\iFUNCTION_MODIFIER,
        identical_op=\iIDENTICAL_OP,
        if_clause=\iIF_CLAUSE,
        importType=\iIMPORT,
        in_op=\iIN_OP,
        increment_op=\iINCREMENT_OP,
        integer_literal=\iNATURAL_LITERAL,
        interface_definition=\iINTERFACE_DEFINITION,
        intersection_op=\iINTERSECTION_OP,
        intersect_specify=\iINTERSECT_SPECIFY,
        is_op=\iIS_OP,
        large_as_op=\iLARGE_AS_OP,
        larger_op=\iLARGER_OP,
        lbrace=\iLBRACE,
        lbracket=\iLBRACKET,
        lidentifier=\iLIDENTIFIER,
        lparen=\iLPAREN,
        member_op=\iMEMBER_OP,
        moduleType=\iMODULE,
        multiply_specify=\iMULTIPLY_SPECIFY,
        nonempty_op=\iNONEMPTY,
        not_equal_op=\iNOT_EQUAL_OP,
        not_op=\iNOT_OP,
        object_definition=\iOBJECT_DEFINITION,
        optionalType=\iOPTIONAL,
        or_op=\iOR_OP,
        or_specify=\iOR_SPECIFY,
        outType=\iOUT,
        outerType=\iOUTER,
        packageType=\iPACKAGE,
        pidentifier=\iPIDENTIFIER,
        power_op=\iPOWER_OP,
        product_op=\iPRODUCT_OP,
        quotient_op=\iQUOTIENT_OP,
        range_op=\iRANGE_OP,
        rbrace=\iRBRACE,
        rbracket=\iRBRACKET,
        remainder_specify=\iREMAINDER_SPECIFY,
        remainder_op=\iREMAINDER_OP,
        returnType=\iRETURN,
        rparen=\iRPAREN,
        safe_member_op=\iSAFE_MEMBER_OP,
        satisfiesType=\iSATISFIES,
        scale_op=\iSCALE_OP,
        segment_op=\iSEGMENT_OP,
        semicolon=\iSEMICOLON,
        small_as_op=\iSMALL_AS_OP,
        smaller_op=\iSMALLER_OP,
        specify=\iSPECIFY,
        spread_op=\iSPREAD_OP,
        string_end=\iSTRING_END,
        string_literal=\iSTRING_LITERAL,
        string_mid=\iSTRING_MID,
        string_start=\iSTRING_START,
        subtract_specify=\iSUBTRACT_SPECIFY,
        sum_op=\iSUM_OP,
        superType=\iSUPER,
        switch_clause=\iSWITCH_CLAUSE,
        then_clause=\iTHEN_CLAUSE,
        thisType=\iTHIS,
        throwType=\iTHROW,
        try_clause=\iTRY_CLAUSE,
        type_constraint=\iTYPE_CONSTRAINT,
        uidentifier=\iUIDENTIFIER,
        union_op=\iUNION_OP,
        union_specify=\iUNION_SPECIFY,
        value_modifier=\iVALUE_MODIFIER,
        verbatim_string_literal=\iVERBATIM_STRING,
        void_modifier=\iVOID_MODIFIER,
        while_clause=\iWHILE_CLAUSE
    }
}
import ceylon.interop.java {
    CeylonIterable
}
import org.antlr.runtime {
    CommonToken
}

shared class RedHatTransformer(TokenFactory tokens) satisfies NarrowingTransformer<JNode> {
    
    value isLowerBoundKey = ScopedKey<Boolean>(`class RedHatTransformer`, "isLowerBound");
    
    shared actual JAddAssignOp transformAddAssignmentOperation(AddAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JAddAssignOp ret = JAddAssignOp(tokens.token(that.operator, add_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    "Transforms a [[LIdentifier]] to a RedHat AST [[Identifier|JIdentifier]]
     with token type `AIDENTIFIER` (“annotation identifier”)."
    shared JIdentifier transformAIdentifier(LIdentifier that) {
        value ret = transformIdentifier(that);
        ret.mainToken.type = aidentifier;
        return ret;
    }
    
    shared actual JAliasLiteral transformAliasDec(AliasDec that) {
        JAliasLiteral ret = JAliasLiteral(null);
        ret.endToken = tokens.token(that.keyword, aliasType);
        if (exists qualifier = that.qualifier) {
            "Qualifier can’t yet be an object!"
            // https://github.com/ceylon/ceylon-spec/issues/1076
            assert (is [UIdentifier+] components = qualifier.components);
            assert (nonempty newComponents = concatenate(components, [that.name]));
            assert (is JStaticType type = helpTransformDecQualifier(DecQualifier(newComponents)));
            ret.type = type;
        } else {
            assert (is JStaticType type = helpTransformDecQualifier(DecQualifier([that.name])));
            ret.type = type;
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JAndAssignOp transformAndAssignmentOperation(AndAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JAndAssignOp ret = JAndAssignOp(tokens.token(that.operator, and_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JAndOp transformAndOperation(AndOperation that) {
        JTerm left = transformPrecedence14Expression(that.leftOperand);
        JAndOp ret = JAndOp(tokens.token(that.operator, and_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence14Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JAnnotation transformAnnotation(Annotation that) {
        JAnnotation ret = JAnnotation(null);
        JBaseMemberExpression bme = JBaseMemberExpression(null);
        bme.identifier = transformAIdentifier(that.name);
        bme.typeArguments = JInferredTypeArguments(null);
        ret.primary = bme;
        value args = that.arguments;
        switch (args)
        case (is PositionalArguments) { ret.positionalArgumentList = transformPositionalArguments(args); }
        case (is NamedArguments) { ret.namedArgumentList = transformNamedArguments(args); }
        case (null) { ret.positionalArgumentList = JPositionalArgumentList(null); }
        return ret;
    }
    
    shared actual JAnnotationList transformAnnotations(Annotations that) {
        JAnnotationList ret = JAnnotationList(null);
        if (exists anonymousAnnotation = that.anonymousAnnotation) {
            JAnonymousAnnotation aa = JAnonymousAnnotation(null);
            value stringLiteral = transformStringLiteral(anonymousAnnotation);
            if (stringLiteral.mainToken.type == verbatim_string_literal) {
                stringLiteral.mainToken.type = averbatim_string;
            } else {
                stringLiteral.mainToken.type = astring_literal;
            }
            aa.stringLiteral = stringLiteral;
            ret.anonymousAnnotation = aa;
        }
        for (annotation in that.annotations) {
            value anno = transformAnnotation(annotation);
            object aliteralVisitor extends JVisitorAdaptor() {
                shared actual void visitStringLiteral(JStringLiteral that) {
                    if (that.mainToken.type == verbatim_string_literal) {
                        that.mainToken.type = averbatim_string;
                    } else {
                        that.mainToken.type = astring_literal;
                    }
                }
            }
            anno.visit(aliteralVisitor);
            ret.addAnnotation(anno);
        }
        return ret;
    }
    
    shared actual JSpecifiedArgument transformAnonymousArgument(AnonymousArgument that) {
        JSpecifiedArgument ret = JSpecifiedArgument(null);
        value specifierExpression = JSpecifierExpression(null);
        specifierExpression.expression = wrapTerm(transformExpression(that.expression));
        ret.specifierExpression = specifierExpression;
        return ret;
    }
    
    shared actual JAnyClass transformAnyClass(AnyClass that) {
        assert (is JAnyClass ret = super.transformAnyClass(that));
        return ret;
    }
    
    shared actual JCompilationUnit transformAnyCompilationUnit(AnyCompilationUnit that) {
        assert (is JCompilationUnit ret = super.transformAnyCompilationUnit(that));
        return ret;
    }
    
    shared actual JAnyMethod transformAnyFunction(AnyFunction that) {
        assert (is JAnyMethod ret = super.transformAnyFunction(that));
        return ret;
    }
    
    shared actual JMemberOperator transformAnyMemberOperator(AnyMemberOperator that) {
        assert (is JMemberOperator ret = super.transformAnyMemberOperator(that));
        return ret;
    }
    
    shared actual JSpecifierExpression transformAnySpecifier(AnySpecifier that) {
        assert (is JSpecifierExpression ret = super.transformAnySpecifier(that));
        return ret;
    }
    
    shared actual JAnyAttribute transformAnyValue(AnyValue that) {
        assert (is JAnyAttribute ret = super.transformAnyValue(that));
        return ret;
    }
    
    shared actual JSequencedArgument transformArgumentList(ArgumentList that) {
        JSequencedArgument ret = JSequencedArgument(null);
        if (nonempty arguments = that.listedArguments) {
            JListedArgument transformListedArgument(Expression that) {
                JListedArgument ret = JListedArgument(null);
                ret.expression = wrapTerm(transformExpression(that));
                return ret;
            }
            ret.positionalArguments.add(transformListedArgument(arguments.first));
            for (argument in arguments.rest) {
                ret.endToken = tokens.token(",", comma);
                ret.positionalArguments.add(transformListedArgument(argument));
            }
            if (exists sequenceArgument = that.sequenceArgument) {
                ret.endToken = tokens.token(",", comma);
                switch (sequenceArgument)
                case (is SpreadArgument) {
                    ret.positionalArguments.add(transformSpreadArgument(sequenceArgument));
                }
                case (is Comprehension) {
                    ret.positionalArguments.add(transformComprehension(sequenceArgument));
                }
            }
        } else {
            if (exists sequenceArgument = that.sequenceArgument) {
                switch (sequenceArgument)
                case (is SpreadArgument) {
                    ret.positionalArguments.add(transformSpreadArgument(sequenceArgument));
                }
                case (is Comprehension) {
                    ret.positionalArguments.add(transformComprehension(sequenceArgument));
                }
            }
        }
        return ret;
    }
    
    shared actual JArgumentList transformArguments(Arguments that) {
        assert (is JArgumentList ret = super.transformArguments(that));
        return ret;
    }
    
    shared actual JArithmeticAssignmentOp transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) {
        assert (is JArithmeticAssignmentOp ret = super.transformArithmeticAssignmentOperation(that));
        return ret;
    }
    
    shared actual JArithmeticOp transformArithmeticOperation(ArithmeticOperation that) {
        assert (is JArithmeticOp ret = super.transformArithmeticOperation(that));
        return ret;
    }
    
    shared actual JAssertion transformAssertion(Assertion that) {
        value annotationList = transformAnnotations(that.annotations);
        JAssertion ret = JAssertion(tokens.token("assert", assertType));
        ret.annotationList = annotationList;
        ret.conditionList = transformConditions(that.conditions);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JAssignOp transformAssignOperation(AssignOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JAssignOp ret = JAssignOp(tokens.token(that.operator, specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JAssignmentOp transformAssignmentOperation(AssignmentOperation that) {
        assert (is JAssignmentOp ret = super.transformAssignmentOperation(that));
        return ret;
    }
    
    shared actual JExpressionStatement transformAssignmentStatement(AssignmentStatement that) {
        JExpressionStatement ret = JExpressionStatement(null);
        ret.expression = wrapTerm(transformAssignmentOperation(that.expression));
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JAtom transformAtom(Atom that) {
        assert (is JAtom ret = super.transformAtom(that));
        return ret;
    }
    
    shared actual JBaseMemberOrTypeExpression transformBaseExpression(BaseExpression that) {
        JBaseMemberOrTypeExpression ret;
        value name = that.nameAndArgs.name;
        switch (name)
        case (is LIdentifier) { ret = JBaseMemberExpression(null); }
        case (is UIdentifier) { ret = JBaseTypeExpression(null); }
        ret.identifier = transformIdentifier(name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArguments = transformTypeArguments(typeArguments);
        } else {
            ret.typeArguments = JInferredTypeArguments(null);
        }
        return ret;
    }
    
    shared actual JMemberLiteral transformBaseMeta(BaseMeta that) {
        JMemberLiteral ret = JMemberLiteral(tokens.token("`", backtick));
        ret.identifier = transformIdentifier(that.nameAndArgs.name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArgumentList = transformTypeArguments(typeArguments);
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JBaseType transformBaseType(BaseType that) {
        JBaseType ret = JBaseType(null);
        ret.identifier = transformUIdentifier(that.nameAndArgs.name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArgumentList = transformTypeArguments(typeArguments);
        }
        return ret;
    }
    
    shared actual JBinaryOperatorExpression transformBinaryOperation(BinaryOperation that) {
        assert (is JBinaryOperatorExpression ret = super.transformBinaryOperation(that));
        return ret;
    }
    
    shared actual JBlock transformBlock(Block that) {
        JBlock ret = JBlock(tokens.token("{", lbrace));
        for (element in that.content) {
            assert (is JStatement jStatement = element.transform(this));
            ret.addStatement(jStatement);
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JBody transformBody(Body that) {
        assert (is JBody ret = super.transformBody(that));
        return ret;
    }
    
    shared actual JBooleanCondition transformBooleanCondition(BooleanCondition that) {
        JBooleanCondition ret = JBooleanCondition(null);
        ret.expression = wrapTerm(transformExpression(that.condition));
        return ret;
    }
    
    shared actual JBound transformBound(Bound that) {
        assert (is JBound ret = super.transformBound(that));
        return ret;
    }
    
    shared actual JBreak transformBreak(Break that) {
        JBreak ret = JBreak(tokens.token(that.text, breakType));
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JFunctionalParameterDeclaration transformCallableParameter(CallableParameter that) {
        JFunctionalParameterDeclaration ret = JFunctionalParameterDeclaration(null);
        JMethodDeclaration dec = JMethodDeclaration(null);
        dec.annotationList = transformAnnotations(that.annotations);
        value type = that.type;
        switch (type)
        case (is Type) { dec.type = transformType(type); }
        case (is VoidModifier) { dec.type = transformVoidModifier(type); }
        dec.identifier = transformLIdentifier(that.name);
        for (parameters in that.parameterLists) {
            dec.addParameterList(transformParameters(parameters));
        }
        ret.typedDeclaration = dec;
        return ret;
    }
    
    shared actual JFunctionType transformCallableType(CallableType that) {
        JStaticType returnType = transformPrimaryType(that.returnType);
        JFunctionType ret = JFunctionType(tokens.token("(", lparen));
        ret.returnType = returnType;
        for (elementType in that.argumentTypes.elements) {
            switch (elementType)
            case (is Type) { ret.addArgumentType(transformType(elementType)); }
            case (is DefaultedType) { ret.addArgumentType(transformDefaultedType(elementType)); }
        }
        if (exists var = that.argumentTypes.variadic) {
            ret.addArgumentType(transformVariadicType(var));
        }
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JCaseClause transformCaseClause(CaseClause that) {
        JCaseClause ret = JCaseClause(tokens.token("case", case_clause));
        tokens.token("(", lparen);
        ret.caseItem = transformCaseItem(that.caseItem);
        ret.caseItem.endToken = tokens.token(")", rparen);
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JCaseItem transformCaseItem(CaseItem that) {
        assert (is JCaseItem ret = super.transformCaseItem(that));
        return ret;
    }
    
    shared actual JCaseTypes transformCaseTypes(CaseTypes that) {
        JCaseTypes ret = JCaseTypes(tokens.token("of", case_types));
        void addCaseType(PrimaryType|MemberName caseType) {
            switch (caseType)
            case (is PrimaryType) { ret.addType(transformPrimaryType(caseType)); }
            case (is MemberName) {
                JBaseMemberExpression bme = JBaseMemberExpression(null);
                bme.identifier = transformLIdentifier(caseType);
                bme.typeArguments = JInferredTypeArguments(null);
                ret.addBaseMemberExpression(bme);
            }
        }
        addCaseType(that.caseTypes.first);
        for (caseType in that.caseTypes.rest) {
            ret.endToken = tokens.token("|", union_op);
            addCaseType(caseType);
            ret.endToken = null;
        }
        return ret;
    }
    
    shared actual JCatchClause transformCatchClause(CatchClause that) {
        JCatchClause ret = JCatchClause(tokens.token("catch", catch_clause));
        value catchVariable = JCatchVariable(tokens.token("(", lparen));
        value variable = that.variable;
        value var = JVariable(null);
        value type = variable.type;
        switch (type)
        case (is Type) { var.type = transformType(type); }
        case (is ValueModifier) { var.type = transformValueModifier(type); }
        case (null) { var.type = JValueModifier(null); }
        var.identifier = transformLIdentifier(variable.name);
        catchVariable.variable = var;
        catchVariable.endToken = tokens.token(")", rparen);
        ret.catchVariable = catchVariable;
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JCharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => JCharacterLiteral(tokens.token("'``that.text``'", character_literal));
    
    shared actual JClassBody transformClassBody(ClassBody that) {
        JClassBody ret = JClassBody(tokens.token("{", lbrace));
        for (element in that.content) {
            assert (is JStatement jStatement = element.transform(this));
            ret.addStatement(jStatement);
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JClassDeclaration transformClassAlias(ClassAlias that) {
        value annotationList = transformAnnotations(that.annotations);
        JClassDeclaration ret = JClassDeclaration(tokens.token("class", class_definition));
        ret.annotationList = annotationList;
        ret.identifier = transformUIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        ret.parameterList = transformParameters(that.parameters);
        if (exists caseTypes = that.caseTypes) {
            ret.caseTypes = transformCaseTypes(caseTypes);
        }
        if (exists extendedType = that.extendedType) {
            ret.extendedType = transformExtendedType(extendedType);
        }
        if (exists satisfiedTypes = that.satisfiedTypes) {
            ret.satisfiedTypes = transformSatisfiedTypes(satisfiedTypes);
        }
        if (nonempty typeConstraints = that.typeConstraints) {
            value typeConstraintList = JTypeConstriantList(null);
            for (typeConstraint in typeConstraints) {
                typeConstraintList.addTypeConstraint(transformTypeConstraint(typeConstraint));
            }
            ret.typeConstraintList = typeConstraintList;
        }
        ret.classSpecifier = transformClassSpecifier(that.specifier);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JClassLiteral transformClassDec(ClassDec that) {
        JClassLiteral ret = JClassLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token(that.keyword, class_definition);
        value name = that.name;
        switch (name)
        case (is LIdentifier) {
            "Member references can’t be qualified yet!"
            // https://github.com/ceylon/ceylon-spec/issues/1076
            assert (!that.qualifier exists);
            assert (is JBaseMemberExpression bme = helpTransformDecQualifier(DecQualifier([name])));
            ret.objectExpression = bme;
        }
        case (is UIdentifier) {
            if (exists qualifier = that.qualifier) {
                "Qualifier can’t yet be an object!"
                // https://github.com/ceylon/ceylon-spec/issues/1076
                assert (is [UIdentifier+] components = qualifier.components);
                assert (nonempty newComponents = concatenate(components, [name]));
                assert (is JStaticType type = helpTransformDecQualifier(DecQualifier(newComponents)));
                ret.type = type;
            } else {
                assert (is JStaticType type = helpTransformDecQualifier(DecQualifier([name])));
                ret.type = type;
            }
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JClassDefinition transformClassDefinition(ClassDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JClassDefinition ret = JClassDefinition(tokens.token("class", class_definition));
        ret.annotationList = annotationList;
        ret.identifier = transformUIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        ret.parameterList = transformParameters(that.parameters);
        if (exists caseTypes = that.caseTypes) {
            ret.caseTypes = transformCaseTypes(caseTypes);
        }
        if (exists extendedType = that.extendedType) {
            ret.extendedType = transformExtendedType(extendedType);
        }
        if (exists satisfiedTypes = that.satisfiedTypes) {
            ret.satisfiedTypes = transformSatisfiedTypes(satisfiedTypes);
        }
        if (nonempty typeConstraints = that.typeConstraints) {
            value typeConstraintList = JTypeConstriantList(null);
            for (typeConstraint in typeConstraints) {
                typeConstraintList.addTypeConstraint(transformTypeConstraint(typeConstraint));
            }
            ret.typeConstraintList = typeConstraintList;
        }
        ret.classBody = transformClassBody(that.body);
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[ClassInstantiation]];
     this method throws."
    shared actual Nothing transformClassInstantiation(ClassInstantiation that) {
        throw AssertionError("ClassInstantiation has no RedHat AST equivalent!");
    }
    
    shared actual JClassOrInterface transformClassOrInterface(ClassOrInterface that) {
        assert (is JClassOrInterface ret = super.transformClassOrInterface(that));
        return ret;
    }
    
    shared actual JClassSpecifier transformClassSpecifier(ClassSpecifier that) {
        JClassSpecifier ret = JClassSpecifier(tokens.token("=>", compute));
        value tuple = helpTransformClassInstantiation(that.instantiation);
        ret.type = tuple[0];
        ret.invocationExpression = tuple[1];
        return ret;
    }
    
    shared actual JClosedBound transformClosedBound(ClosedBound that) {
        JTerm endpoint;
        CommonToken token;
        if (exists isLowerBound = that.get(isLowerBoundKey), isLowerBound) {
            // lower bound: endpoint, then token
            endpoint = transformPrecedence10Expression(that.endpoint);
            token = tokens.token("<=", small_as_op);
        } else {
            // upper bound: token, then endpoint
            token = tokens.token("<=", small_as_op);
            endpoint = transformPrecedence10Expression(that.endpoint);
        }
        JClosedBound ret = JClosedBound(null); // TODO JClosedBound(token)? the compiler grammar doesn’t do it, but I don’t see why not
        ret.term = endpoint;
        return ret;
    }
    
    shared actual JCompareOp transformCompareOperation(CompareOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JCompareOp ret = JCompareOp(tokens.token(that.operator, compare_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JComparisonOp transformComparisonOperation(ComparisonOperation that) {
        assert (is JComparisonOp ret = super.transformComparisonOperation(that));
        return ret;
    }
    
    shared actual JCompilationUnit transformCompilationUnit(CompilationUnit that) {
        JCompilationUnit ret = JCompilationUnit(null);
        JImportList imports = JImportList(null);
        for (\iimport in that.imports) {
            imports.addImport(transformImport(\iimport));
        }
        ret.importList = imports;
        for (declaration in that.declarations) {
            ret.addDeclaration(transformDeclaration(declaration));
        }
        tokens.token("", eof);
        return ret;
    }
    
    shared actual JComplementAssignOp transformComplementAssignmentOperation(ComplementAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JComplementAssignOp ret = JComplementAssignOp(tokens.token(that.operator, complement_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JComplementOp transformComplementOperation(ComplementOperation that) {
        JTerm left = transformPrecedence5Expression(that.leftOperand);
        JComplementOp ret = JComplementOp(tokens.token(that.operator, complement_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence4Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JComprehension transformComprehension(Comprehension that) {
        JComprehension ret = JComprehension(null);
        ret.initialComprehensionClause = transformInitialComprehensionClause(that.clause);
        return ret;
    }
    
    shared actual JComprehensionClause transformComprehensionClause(ComprehensionClause that) {
        assert (is JComprehensionClause ret = super.transformComprehensionClause(that));
        return ret;
    }
    
    shared actual JCondition transformCondition(Condition that) {
        assert (is JCondition ret = super.transformCondition(that));
        return ret;
    }
    
    shared actual JConditionList transformConditions(Conditions that) {
        JConditionList ret = JConditionList(tokens.token("(", lparen));
        ret.addCondition(transformCondition(that.conditions.first));
        for (condition in that.conditions.rest) {
            ret.endToken = tokens.token(",", comma);
            ret.addCondition(transformCondition(condition));
        }
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JContinue transformContinue(Continue that) {
        JContinue ret = JContinue(tokens.token(that.text, continueType));
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JControlStatement transformControlStructure(ControlStructure that) {
        assert (is JControlStatement ret = super.transformControlStructure(that));
        return ret;
    }
    
    shared actual JMetaLiteral transformDec(Dec that) {
        assert (is JMetaLiteral ret = super.transformDec(that));
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[DecQualifier]];
     this method throws."
    shared actual Nothing transformDecQualifier(DecQualifier that) {
        throw AssertionError("DecQualifier has no RedHat AST equivalent!");
    }
    
    shared actual JDeclaration transformDeclaration(Declaration that) {
        assert (is JDeclaration ret = super.transformDeclaration(that));
        return ret;
    }
    
    shared actual JFunctionalParameterDeclaration transformDefaultedCallableParameter(DefaultedCallableParameter that) {
        JFunctionalParameterDeclaration ret = JFunctionalParameterDeclaration(null);
        assert (is JMethodDeclaration dec = transformCallableParameter(that.parameter).typedDeclaration);
        dec.specifierExpression = transformLazySpecifier(that.specifier);
        ret.typedDeclaration = dec;
        return ret;
    }
    
    shared actual JParameter transformDefaultedParameter(DefaultedParameter that) {
        assert (is JParameter ret = super.transformDefaultedParameter(that));
        return ret;
    }
    
    shared actual JInitializerParameter transformDefaultedParameterReference(DefaultedParameterReference that) {
        JInitializerParameter ret = JInitializerParameter(null);
        ret.identifier = transformLIdentifier(that.parameter.name);
        ret.specifierExpression = transformSpecifier(that.specifier);
        return ret;
    }
    
    shared actual JDefaultedType transformDefaultedType(DefaultedType that) {
        JDefaultedType ret = JDefaultedType(null);
        ret.type = transformType(that.type);
        ret.endToken = tokens.token("=", specify);
        return ret;
    }
    
    shared actual JValueParameterDeclaration transformDefaultedValueParameter(DefaultedValueParameter that) {
        JValueParameterDeclaration ret = JValueParameterDeclaration(null);
        assert (is JAttributeDeclaration dec = transformValueParameter(that.parameter).typedDeclaration);
        dec.specifierOrInitializerExpression = transformSpecifier(that.specifier);
        ret.typedDeclaration = dec;
        return ret;
    }
    
    shared actual JDifferenceOp transformDifferenceOperation(DifferenceOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JDifferenceOp ret = JDifferenceOp(tokens.token(that.operator, difference_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence7Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JDirective transformDirective(Directive that) {
        assert (is JDirective ret = super.transformDirective(that));
        return ret;
    }
    
    shared actual JDivideAssignOp transformDivideAssignmentOperation(DivideAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JDivideAssignOp ret = JDivideAssignOp(tokens.token(that.operator, divide_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JDynamicStatement transformDynamicBlock(DynamicBlock that) {
        JDynamicStatement ret = JDynamicStatement(null);
        JDynamicClause clause = JDynamicClause(tokens.token("dynamic", dynamicType));
        clause.block = transformBlock(that.block);
        ret.dynamicClause = clause;
        return ret;
    }
    
    shared actual JDynamicModifier transformDynamicModifier(DynamicModifier that) {
        JDynamicModifier ret = JDynamicModifier(tokens.token("dynamic", dynamicType));
        return ret;
    }
    
    shared actual JDynamic transformDynamicValue(DynamicValue that) {
        JDynamic ret = JDynamic(tokens.token("value", value_modifier));
        ret.namedArgumentList = transformNamedArguments(that.content);
        return ret;
    }
    
    shared actual JIndexExpression transformElementOrSubrangeExpression(ElementOrSubrangeExpression that) {
        value jPrimary = transformPrimary(that.primary);
        JIndexExpression ret = JIndexExpression(tokens.token("[", lbracket));
        ret.primary = jPrimary;
        ret.elementOrRange = transformSubscript(that.subscript);
        ret.endToken = tokens.token("]", rbracket);
        return ret;
    }
    
    shared actual JElseClause transformElseCaseClause(ElseCaseClause that) {
        JElseClause ret = JElseClause(tokens.token("else", else_clause));
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JElseClause transformElseClause(ElseClause that) {
        JElseClause ret = JElseClause(tokens.token("else", else_clause));
        value child = that.child;
        switch (child)
        case (is Block) { ret.block = transformBlock(child); }
        case (is IfElse) {
            // The RedHat AST doesn’t know ‘else if’;
            // the parser emulates it using a one-statement block (without tokens),
            // and we emulate the parser.
            value block = JBlock(null);
            block.addStatement(transformIfElse(child));
            ret.block = block;
        }
        return ret;
    }
    
    shared actual JDefaultOp transformElseOperation(ElseOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JDefaultOp ret = JDefaultOp(tokens.token(that.operator, else_clause));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence15Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JEntryOp transformEntryOperation(EntryOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JEntryOp ret = JEntryOp(tokens.token(that.operator, entry_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence8Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JEntryType transformEntryType(EntryType that) {
        JEntryType ret = JEntryType(null);
        ret.keyType = transformMainType(that.key);
        ret.endToken = tokens.token("->", entry_op);
        ret.valueType = transformMainType(that.item);
        return ret;
    }
    
    shared actual JEqualOp transformEqualOperation(EqualOperation that) {
        JTerm left = transformPrecedence11Expression(that.leftOperand);
        JEqualOp ret = JEqualOp(tokens.token(that.operator, equal_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence11Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JEqualityOp|JIdenticalOp transformEqualityOperation(EqualityOperation that) {
        assert (is JEqualityOp|JIdenticalOp ret = super.transformEqualityOperation(that));
        return ret;
    }
    
    shared actual JExistsCondition transformExistsCondition(ExistsCondition that) {
        JExistsCondition ret = JExistsCondition(tokens.token("exists", exists_op));
        return helpTransformExistsOrNonemptyCondition(ret, that.variable);
    }
    
    shared actual JExists transformExistsOperation(ExistsOperation that) {
        JTerm term = transformPrecedence9Expression(that.operand);
        JExists ret = JExists(tokens.token(that.operator, exists_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JExistsOrNonemptyCondition transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) {
        assert (is JExistsOrNonemptyCondition ret = super.transformExistsOrNonemptyCondition(that));
        return ret;
    }
    
    shared actual JPowerOp transformExponentiationOperation(ExponentiationOperation that) {
        value left = transformPrecedence1Expression(that.leftOperand);
        JPowerOp ret = JPowerOp(tokens.token(that.operator, power_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence2Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JTerm transformExpression(Expression that) {
        assert (is JTerm ret = super.transformExpression(that));
        return ret;
    }
    
    shared actual JExpressionComprehensionClause transformExpressionComprehensionClause(ExpressionComprehensionClause that) {
        JExpressionComprehensionClause ret = JExpressionComprehensionClause(null);
        ret.expression = wrapTerm(transformExpression(that.expression));
        return ret;
    }
    
    shared actual JTerm transformExpressionIsh(ExpressionIsh that) {
        assert (is JTerm ret = super.transformExpressionIsh(that));
        return ret;
    }
    
    shared actual JExpressionStatement transformExpressionStatement(ExpressionStatement that) {
        assert (is JExpressionStatement ret = super.transformExpressionStatement(that));
        return ret;
    }
    
    shared actual JExtendedType transformExtendedType(ExtendedType that) {
        JExtendedType ret = JExtendedType(tokens.token("extends", extendsType));
        value tuple = helpTransformClassInstantiation(that.instantiation);
        ret.type = tuple[0];
        ret.invocationExpression = tuple[1];
        return ret;
    }
    
    shared actual JElseClause transformFailClause(FailClause that) {
        JElseClause ret = JElseClause(tokens.token("else", else_clause));
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JFinallyClause transformFinallyClause(FinallyClause that) {
        JFinallyClause ret = JFinallyClause(tokens.token("finally", finally_clause));
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JFloatLiteral transformFloatLiteral(FloatLiteral that)
            => JFloatLiteral(tokens.token(that.text, float_literal));
    
    shared actual JForClause transformForClause(ForClause that) {
        JForClause ret = JForClause(tokens.token("for", for_clause));
        ret.forIterator = transformForIterator(that.iterator);
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JForComprehensionClause transformForComprehensionClause(ForComprehensionClause that) {
        JForComprehensionClause ret = JForComprehensionClause(tokens.token("for", for_clause));
        ret.forIterator = transformForIterator(that.iterator);
        ret.comprehensionClause = transformComprehensionClause(that.clause);
        return ret;
    }
    
    shared actual JForStatement transformForFail(ForFail that) {
        JForStatement ret = JForStatement(null);
        ret.forClause = transformForClause(that.forClause);
        if (exists failClause = that.failClause) {
            ret.elseClause = transformFailClause(failClause);
        }
        return ret;
    }
    
    shared actual JForIterator transformForIterator(ForIterator that) {
        assert (is JForIterator ret = super.transformForIterator(that));
        return ret;
    }
    
    shared actual JImportPath transformFullPackageName(FullPackageName that) {
        JImportPath ret = JImportPath(null);
        ret.addIdentifier(transformPIdentifier(that.components.first));
        for (component in that.components.rest) {
            ret.endToken = tokens.token(".", member_op);
            ret.addIdentifier(transformPIdentifier(component));
        }
        return ret;
    }
    
    shared actual JFunctionLiteral transformFunctionDec(FunctionDec that) {
        JFunctionLiteral ret = JFunctionLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token(that.keyword, function_modifier);
        helpTransformMemberDec(that, ret);
        return ret;
    }
    
    shared actual JMethodDeclaration transformFunctionDeclaration(FunctionDeclaration that) {
        value annotationList = transformAnnotations(that.annotations);
        JStaticType|JVoidModifier|JDynamicModifier jType;
        JMethodDeclaration ret;
        value type = that.type;
        switch (type)
        case (is Type) {
            jType = transformType(type);
            ret = JMethodDeclaration(null);
        }
        case (is VoidModifier) {
            jType = transformVoidModifier(type);
            ret = JMethodDeclaration(jType.mainToken);
        }
        case (is DynamicModifier) {
            jType = transformDynamicModifier(type);
            ret = JMethodDeclaration(null);
        }
        ret.annotationList = annotationList;
        ret.type = jType;
        ret.identifier = transformLIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        for (parameters in that.parameterLists) {
            ret.addParameterList(transformParameters(parameters));
        }
        if (nonempty typeConstraints = that.typeConstraints) {
            value typeConstraintList = JTypeConstriantList(null);
            for (typeConstraint in typeConstraints) {
                typeConstraintList.addTypeConstraint(transformTypeConstraint(typeConstraint));
            }
            ret.typeConstraintList = typeConstraintList;
        }
        return ret;
    }
    
    shared actual JMethodDefinition transformFunctionDefinition(FunctionDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JStaticType|JVoidModifier|JFunctionModifier|JDynamicModifier jType;
        JMethodDefinition ret;
        value type = that.type;
        switch (type)
        case (is Type) {
            jType = transformType(type);
            ret = JMethodDefinition(null);
        }
        case (is VoidModifier) {
            jType = transformVoidModifier(type);
            ret = JMethodDefinition(jType.mainToken);
        }
        case (is FunctionModifier) {
            jType = transformFunctionModifier(type);
            ret = JMethodDefinition(jType.mainToken);
        }
        case (is DynamicModifier) {
            jType = transformDynamicModifier(type);
            ret = JMethodDefinition(null);
        }
        ret.annotationList = annotationList;
        ret.type = jType;
        ret.identifier = transformLIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        for (parameters in that.parameterLists) {
            ret.addParameterList(transformParameters(parameters));
        }
        if (nonempty typeConstraints = that.typeConstraints) {
            value typeConstraintList = JTypeConstriantList(null);
            for (typeConstraint in typeConstraints) {
                typeConstraintList.addTypeConstraint(transformTypeConstraint(typeConstraint));
            }
            ret.typeConstraintList = typeConstraintList;
        }
        ret.block = transformBlock(that.definition);
        return ret;
    }
    
    shared actual JFunctionArgument transformFunctionExpression(FunctionExpression that) {
        JFunctionArgument ret = JFunctionArgument(null);
        value type = that.type;
        switch (type)
        case (null) { ret.type = JFunctionModifier(null); } // the parser creates a fake function modifier
        case (is FunctionModifier) { ret.type = transformFunctionModifier(type); }
        case (is VoidModifier) { ret.type = transformVoidModifier(type); }
        for (parameters in that.parameterLists) {
            ret.addParameterList(transformParameters(parameters));
        }
        value definition = that.definition;
        switch (definition)
        case (is LazySpecifier) { ret.expression = transformLazySpecifier(definition).expression; }
        case (is Block) { ret.block = transformBlock(definition); }
        return ret;
    }
    
    shared actual JFunctionModifier transformFunctionModifier(FunctionModifier that) {
        JFunctionModifier ret = JFunctionModifier(tokens.token("function", function_modifier));
        return ret;
    }
    
    shared actual JMethodDeclaration transformFunctionShortcutDefinition(FunctionShortcutDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JStaticType|JVoidModifier|JFunctionModifier|JDynamicModifier jType;
        JMethodDeclaration ret;
        value type = that.type;
        switch (type)
        case (is Type) {
            jType = transformType(type);
            ret = JMethodDeclaration(null);
        }
        case (is VoidModifier) {
            jType = transformVoidModifier(type);
            ret = JMethodDeclaration(jType.mainToken);
        }
        case (is FunctionModifier) {
            jType = transformFunctionModifier(type);
            ret = JMethodDeclaration(jType.mainToken);
        }
        case (is DynamicModifier) {
            jType = transformDynamicModifier(type);
            ret = JMethodDeclaration(null);
        }
        ret.annotationList = annotationList;
        ret.type = jType;
        ret.identifier = transformLIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        for (parameters in that.parameterLists) {
            ret.addParameterList(transformParameters(parameters));
        }
        if (nonempty typeConstraints = that.typeConstraints) {
            value typeConstraintList = JTypeConstriantList(null);
            for (typeConstraint in typeConstraints) {
                typeConstraintList.addTypeConstraint(transformTypeConstraint(typeConstraint));
            }
            ret.typeConstraintList = typeConstraintList;
        }
        ret.specifierExpression = transformLazySpecifier(that.definition);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JTypeParameterLiteral transformGivenDec(GivenDec that) {
        JTypeParameterLiteral ret = JTypeParameterLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token("given", type_constraint);
        ret.type = transformBaseType(BaseType(TypeNameWithTypeArguments(that.name)));
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JExpression transformGroupedExpression(GroupedExpression that) {
        JExpression ret = JExpression(tokens.token("(", lparen));
        ret.term = transformExpression(that.innerExpression);
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JGroupedType transformGroupedType(GroupedType that) {
        JGroupedType ret = JGroupedType(tokens.token("<", smaller_op));
        ret.type = transformType(that.type);
        ret.endToken = tokens.token(">", larger_op);
        return ret;
    }
    
    shared actual JIdentifier transformIdentifier(Identifier that) {
        assert (is JIdentifier ret = super.transformIdentifier(that));
        return ret;
    }
    
    shared actual JIdenticalOp transformIdenticalOperation(IdenticalOperation that) {
        JTerm left = transformPrecedence11Expression(that.leftOperand);
        JIdenticalOp ret = JIdenticalOp(tokens.token(that.operator, identical_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence11Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JPositiveOp transformIdentityOperation(IdentityOperation that) {
        JPositiveOp ret = JPositiveOp(tokens.token(that.operator, sum_op));
        ret.term = transformPrecedence2Expression(that.operand);
        return ret;
    }
    
    shared actual JIfClause transformIfClause(IfClause that) {
        JIfClause ret = JIfClause(tokens.token("if", if_clause));
        ret.conditionList = transformConditions(that.conditions);
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JIfComprehensionClause transformIfComprehensionClause(IfComprehensionClause that) {
        JIfComprehensionClause ret = JIfComprehensionClause(tokens.token("if", if_clause));
        ret.conditionList = transformConditions(that.conditions);
        ret.comprehensionClause = transformComprehensionClause(that.clause);
        return ret;
    }
    
    shared actual JIfStatement transformIfElse(IfElse that) {
        JIfStatement ret = JIfStatement(null);
        ret.ifClause = transformIfClause(that.ifClause);
        if (exists elseClause = that.elseClause) {
            ret.elseClause = transformElseClause(elseClause);
        }
        return ret;
    }
    
    shared actual JImport transformImport(Import that) {
        JImport ret = JImport(tokens.token("import", importType));
        ret.importPath = transformFullPackageName(that.packageName);
        ret.importMemberOrTypeList = transformImportElements(that.elements);
        return ret;
    }
    
    shared actual JAlias transformImportAlias(ImportAlias that) {
        assert (is JAlias ret = super.transformImportAlias(that));
        return ret;
    }
    
    shared actual JImportMemberOrType transformImportElement(ImportElement that) {
        assert (is JImportMemberOrType ret = super.transformImportElement(that));
        return ret;
    }
    
    shared actual JImportMemberOrTypeList transformImportElements(ImportElements that) {
        JImportMemberOrTypeList ret = JImportMemberOrTypeList(tokens.token("{", lbrace));
        if (nonempty elements = that.elements) {
            ret.addImportMemberOrType(transformImportElement(elements.first));
            for (element in elements.rest) {
                ret.endToken = tokens.token(",", comma);
                ret.addImportMemberOrType(transformImportElement(element));
            }
            if (exists wildcard = that.wildcard) {
                ret.endToken = tokens.token(",", comma);
                ret.importWildcard = transformImportWildcard(wildcard);
            }
        } else {
            if (exists wildcard = that.wildcard) {
                ret.importWildcard = transformImportWildcard(wildcard);
            }
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JAlias transformImportFunctionValueAlias(ImportFunctionValueAlias that) {
        value identifier = transformLIdentifier(that.name);
        JAlias ret = JAlias(tokens.token("=", specify));
        ret.identifier = identifier;
        return ret;
    }
    
    shared actual JImportMemberOrType transformImportFunctionValueElement(ImportFunctionValueElement that) {
        JImportMember ret = JImportMember(null);
        if (exists importAlias = that.importAlias) {
            ret.\ialias = transformImportFunctionValueAlias(importAlias);
        }
        ret.identifier = transformLIdentifier(that.name);
        if (exists nestedImports = that.nestedImports) {
            ret.importMemberOrTypeList = transformImportElements(nestedImports);
        }
        return ret;
    }
    
    shared actual JAlias transformImportTypeAlias(ImportTypeAlias that) {
        value identifier = transformUIdentifier(that.name);
        JAlias ret = JAlias(tokens.token("=", specify));
        ret.identifier = identifier;
        return ret;
    }
    
    shared actual JImportMemberOrType transformImportTypeElement(ImportTypeElement that) {
        // We generate an ImportMember, not an ImportType, because that’s what the parser does
        JImportMember ret = JImportMember(null);
        if (exists importAlias = that.importAlias) {
            ret.\ialias = transformImportTypeAlias(importAlias);
        }
        ret.identifier = transformIdentifier(that.name);
        if (exists nestedImports = that.nestedImports) {
            ret.importMemberOrTypeList = transformImportElements(nestedImports);
        }
        return ret;
    }
    
    shared actual JImportWildcard transformImportWildcard(ImportWildcard that) {
        JImportWildcard ret = JImportWildcard(tokens.token("...", ellipsis));
        return ret;
    }
    
    shared actual JInitialComprehensionClause transformInitialComprehensionClause(InitialComprehensionClause that) {
        assert (is JInitialComprehensionClause ret = super.transformInitialComprehensionClause(that));
        return ret;
    }
    
    shared actual JTypeVariance transformInModifier(InModifier that) {
        JTypeVariance ret = JTypeVariance(tokens.token(that.text, in_op));
        return ret;
    }
    
    shared actual JInOp transformInOperation(InOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JInOp ret = JInOp(tokens.token(that.operator, in_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JIntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => JIntegerLiteral(tokens.token(that.text, integer_literal));
    
    shared actual JInterfaceBody transformInterfaceBody(InterfaceBody that) {
        JInterfaceBody ret = JInterfaceBody(tokens.token("{", lbrace));
        for (declaration in that.content) {
            ret.addStatement(transformDeclaration(declaration));
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JInterfaceLiteral transformInterfaceDec(InterfaceDec that) {
        JInterfaceLiteral ret = JInterfaceLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token(that.keyword, interface_definition);
        if (exists qualifier = that.qualifier) {
            "Qualifier can’t yet be an object!"
            // https://github.com/ceylon/ceylon-spec/issues/1076
            assert (is [UIdentifier+] components = qualifier.components);
            assert (nonempty newComponents = concatenate(components, [that.name]));
            assert (is JStaticType type = helpTransformDecQualifier(DecQualifier(newComponents)));
            ret.type = type;
        } else {
            assert (is JStaticType type = helpTransformDecQualifier(DecQualifier([that.name])));
            ret.type = type;
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JIntersectAssignOp transformIntersectAssignmentOperation(IntersectAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JIntersectAssignOp ret = JIntersectAssignOp(tokens.token(that.operator, intersect_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JIntersectionOp transformIntersectionOperation(IntersectionOperation that) {
        JTerm left = transformPrecedence4Expression(that.leftOperand);
        JIntersectionOp ret = JIntersectionOp(tokens.token(that.operator, intersection_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence3Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JIntersectionType transformIntersectionType(IntersectionType that) {
        JIntersectionType ret = JIntersectionType(null);
        ret.addStaticType(transformPrimaryType(that.children.first));
        for (elementType in that.children.rest) {
            tokens.token("&", intersection_op);
            ret.addStaticType(transformPrimaryType(elementType));
        }
        return ret;
    }
    
    shared actual JInvocationExpression transformInvocation(Invocation that) {
        JInvocationExpression ret = JInvocationExpression(null);
        ret.primary = transformPrimary(that.invoked);
        value arguments = that.arguments;
        switch (arguments)
        case (is PositionalArguments) { ret.positionalArgumentList = transformPositionalArguments(arguments); }
        case (is NamedArguments) { ret.namedArgumentList = transformNamedArguments(arguments); }
        return ret;
    }
    
    shared actual JExpressionStatement transformInvocationStatement(InvocationStatement that) {
        JExpressionStatement ret = JExpressionStatement(null);
        ret.expression = wrapTerm(transformInvocation(that.expression));
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JIsCase transformIsCase(IsCase that) {
        JIsCase ret = JIsCase(tokens.token("is", is_op));
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JIsCondition transformIsCondition(IsCondition that) {
        JIsCondition ret;
        if (that.negated) {
            ret = JIsCondition(tokens.token("!", not_op));
            ret.not = true;
            tokens.token("is", is_op);
        } else {
            ret = JIsCondition(tokens.token("is", is_op));
        }
        ret.type = transformType(that.variable.type);
        JVariable var = JVariable(null);
        var.identifier = transformLIdentifier(that.variable.name);
        if (exists specifier = that.variable.specifier) {
            var.type = JValueModifier(null);
            var.specifierExpression = transformSpecifier(specifier);
        } else {
            // the parser does lots of stuff here (impliedVariable rule), I assume the compiler needs it?
            var.type = JSyntheticVariable(null);
            value se = JSpecifierExpression(null);
            value e = JExpression(null);
            value bme = JBaseMemberExpression(null);
            bme.identifier = var.identifier;
            bme.typeArguments = JInferredTypeArguments(null);
            e.term = bme;
            se.expression = e;
            var.specifierExpression = se;
        }
        ret.variable = var;
        return ret;
    }
    
    shared actual JIsOp transformIsOperation(IsOperation that) {
        JTerm term = transformPrecedence10Expression(that.operand);
        JIsOp ret = JIsOp(tokens.token(that.operator, is_op));
        ret.term = term;
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JSequenceEnumeration transformIterable(Iterable that) {
        JSequenceEnumeration ret = JSequenceEnumeration(tokens.token("{", lbrace));
        ret.sequencedArgument = transformArgumentList(that.argumentList);
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JIterableType transformIterableType(IterableType that) {
        JIterableType ret = JIterableType(tokens.token("{", lbrace));
        if (exists varType = that.variadicType) {
            ret.elementType = transformVariadicType(varType);
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JElement transformKeySubscript(KeySubscript that) {
        JElement ret = JElement(null);
        ret.expression = wrapTerm(transformExpression(that.key));
        return ret;
    }
    
    shared actual JKeyValueIterator transformKeyValueIterator(KeyValueIterator that) {
        JKeyValueIterator ret = JKeyValueIterator(tokens.token("(", lparen));
        value keyVariable = that.keyVariable;
        value keyVar = JVariable(null);
        value keyType = keyVariable.type;
        switch (keyType)
        case (is Type) { keyVar.type = transformType(keyType); }
        case (is ValueModifier) { keyVar.type = transformValueModifier(keyType); }
        case (null) { keyVar.type = JValueModifier(null); }
        keyVar.identifier = transformLIdentifier(keyVariable.name);
        ret.keyVariable = keyVar;
        tokens.token("->", entry_op);
        value valueVariable = that.valueVariable;
        value valueVar = JVariable(null);
        value valueType = valueVariable.type;
        switch (valueType)
        case (is Type) { valueVar.type = transformType(valueType); }
        case (is ValueModifier) { valueVar.type = transformValueModifier(valueType); }
        case (null) { valueVar.type = JValueModifier(null); }
        valueVar.identifier = transformLIdentifier(valueVariable.name);
        ret.valueVariable = valueVar;
        value jSpecifierExpression = JSpecifierExpression(tokens.token("in", in_op));
        jSpecifierExpression.expression = wrapTerm(transformExpression(that.iterated));
        ret.specifierExpression = jSpecifierExpression;
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JLargeAsOp transformLargeAsOperation(LargeAsOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JLargeAsOp ret = JLargeAsOp(tokens.token(that.operator, large_as_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JLargerOp transformLargerOperation(LargerOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JLargerOp ret = JLargerOp(tokens.token(that.operator, larger_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JLazySpecifierExpression transformLazySpecifier(LazySpecifier that) {
        JLazySpecifierExpression ret = JLazySpecifierExpression(tokens.token("=>", compute));
        ret.expression = wrapTerm(transformExpression(that.expression));
        return ret;
    }
    
    shared actual JIdentifier transformLIdentifier(LIdentifier that)
            => JIdentifier(tokens.token(that.name, lidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JLiteral transformLiteral(Literal that) {
        assert (is JLiteral ret = super.transformLiteral(that));
        return ret;
    }
    
    shared actual JLogicalAssignmentOp transformLogicalAssignmentOperation(LogicalAssignmentOperation that) {
        assert (is JLogicalAssignmentOp ret = super.transformLogicalAssignmentOperation(that));
        return ret;
    }
    
    shared actual JLogicalOp transformLogicalOperation(LogicalOperation that) {
        assert (is JLogicalOp ret = super.transformLogicalOperation(that));
        return ret;
    }
    
    shared actual JStaticType transformMainType(MainType that) {
        assert (is JStaticType ret = super.transformMainType(that));
        return ret;
    }
    
    shared actual JMatchCase transformMatchCase(MatchCase that) {
        JMatchCase ret = JMatchCase(null);
        JExpressionList expressions = JExpressionList(null);
        expressions.addExpression(wrapTerm(transformExpression(that.expressions.first)));
        for (expression in that.expressions.rest) {
            expressions.endToken = tokens.token(",", comma);
            expressions.addExpression(wrapTerm(transformExpression(expression)));
        }
        expressions.endToken = null;
        ret.expressionList = expressions;
        return ret;
    }
    
    shared actual JSegmentOp transformMeasureOperation(MeasureOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JSegmentOp ret = JSegmentOp(tokens.token(that.operator, segment_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence8Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JElementRange transformMeasureSubscript(MeasureSubscript that) {
        JElementRange ret = JElementRange(null);
        ret.lowerBound = wrapTerm(transformExpression(that.from));
        tokens.token(":", segment_op); // the parser temporarily assigns it to the surrounding IndexExpression,
        // but there it’s later overwritten by the closing bracket, so it’s okay to forget it here
        ret.length = wrapTerm(transformExpression(that.length));
        return ret;
    }
    
    shared actual JMemberLiteral transformMemberDec(MemberDec that) {
        assert (is JMemberLiteral ret = super.transformMemberDec(that));
        return ret;
    }
    
    shared actual JMemberLiteral transformMemberMeta(MemberMeta that) {
        JMemberLiteral ret = JMemberLiteral(tokens.token("`", backtick));
        value qualifier = transformMetaQualifier(that.qualifier);
        switch (qualifier)
        case (is JStaticType) { ret.type = qualifier; }
        case (is JIdentifier) {
            ret.objectExpression = JBaseMemberExpression(null);
            ret.objectExpression.identifier = qualifier;
            ret.objectExpression.typeArguments = JInferredTypeArguments(null);
        }
        ret.identifier = transformIdentifier(that.nameAndArgs.name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArgumentList = transformTypeArguments(typeArguments);
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[MemberNameWithTypeArguments]];
     this method throws."
    shared actual Nothing transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) {
        throw Exception("MemberNameWithTypeArguments has no RedHat AST equivalent!");
    }
    
    shared actual JMemberOp transformMemberOperator(MemberOperator that)
            => JMemberOp(tokens.token(that.text, member_op));
    
    shared actual JMetaLiteral transformMeta(Meta that) {
        assert (is JMetaLiteral ret = super.transformMeta(that));
        return ret;
    }
    
    shared actual JStaticType|JIdentifier transformMetaQualifier(MetaQualifier that) {
        assert (is JStaticType|JIdentifier ret = super.transformMetaQualifier(that));
        return ret;
    }
    
    shared actual JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance transformModifier(Modifier that) {
        assert (is JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance ret = super.transformModifier(that)); // TODO more case types!
        return ret;
    }
    
    shared actual JModuleLiteral transformModuleDec(ModuleDec that) {
        JModuleLiteral ret = JModuleLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token("module", moduleType);
        ret.importPath = transformFullPackageName(that.moduleName);
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JImportModuleList transformModuleBody(ModuleBody that) {
        JImportModuleList ret = JImportModuleList(tokens.token("{", lbrace));
        for (moduleImport in that.moduleImports) {
            ret.addImportModule(transformModuleImport(moduleImport));
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JCompilationUnit transformModuleCompilationUnit(ModuleCompilationUnit that) {
        JCompilationUnit ret = JCompilationUnit(null);
        JImportList imports = JImportList(null);
        for (\iimport in that.imports) {
            imports.addImport(transformImport(\iimport));
        }
        ret.importList = imports;
        ret.addModuleDescriptor(transformModuleDescriptor(that.moduleDescriptor));
        tokens.token("", eof);
        return ret;
    }
    
    shared actual JModuleDescriptor transformModuleDescriptor(ModuleDescriptor that) {
        value annotationList = transformAnnotations(that.annotations);
        JModuleDescriptor ret = JModuleDescriptor(tokens.token("module", moduleType));
        ret.annotationList = annotationList;
        ret.importPath = transformFullPackageName(that.name);
        ret.version = JQuotedLiteral(transformStringLiteral(that.version).mainToken);
        ret.importModuleList = transformModuleBody(that.body);
        return ret;
    }
    
    shared actual JImportModule transformModuleImport(ModuleImport that) {
        value annotationList = transformAnnotations(that.annotations);
        JImportModule ret = JImportModule(tokens.token("import", importType));
        ret.annotationList = annotationList;
        value name = that.name;
        switch (name)
        case (is FullPackageName) { ret.importPath = transformFullPackageName(name); }
        case (is StringLiteral) { ret.quotedLiteral = JQuotedLiteral(transformStringLiteral(name).mainToken); }
        ret.version = JQuotedLiteral(transformStringLiteral(that.version).mainToken);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JMultiplyAssignOp transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JMultiplyAssignOp ret = JMultiplyAssignOp(tokens.token(that.operator, multiply_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JNamedArgument transformNamedArgument(NamedArgument that) {
        assert (is JNamedArgument ret = super.transformNamedArgument(that));
        return ret;
    }
    
    shared actual JNamedArgumentList transformNamedArguments(NamedArguments that) {
        JNamedArgumentList ret = JNamedArgumentList(tokens.token("{", lbrace));
        for (namedArgument in that.namedArguments) {
            ret.addNamedArgument(transformNamedArgument(namedArgument));
        }
        if (that.iterableArgument.children nonempty) {
            ret.sequencedArgument = transformArgumentList(that.iterableArgument);
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JNegativeOp transformNegationOperation(NegationOperation that) {
        JNegativeOp ret = JNegativeOp(tokens.token(that.operator, difference_op));
        ret.term = transformPrecedence2Expression(that.operand);
        return ret;
    }
    
    shared actual JNonemptyCondition transformNonemptyCondition(NonemptyCondition that) {
        JNonemptyCondition ret = JNonemptyCondition(tokens.token("nonempty", nonempty_op));
        return helpTransformExistsOrNonemptyCondition(ret, that.variable);
    }
    
    shared actual JNonempty transformNonemptyOperation(NonemptyOperation that) {
        JTerm term = transformPrecedence9Expression(that.operand);
        JNonempty ret = JNonempty(tokens.token(that.operator, nonempty_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JNotEqualOp transformNotEqualOperation(NotEqualOperation that) {
        JTerm left = transformPrecedence11Expression(that.leftOperand);
        JNotEqualOp ret = JNotEqualOp(tokens.token(that.operator, not_equal_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence11Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JNotOp transformNotOperation(NotOperation that) {
        JNotOp ret = JNotOp(tokens.token(that.operator, not_op));
        ret.term = transformPrecedence13Expression(that.operand);
        return ret;
    }
    
    shared actual JObjectDefinition transformObjectDefinition(ObjectDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JObjectDefinition ret = JObjectDefinition(tokens.token("object", object_definition));
        ret.annotationList = annotationList;
        ret.identifier = transformLIdentifier(that.name);
        if (exists extendedType = that.extendedType) {
            ret.extendedType = transformExtendedType(extendedType);
        }
        if (exists satisfiedTypes = that.satisfiedTypes) {
            ret.satisfiedTypes = transformSatisfiedTypes(satisfiedTypes);
        }
        ret.classBody = transformClassBody(that.body);
        return ret;
    }
    
    shared actual JOfOp transformOfOperation(OfOperation that) {
        JTerm term = transformPrecedence10Expression(that.operand);
        JOfOp ret = JOfOp(tokens.token(that.operator, case_types));
        ret.term = term;
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JOpenBound transformOpenBound(OpenBound that) {
        JTerm endpoint;
        CommonToken token;
        if (exists isLowerBound = that.get(isLowerBoundKey), isLowerBound) {
            // lower bound: endpoint, then token
            endpoint = transformPrecedence10Expression(that.endpoint);
            token = tokens.token("<=", small_as_op);
        } else {
            // upper bound: token, then endpoint
            token = tokens.token("<=", small_as_op);
            endpoint = transformPrecedence10Expression(that.endpoint);
        }
        JOpenBound ret = JOpenBound(null); // TODO JOpenBound(token)? the compiler grammar doesn’t do it, but I don’t see why not
        ret.term = endpoint;
        return ret;
    }
    
    shared actual JOperatorExpression transformOperation(Operation that) {
        assert (is JOperatorExpression ret = super.transformOperation(that));
        return ret;
    }
    
    shared actual JOptionalType transformOptionalType(OptionalType that) {
        JOptionalType ret = JOptionalType(null);
        ret.definiteType = transformPrimaryType(that.definiteType);
        ret.endToken = tokens.token("?", optionalType);
        return ret;
    }
    
    shared actual JOrAssignOp transformOrAssignmentOperation(OrAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JOrAssignOp ret = JOrAssignOp(tokens.token(that.operator, or_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JOrOp transformOrOperation(OrOperation that) {
        JTerm left = transformPrecedence15Expression(that.leftOperand);
        JOrOp ret = JOrOp(tokens.token(that.operator, or_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence15Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JTypeVariance transformOutModifier(OutModifier that) {
        JTypeVariance ret = JTypeVariance(tokens.token(that.text, outType));
        return ret;
    }
    
    shared actual JOuter transformOuter(Outer that)
            => JOuter(tokens.token("outer", outerType));
    
    shared actual JPackage transformPackage(Package that)
            => JPackage(tokens.token("package", packageType));
    
    shared actual JCompilationUnit transformPackageCompilationUnit(PackageCompilationUnit that) {
        JCompilationUnit ret = JCompilationUnit(null);
        JImportList imports = JImportList(null);
        for (\iimport in that.imports) {
            imports.addImport(transformImport(\iimport));
        }
        ret.importList = imports;
        ret.addPackageDescriptor(transformPackageDescriptor(that.packageDescriptor));
        tokens.token("", eof);
        return ret;
    }
    
    shared actual JPackageLiteral transformPackageDec(PackageDec that) {
        JPackageLiteral ret = JPackageLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token("package", packageType);
        ret.importPath = transformFullPackageName(that.packageName);
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JPackageDescriptor transformPackageDescriptor(PackageDescriptor that) {
        value annotationList = transformAnnotations(that.annotations);
        JPackageDescriptor ret = JPackageDescriptor(tokens.token("package", packageType));
        ret.annotationList = annotationList;
        ret.importPath = transformFullPackageName(that.name);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JParameter transformParameter(Parameter that) {
        assert (is JParameter ret = super.transformParameter(that));
        return ret;
    }
    
    shared actual JParameterList transformParameters(Parameters that) {
        JParameterList ret = JParameterList(tokens.token("(", lparen));
        if (nonempty parameters = that.parameters) {
            ret.parameters.add(transformParameter(parameters.first));
        }
        for (parameter in that.parameters.rest) {
            ret.endToken = tokens.token(",", comma);
            ret.parameters.add(transformParameter(parameter));
        }
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JInitializerParameter transformParameterReference(ParameterReference that) {
        JInitializerParameter ret = JInitializerParameter(null);
        ret.identifier = transformLIdentifier(that.name);
        return ret;
    }
    
    "Transforms a [[LIdentifier]] to a RedHat AST [[Identifier|JIdentifier]]
     with token type `PIDENTIFIER` (“package identifier”)."
    shared JIdentifier transformPIdentifier(LIdentifier that) {
        value ret = transformIdentifier(that);
        ret.mainToken.type = pidentifier;
        return ret;
    }
    
    shared actual JPositionalArgumentList transformPositionalArguments(PositionalArguments that) {
        JPositionalArgumentList ret = JPositionalArgumentList(tokens.token("(", lparen));
        /*
         Copy the arguments from the SequencedArgument to the ArgumentList.
         Don’t use addAll – addPositionalArgument connect()s the nodes.
         See ceylon-spec@e71c962e.
         */
        for (argument in CeylonIterable(transformArgumentList(that.argumentList).positionalArguments)) {
            ret.addPositionalArgument(argument);
        }
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JPostfixDecrementOp transformPostfixDecrementOperation(PostfixDecrementOperation that) {
        value term = transformPrimary(that.operand);
        JPostfixDecrementOp ret = JPostfixDecrementOp(tokens.token(that.operator, decrement_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JPostfixIncrementOp transformPostfixIncrementOperation(PostfixIncrementOperation that) {
        value term = transformPrimary(that.operand);
        JPostfixIncrementOp ret = JPostfixIncrementOp(tokens.token(that.operator, increment_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JPostfixOperatorExpression transformPostfixOperation(PostfixOperation that) {
        assert (is JPostfixOperatorExpression ret = super.transformPostfixOperation(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence1Expression(Precedence1Expression that) {
        assert (is JTerm ret = super.transformPrecedence1Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence2Expression(Precedence2Expression that) {
        assert (is JTerm ret = super.transformPrecedence2Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence3Expression(Precedence3Expression that) {
        assert (is JTerm ret = super.transformPrecedence3Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence4Expression(Precedence4Expression that) {
        assert (is JTerm ret = super.transformPrecedence4Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence5Expression(Precedence5Expression that) {
        assert (is JTerm ret = super.transformPrecedence5Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence6Expression(Precedence6Expression that) {
        assert (is JTerm ret = super.transformPrecedence6Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence7Expression(Precedence7Expression that) {
        assert (is JTerm ret = super.transformPrecedence7Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence8Expression(Precedence8Expression that) {
        assert (is JTerm ret = super.transformPrecedence8Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence9Expression(Precedence9Expression that) {
        assert (is JTerm ret = super.transformPrecedence9Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence10Expression(Precedence10Expression that) {
        assert (is JTerm ret = super.transformPrecedence10Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence11Expression(Precedence11Expression that) {
        assert (is JTerm ret = super.transformPrecedence11Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence12Expression(Precedence12Expression that) {
        assert (is JTerm ret = super.transformPrecedence12Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence13Expression(Precedence13Expression that) {
        assert (is JTerm ret = super.transformPrecedence13Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence14Expression(Precedence14Expression that) {
        assert (is JTerm ret = super.transformPrecedence14Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence15Expression(Precedence15Expression that) {
        assert (is JTerm ret = super.transformPrecedence15Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence16Expression(Precedence16Expression that) {
        assert (is JTerm ret = super.transformPrecedence16Expression(that));
        return ret;
    }
    
    shared actual JTerm transformPrecedence17Expression(Precedence17Expression that) {
        assert (is JTerm ret = super.transformPrecedence17Expression(that));
        return ret;
    }
    
    shared actual JDecrementOp transformPrefixDecrementOperation(PrefixDecrementOperation that) {
        JDecrementOp ret = JDecrementOp(tokens.token(that.operator, decrement_op));
        ret.term = transformPrimary(that.operand);
        return ret;
    }
    
    shared actual JIncrementOp transformPrefixIncrementOperation(PrefixIncrementOperation that) {
        JIncrementOp ret = JIncrementOp(tokens.token(that.operator, increment_op));
        ret.term = transformPrimary(that.operand);
        return ret;
    }
    
    shared actual JPrefixOperatorExpression transformPrefixOperation(PrefixOperation that) {
        assert (is JPrefixOperatorExpression ret = super.transformPrefixOperation(that));
        return ret;
    }
    
    shared actual JExpressionStatement transformPrefixPostfixStatement(PrefixPostfixStatement that) {
        JExpressionStatement ret = JExpressionStatement(null);
        value expression = that.expression;
        switch (expression)
        case (is PrefixOperation) { ret.expression = wrapTerm(transformPrefixOperation(expression)); }
        case (is PostfixOperation) { ret.expression = wrapTerm(transformPostfixOperation(expression)); }
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JPrimary transformPrimary(Primary that) {
        assert (is JPrimary ret = super.transformPrimary(that));
        return ret;
    }
    
    shared actual JStaticType transformPrimaryType(PrimaryType that) {
        assert (is JStaticType ret = super.transformPrimaryType(that));
        return ret;
    }
    
    shared actual JProductOp transformProductOperation(ProductOperation that) {
        JTerm left = transformPrecedence6Expression(that.leftOperand);
        JProductOp ret = JProductOp(tokens.token(that.operator, product_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence5Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JQualifiedMemberOrTypeExpression transformQualifiedExpression(QualifiedExpression that) {
        JQualifiedMemberOrTypeExpression ret;
        value name = that.nameAndArgs.name;
        switch (name)
        case (is LIdentifier) { ret = JQualifiedMemberExpression(null); }
        case (is UIdentifier) { ret = JQualifiedTypeExpression(null); }
        ret.primary = transformPrimary(that.receiverExpression);
        ret.memberOperator = transformAnyMemberOperator(that.memberOperator);
        ret.identifier = transformIdentifier(name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArguments = transformTypeArguments(typeArguments);
        } else {
            ret.typeArguments = JInferredTypeArguments(null);
        }
        return ret;
    }
    
    shared actual JQualifiedType transformQualifiedType(QualifiedType that) {
        value outerType = transformType(that.qualifyingType);
        JQualifiedType ret = JQualifiedType(tokens.token(".", member_op));
        ret.identifier = transformUIdentifier(that.nameAndArgs.name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArgumentList = transformTypeArguments(typeArguments);
        }
        ret.outerType = outerType;
        return ret;
    }
    
    shared actual JQuotientOp transformQuotientOperation(QuotientOperation that) {
        JTerm left = transformPrecedence6Expression(that.leftOperand);
        JQuotientOp ret = JQuotientOp(tokens.token(that.operator, quotient_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence5Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JElementRange transformRangeSubscript(RangeSubscript that) {
        assert (is JElementRange ret = super.transformRangeSubscript(that));
        return ret;
    }
    
    shared actual JRemainderAssignOp transformRemainderAssignmentOperation(RemainderAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JRemainderAssignOp ret = JRemainderAssignOp(tokens.token(that.operator, remainder_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JRemainderOp transformRemainderOperation(RemainderOperation that) {
        JTerm left = transformPrecedence6Expression(that.leftOperand);
        JRemainderOp ret = JRemainderOp(tokens.token(that.operator, remainder_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence5Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JParameter transformRequiredParameter(RequiredParameter that) {
        assert (is JParameter ret = super.transformRequiredParameter(that));
        return ret;
    }
    
    shared actual JResource transformResource(Resource that) {
        JResource ret = JResource(null);
        value resource = that.resource;
        switch (resource)
        case (is Expression) { ret.expression = wrapTerm(transformExpression(resource)); }
        case (is SpecifiedVariable) {
            JVariable var = JVariable(null);
            value type = resource.type;
            switch (type)
            case (is Type) { var.type = transformType(type); }
            case (is ValueModifier) { var.type = transformValueModifier(type); }
            case (null) { var.type = JValueModifier(null); }
            var.identifier = transformLIdentifier(resource.name);
            var.specifierExpression = transformSpecifier(resource.specifier);
            ret.variable = var;
        }
        return ret;
    }
    
    shared actual JResourceList transformResources(Resources that) {
        JResourceList ret = JResourceList(tokens.token("(", lparen));
        ret.addResource(transformResource(that.resources.first));
        for (resource in that.resources.rest) {
            ret.endToken = tokens.token(",", comma);
            ret.addResource(transformResource(resource));
        }
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JReturn transformReturn(Return that) {
        JReturn ret = JReturn(tokens.token(that.text, returnType));
        if (exists result = that.result) {
            ret.expression = wrapTerm(transformExpression(result));
        }
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JSafeMemberOp transformSafeMemberOperator(SafeMemberOperator that)
            => JSafeMemberOp(tokens.token(that.text, safe_member_op));
    
    shared actual JSatisfiedTypes transformSatisfiedTypes(SatisfiedTypes that) {
        JSatisfiedTypes ret = JSatisfiedTypes(tokens.token("satisfies", satisfiesType));
        ret.addType(transformPrimaryType(that.satisfiedTypes.first));
        for (satisfiedType in that.satisfiedTypes.rest) {
            ret.endToken = tokens.token("&", intersection_op);
            ret.addType(transformPrimaryType(satisfiedType));
            ret.endToken = null;
        }
        return ret;
    }
    
    shared actual JScaleOp transformScaleOperation(ScaleOperation that) {
        JTerm left = transformPrecedence6Expression(that.leftOperand);
        JScaleOp ret = JScaleOp(tokens.token(that.operator, scale_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence7Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JBitwiseAssignmentOp transformSetAssignmentOperation(SetAssignmentOperation that) {
        assert (is JBitwiseAssignmentOp ret = super.transformSetAssignmentOperation(that));
        return ret;
    }
    
    shared actual JSimpleType transformSimpleType(SimpleType that) {
        assert (is JSimpleType ret = super.transformSimpleType(that));
        return ret;
    }
    
    shared actual JSmallAsOp transformSmallAsOperation(SmallAsOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JSmallAsOp ret = JSmallAsOp(tokens.token(that.operator, small_as_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JSmallerOp transformSmallerOperation(SmallerOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JSmallerOp ret = JSmallerOp(tokens.token(that.operator, smaller_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JStringLiteral transformStringLiteral(StringLiteral that) {
        value quotes = that.isVerbatim then "\"\"\"" else "\"";
        return JStringLiteral(tokens.token(quotes + that.text + quotes, that.isVerbatim then verbatim_string_literal else string_literal));
    }
    
    shared actual JSelfExpression|JOuter|JPackage transformSelfReference(SelfReference that) {
        assert (is JSelfExpression|JOuter|JPackage ret = super.transformSelfReference(that));
        return ret;
    }
    
    shared actual JSequenceType transformSequentialType(SequentialType that) {
        JSequenceType ret = JSequenceType(null);
        ret.elementType = transformPrimaryType(that.elementType);
        ret.endToken = tokens.token("[", lbracket); // unreachable, but we need to have it in the token stream
        ret.endToken = tokens.token("]", rbracket);
        return ret;
    }
    
    shared actual JBitwiseOp transformSetOperation(SetOperation that) {
        assert (is JBitwiseOp ret = super.transformSetOperation(that));
        return ret;
    }
    
    shared actual JElementRange transformSpanFromSubscript(SpanFromSubscript that) {
        JElementRange ret = JElementRange(null);
        ret.lowerBound = wrapTerm(transformExpression(that.from));
        tokens.token("...", ellipsis);
        return ret;
    }
    
    shared actual JRangeOp transformSpanOperation(SpanOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JRangeOp ret = JRangeOp(tokens.token(that.operator, range_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence8Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JElementRange transformSpanSubscript(SpanSubscript that) {
        JElementRange ret = JElementRange(null);
        ret.lowerBound = wrapTerm(transformExpression(that.from));
        tokens.token("..", range_op);
        ret.upperBound = wrapTerm(transformExpression(that.to));
        return ret;
    }
    
    shared actual JElementRange transformSpanToSubscript(SpanToSubscript that) {
        JElementRange ret = JElementRange(null);
        tokens.token("...", ellipsis);
        ret.upperBound = wrapTerm(transformExpression(that.to));
        return ret;
    }
    
    shared actual JSpecifierStatement transformSpecification(Specification that) {
        assert (is JSpecifierStatement ret = super.transformSpecification(that));
        return ret;
    }
    
    shared actual JSpecifiedArgument transformSpecifiedArgument(SpecifiedArgument that) {
        JSpecifiedArgument ret = JSpecifiedArgument(null);
        assert (is ValueSpecification specification = that.specification);
        switch (specification)
        case (is ValueSpecification) {
            ret.identifier = transformIdentifier(specification.name);
            ret.specifierExpression = transformSpecifier(specification.specifier);
        }
        return ret;
    }
    
    "The usage of [[SpecifiedVariable]] in `ceylon.ast` differs significantly
     from the usage of [[Variable|JVariable]] in the RedHat AST, to the point
     where a conversion at the level of individual variable nodes isn’t possible."
    shared actual Nothing transformSpecifiedVariable(SpecifiedVariable that) {
        throw AssertionError("Can’t transform a ceylon.ast SpecifiedVariable to a RedHat AST Variable");
    }
    
    shared actual JSpecifierExpression transformSpecifier(Specifier that) {
        JSpecifierExpression ret = JSpecifierExpression(tokens.token("=", specify));
        ret.expression = wrapTerm(transformExpression(that.expression));
        return ret;
    }
    
    shared actual JSpreadArgument transformSpreadArgument(SpreadArgument that) {
        JSpreadArgument ret = JSpreadArgument(tokens.token("*", product_op));
        value expression = JExpression(null);
        expression.term = transformExpression(that.argument);
        ret.expression = expression;
        return ret;
    }
    
    shared actual JSpreadOp transformSpreadMemberOperator(SpreadMemberOperator that)
            => JSpreadOp(tokens.token(that.text, spread_op)); // yes, spread_op, not spread_member_op – the * operator is a product_op!
    
    shared actual JExecutableStatement transformStatement(Statement that) {
        assert (is JExecutableStatement ret = super.transformStatement(that));
        return ret;
    }
    
    shared actual JStringTemplate transformStringTemplate(StringTemplate that) {
        JStringTemplate ret = JStringTemplate(null);
        value litIt = that.literals.iterator();
        value exprIt = that.expressions.iterator();
        assert (is StringLiteral litFirst = litIt.next());
        ret.addStringLiteral(JStringLiteral(tokens.token("\"" + litFirst.text + "\`\`", string_start)));
        variable value litNext = litIt.next();
        variable value exprNext = exprIt.next();
        while (!litNext is Finished) {
            assert (is StringLiteral litCur = litNext);
            assert (is ValueExpression exprCur = exprNext);
            litNext = litIt.next();
            exprNext = exprIt.next();
            ret.addExpression(wrapTerm(transformValueExpression(exprCur)));
            if (litNext is Finished) {
                // last part, litCur needs to be come a string_end
                ret.addStringLiteral(JStringLiteral(tokens.token("\`\`" + litCur.text + "\"", string_end)));
                break; // not strictly necessary, but we know that the loop condition will be false iff we entered this block, so why not
            } else {
                // mid part, litCur needs to become a string_mid
                ret.addStringLiteral(JStringLiteral(tokens.token("\`\`" + litCur.text + "\`\`", string_mid)));
            }
        }
        return ret;
    }
    
    shared actual JElementOrRange transformSubscript(Subscript that) {
        assert (is JElementOrRange ret = super.transformSubscript(that));
        return ret;
    }
    
    shared actual JSubtractAssignOp transformSubtractAssignmentOperation(SubtractAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JSubtractAssignOp ret = JSubtractAssignOp(tokens.token(that.operator, subtract_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JSumOp transformSumOperation(SumOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JSumOp ret = JSumOp(tokens.token(that.operator, sum_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence7Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JSuper transformSuper(Super that)
            => JSuper(tokens.token("super", superType));
    
    shared actual JSwitchStatement transformSwitchCaseElse(SwitchCaseElse that) {
        JSwitchStatement ret = JSwitchStatement(null);
        ret.switchClause = transformSwitchClause(that.clause);
        ret.switchCaseList = transformSwitchCases(that.cases);
        // the parser now adds synthetic variables to all ‘is’ cases.
        // this is mostly copied from the grammar.
        value ex = ret.switchClause.expression.term;
        if (is JBaseMemberExpression ex) {
            value id = ex.identifier;
            for (cc in CeylonIterable(ret.switchCaseList.caseClauses)) {
                if (is JIsCase ic = cc.caseItem) {
                    value v = JVariable(null);
                    v.type = JSyntheticVariable(null);
                    v.identifier = id;
                    value se = JSpecifierExpression(null);
                    value e = JExpression(null);
                    value bme = JBaseMemberExpression(null);
                    bme.identifier = id;
                    bme.typeArguments = JInferredTypeArguments(null);
                    e.term = bme;
                    se.expression = e;
                    v.specifierExpression = se;
                    ic.variable = v;
                }
            }
        }
        return ret;
    }
    
    shared actual JSwitchCaseList transformSwitchCases(SwitchCases that) {
        JSwitchCaseList ret = JSwitchCaseList(null);
        for (caseClause in that.caseClauses) {
            ret.addCaseClause(transformCaseClause(caseClause));
        }
        if (exists elseCaseClause = that.elseCaseClause) {
            ret.elseClause = transformElseCaseClause(elseCaseClause);
        }
        return ret;
    }
    
    shared actual JSwitchClause transformSwitchClause(SwitchClause that) {
        JSwitchClause ret = JSwitchClause(tokens.token("switch", switch_clause));
        tokens.token("(", lparen);
        ret.expression = wrapTerm(transformExpression(that.expression));
        tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JThenOp transformThenOperation(ThenOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JThenOp ret = JThenOp(tokens.token(that.operator, then_clause));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence15Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JThis transformThis(This that)
            => JThis(tokens.token("this", thisType));
    
    shared actual JThrow transformThrow(Throw that) {
        JThrow ret = JThrow(tokens.token(that.text, throwType));
        if (exists result = that.result) {
            ret.expression = wrapTerm(transformExpression(result));
        }
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JTryCatchStatement transformTryCatchFinally(TryCatchFinally that) {
        JTryCatchStatement ret = JTryCatchStatement(null);
        ret.tryClause = transformTryClause(that.tryClause);
        for (catchClause in that.catchClauses) {
            ret.addCatchClause(transformCatchClause(catchClause));
        }
        if (exists finallyClause = that.finallyClause) {
            ret.finallyClause = transformFinallyClause(finallyClause);
        }
        return ret;
    }
    
    shared actual JTryClause transformTryClause(TryClause that) {
        JTryClause ret = JTryClause(tokens.token("try", try_clause));
        if (exists resources = that.resources) {
            ret.resourceList = transformResources(resources);
        }
        ret.block = transformBlock(that.block);
        return ret;
    }
    
    shared actual JTuple transformTuple(Tuple that) {
        JTuple ret = JTuple(tokens.token("[", lbracket));
        ret.sequencedArgument = transformArgumentList(that.argumentList);
        ret.endToken = tokens.token("]", rbracket);
        return ret;
    }
    
    shared actual JTupleType transformTupleType(TupleType that) {
        JTupleType ret = JTupleType(tokens.token("[", lbracket));
        for (elementType in that.typeList.elements) {
            switch (elementType)
            case (is Type) { ret.addElementType(transformType(elementType)); }
            case (is DefaultedType) { ret.addElementType(transformDefaultedType(elementType)); }
        }
        if (exists var = that.typeList.variadic) {
            ret.addElementType(transformVariadicType(var));
        }
        ret.endToken = tokens.token("]", rbracket);
        return ret;
    }
    
    shared actual JStaticType transformType(Type that) {
        assert (is JStaticType ret = super.transformType(that));
        return ret;
    }
    
    shared actual JTypedDeclaration transformTypedDeclaration(TypedDeclaration that) {
        assert (is JTypedDeclaration ret = super.transformTypedDeclaration(that));
        return ret;
    }
    
    "The usage of [[TypedVariable]] in `ceylon.ast` differs significantly
     from the usage of [[Variable|JVariable]] in the RedHat AST, to the point
     where a conversion at the level of individual variable nodes isn’t possible."
    shared actual Nothing transformTypedVariable(TypedVariable that) {
        throw AssertionError("Can’t transform a ceylon.ast TypedVariable to a RedHat AST Variable");
    }
    
    shared actual JStaticType transformTypeArgument(TypeArgument that) {
        JTypeVariance? jVariance;
        if (exists variance = that.variance) {
            jVariance = transformVariance(variance);
        } else {
            jVariance = null;
        }
        value jType = transformType(that.type);
        if (exists jVariance) {
            jType.typeVariance = jVariance;
        }
        return jType;
    }
    
    shared actual JTypeArgumentList transformTypeArguments(TypeArguments that) {
        JTypeArgumentList ret = JTypeArgumentList(tokens.token("<", smaller_op));
        ret.addType(transformTypeArgument(that.typeArguments.first));
        for (typeArgument in that.typeArguments.rest) {
            ret.endToken = tokens.token(",", comma);
            ret.addType(transformTypeArgument(typeArgument));
        }
        ret.endToken = tokens.token(">", larger_op);
        return ret;
    }
    
    shared actual JTypeConstraint transformTypeConstraint(TypeConstraint that) {
        JTypeConstraint ret = JTypeConstraint(tokens.token("given", type_constraint));
        ret.identifier = transformUIdentifier(that.parameterName);
        if (exists caseTypes = that.caseTypes) {
            ret.caseTypes = transformCaseTypes(caseTypes);
        }
        if (exists satisfiedTypes = that.satisfiedTypes) {
            ret.satisfiedTypes = transformSatisfiedTypes(satisfiedTypes);
        }
        return ret;
    }
    
    shared actual JTypeDeclaration transformTypeDeclaration(TypeDeclaration that) {
        assert (is JTypeDeclaration ret = super.transformTypeDeclaration(that));
        return ret;
    }
    
    shared actual JType transformTypeIsh(TypeIsh that) {
        assert (is JType ret = super.transformTypeIsh(that));
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[TypeList]];
     this method throws."
    shared actual Nothing transformTypeList(TypeList that) {
        throw Exception("TypeList has no RedHat AST equivalent!");
    }
    
    "The RedHat AST has no direct equivalent of [[TypeNameWithTypeArguments]];
     this method throws."
    shared actual Nothing transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) {
        throw Exception("TypeNameWithTypeArguments has no RedHat AST equivalent!");
    }
    
    shared actual JTypeParameterDeclaration transformTypeParameter(TypeParameter that) {
        JTypeParameterDeclaration ret = JTypeParameterDeclaration(null);
        if (exists variance = that.variance) {
            ret.typeVariance = transformVariance(variance);
        }
        ret.identifier = transformUIdentifier(that.parameterName);
        if (exists defaultArgument = that.defaultArgument) {
            JDefaultTypeArgument arg = JDefaultTypeArgument(tokens.token("=", specify));
            arg.type = transformType(defaultArgument);
            ret.typeSpecifier = arg;
        }
        return ret;
    }
    
    shared actual JTypeParameterList transformTypeParameters(TypeParameters that) {
        JTypeParameterList ret = JTypeParameterList(tokens.token("<", smaller_op));
        ret.addTypeParameterDeclaration(transformTypeParameter(that.typeParameters.first));
        for (typeParameter in that.typeParameters.rest) {
            ret.endToken = tokens.token(",", comma);
            ret.addTypeParameterDeclaration(transformTypeParameter(typeParameter));
        }
        ret.endToken = tokens.token(">", larger_op);
        return ret;
    }
    
    shared actual JTypeSpecifier transformTypeSpecifier(TypeSpecifier that) {
        JTypeSpecifier ret = JTypeSpecifier(tokens.token("=>", compute));
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JIdentifier transformUIdentifier(UIdentifier that)
            => JIdentifier(tokens.token(that.name, uidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JStaticType transformUnionableType(UnionableType that) {
        assert (is JStaticType ret = super.transformUnionableType(that));
        return ret;
    }
    
    "The usage of [[UnspecifiedVariable]] in `ceylon.ast` differs significantly
     from the usage of [[Variable|JVariable]] in the RedHat AST, to the point
     where a conversion at the level of individual variable nodes isn’t possible."
    shared actual Nothing transformUnspecifiedVariable(UnspecifiedVariable that) {
        throw AssertionError("Can’t transform a ceylon.ast UnspecifiedVariable to a RedHat AST Variable");
    }
    
    shared actual JTypeLiteral transformTypeDec(TypeDec that) {
        assert (is JTypeLiteral ret = super.transformTypeDec(that));
        return ret;
    }
    shared actual JTypeLiteral transformTypeMeta(TypeMeta that) {
        JTypeLiteral ret = JTypeLiteral(tokens.token("`", backtick));
        ret.type = transformType(that.type);
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JNegativeOp|JPositiveOp transformUnaryArithmeticOperation(UnaryArithmeticOperation that) {
        assert (is JNegativeOp|JPositiveOp ret = super.transformUnaryArithmeticOperation(that));
        return ret;
    }
    
    shared actual JUnaryOperatorExpression transformUnaryIshOperation(UnaryIshOperation that) {
        assert (is JUnaryOperatorExpression ret = super.transformUnaryIshOperation(that));
        return ret;
    }
    
    shared actual JUnaryOperatorExpression transformUnaryOperation(UnaryOperation that) {
        assert (is JUnaryOperatorExpression ret = super.transformUnaryOperation(that));
        return ret;
    }
    shared actual JTypeOperatorExpression transformUnaryTypeOperation(UnaryTypeOperation that) {
        assert (is JTypeOperatorExpression ret = super.transformUnaryTypeOperation(that));
        return ret;
    }
    
    shared actual JUnionAssignOp transformUnionAssignmentOperation(UnionAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JUnionAssignOp ret = JUnionAssignOp(tokens.token(that.operator, union_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JUnionOp transformUnionOperation(UnionOperation that) {
        JTerm left = transformPrecedence5Expression(that.leftOperand);
        JUnionOp ret = JUnionOp(tokens.token(that.operator, union_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence4Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JUnionType transformUnionType(UnionType that) {
        JUnionType ret = JUnionType(null);
        value firstType = that.children.first;
        switch (firstType)
        case (is PrimaryType) { ret.addStaticType(transformPrimaryType(firstType)); }
        case (is IntersectionType) { ret.addStaticType(transformIntersectionType(firstType)); }
        for (elementType in that.children.rest) {
            tokens.token("&", union_op);
            switch (elementType)
            case (is PrimaryType) { ret.addStaticType(transformPrimaryType(elementType)); }
            case (is IntersectionType) { ret.addStaticType(transformIntersectionType(elementType)); }
        }
        return ret;
    }
    
    shared actual JValueLiteral transformValueDec(ValueDec that) {
        JValueLiteral ret = JValueLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token(that.keyword, object_definition);
        helpTransformMemberDec(that, ret);
        return ret;
    }
    
    shared actual JAttributeDeclaration transformValueDeclaration(ValueDeclaration that) {
        JAttributeDeclaration ret = JAttributeDeclaration(null);
        ret.annotationList = transformAnnotations(that.annotations);
        value type = that.type;
        switch (type)
        case (is Type) { ret.type = transformType(type); }
        case (is VariadicType) { ret.type = transformVariadicType(type); }
        case (is DynamicModifier) { ret.type = transformDynamicModifier(type); }
        ret.identifier = transformLIdentifier(that.name);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JAttributeDeclaration transformValueDefinition(ValueDefinition that) {
        value annotations = transformAnnotations(that.annotations);
        JAttributeDeclaration ret;
        JType|JValueModifier|JDynamicModifier jType;
        value type = that.type;
        switch (type)
        case (is Type) {
            jType = transformType(type);
            ret = JAttributeDeclaration(null);
        }
        case (is ValueModifier) {
            jType = transformValueModifier(type);
            ret = JAttributeDeclaration(jType.mainToken);
        }
        case (is DynamicModifier) {
            jType = transformDynamicModifier(type);
            ret = JAttributeDeclaration(null);
        }
        ret.annotationList = annotations;
        ret.type = jType;
        ret.identifier = transformLIdentifier(that.name);
        ret.specifierOrInitializerExpression = transformAnySpecifier(that.definition);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JTerm transformValueExpression(ValueExpression that) {
        assert (is JTerm ret = super.transformValueExpression(that));
        return ret;
    }
    
    shared actual JAttributeGetterDefinition transformValueGetterDefinition(ValueGetterDefinition that) {
        value annotations = transformAnnotations(that.annotations);
        JAttributeGetterDefinition ret;
        JType|JValueModifier|JDynamicModifier jType;
        value type = that.type;
        switch (type)
        case (is Type) {
            jType = transformType(type);
            ret = JAttributeGetterDefinition(null);
        }
        case (is ValueModifier) {
            jType = transformValueModifier(type);
            ret = JAttributeGetterDefinition(jType.mainToken);
        }
        case (is DynamicModifier) {
            jType = transformDynamicModifier(type);
            ret = JAttributeGetterDefinition(null);
        }
        ret.annotationList = annotations;
        ret.type = jType;
        ret.identifier = transformLIdentifier(that.name);
        ret.block = transformBlock(that.definition);
        return ret;
    }
    
    shared actual JValueIterator transformValueIterator(ValueIterator that) {
        JValueIterator ret = JValueIterator(tokens.token("(", lparen));
        value variable = that.variable;
        value var = JVariable(null);
        value type = variable.type;
        switch (type)
        case (is Type) { var.type = transformType(type); }
        case (is ValueModifier) { var.type = transformValueModifier(type); }
        case (null) { var.type = JValueModifier(null); }
        var.identifier = transformLIdentifier(variable.name);
        ret.variable = var;
        value jSpecifierExpression = JSpecifierExpression(tokens.token("in", in_op));
        jSpecifierExpression.expression = wrapTerm(transformExpression(that.iterated));
        ret.specifierExpression = jSpecifierExpression;
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JValueModifier transformValueModifier(ValueModifier that) {
        JValueModifier ret = JValueModifier(tokens.token(that.text, value_modifier));
        return ret;
    }
    
    shared actual JValueParameterDeclaration transformValueParameter(ValueParameter that) {
        JValueParameterDeclaration ret = JValueParameterDeclaration(null);
        JAttributeDeclaration dec = JAttributeDeclaration(null);
        dec.annotationList = transformAnnotations(that.annotations);
        value type = that.type;
        switch (type)
        case (is Type) { dec.type = transformType(type); }
        case (is DynamicModifier) { dec.type = transformDynamicModifier(type); }
        dec.identifier = transformLIdentifier(that.name);
        ret.typedDeclaration = dec;
        return ret;
    }
    
    shared actual JAttributeSetterDefinition transformValueSetterDefinition(ValueSetterDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JAttributeSetterDefinition ret = JAttributeSetterDefinition(tokens.token("assign", assignType));
        ret.annotationList = annotationList;
        ret.identifier = transformLIdentifier(that.name);
        value definition = that.definition;
        switch (definition)
        case (is Block) { ret.block = transformBlock(definition); }
        case (is LazySpecifier) {
            ret.specifierExpression = transformLazySpecifier(definition);
            ret.endToken = tokens.token(";", semicolon);
        }
        return ret;
    }
    
    shared actual JSpecifierStatement transformValueSpecification(ValueSpecification that) {
        JTerm baseMemberExpression = transformBaseExpression(BaseExpression(MemberNameWithTypeArguments(that.name)));
        JSpecifierStatement ret = JSpecifierStatement(null);
        ret.baseMemberExpression = baseMemberExpression;
        ret.specifierExpression = transformSpecifier(that.specifier);
        return ret;
    }
    
    "The usage of [[Variable]] in `ceylon.ast` differs significantly
     from the usage of [[Variable|JVariable]] in the RedHat AST, to the point
     where a conversion at the level of individual variable nodes isn’t possible."
    shared actual Nothing transformVariable(Variable that) {
        throw AssertionError("Can’t transform a ceylon.ast Variable to a RedHat AST Variable");
    }
    
    shared actual JValueParameterDeclaration transformVariadicParameter(VariadicParameter that) {
        JValueParameterDeclaration ret = JValueParameterDeclaration(null);
        JAttributeDeclaration dec = JAttributeDeclaration(null);
        dec.annotationList = transformAnnotations(that.annotations);
        dec.type = transformVariadicType(that.type);
        dec.identifier = transformLIdentifier(that.name);
        ret.typedDeclaration = dec;
        return ret;
    }
    
    shared actual JSequencedType transformVariadicType(VariadicType that) {
        JSequencedType ret = JSequencedType(null);
        ret.type = transformType(that.elementType);
        if (that.isNonempty) {
            ret.endToken = tokens.token("+", sum_op);
        } else {
            ret.endToken = tokens.token("*", product_op);
        }
        ret.atLeastOne = that.isNonempty;
        return ret;
    }
    
    shared actual JTypeVariance transformVariance(Variance that) {
        assert (is JTypeVariance ret = super.transformVariance(that));
        return ret;
    }
    
    shared actual JVoidModifier transformVoidModifier(VoidModifier that) {
        JVoidModifier ret = JVoidModifier(tokens.token(that.text, void_modifier));
        return ret;
    }
    
    shared actual JWhileStatement transformWhile(While that) {
        JWhileStatement ret = JWhileStatement(null);
        JWhileClause whileClause = JWhileClause(tokens.token("while", while_clause));
        whileClause.conditionList = transformConditions(that.conditions);
        whileClause.block = transformBlock(that.block);
        ret.whileClause = whileClause;
        return ret;
    }
    
    shared actual JWithinOp transformWithinOperation(WithinOperation that) {
        JWithinOp ret = JWithinOp(null);
        that.lowerBound.put(isLowerBoundKey, true);
        ret.lowerBound = transformBound(that.lowerBound);
        that.lowerBound.remove(isLowerBoundKey);
        ret.term = transformPrecedence10Expression(that.operand);
        that.upperBound.put(isLowerBoundKey, false);
        ret.upperBound = transformBound(that.upperBound);
        that.upperBound.remove(isLowerBoundKey);
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[ClassInstantiation]];
     it’s partially inlined into `ExtendedType` and `ClassSpecifier`.
     This is a helper function for those conversions."
    [JSimpleType, JInvocationExpression] helpTransformClassInstantiation(ClassInstantiation that) {
        JSimpleType type;
        if (that.qualifier exists) {
            JQualifiedType qt = JQualifiedType(null);
            JSuperType st = JSuperType(tokens.token("super", superType));
            tokens.token(".", member_op);
            qt.outerType = st;
            type = qt;
        } else {
            type = JBaseType(null);
        }
        type.identifier = transformUIdentifier(that.name.name);
        if (exists typeArgs = that.name.typeArguments) {
            type.typeArgumentList = transformTypeArguments(typeArgs);
        }
        JInvocationExpression ie = JInvocationExpression(null);
        JExtendedTypeExpression ete = JExtendedTypeExpression(null);
        ete.setExtendedType(type); // there’s no getter, so Ceylon doesn’t see it as a variable attribute
        ie.primary = ete;
        ie.positionalArgumentList = transformPositionalArguments(that.arguments);
        return [type, ie];
    }
    
    JStaticType|JBaseMemberExpression helpTransformDecQualifier(DecQualifier that) {
        value components = that.components;
        switch (components)
        case (is [UIdentifier+]) {
            /*
              the grammar just reuses the type rule – see also
              https://github.com/ceylon/ceylon-spec/issues/1058 –
              so we transform it into a base or qualified type and then
              likewise reuse transformType
             */
            variable SimpleType type = BaseType(TypeNameWithTypeArguments(components.first));
            for (component in components.rest) {
                type = QualifiedType(type, TypeNameWithTypeArguments(component));
            }
            return transformType(type);
        }
        case (is [LIdentifier]) {
            value bme = JBaseMemberExpression(null);
            bme.identifier = transformLIdentifier(components[0]);
            bme.typeArguments = JInferredTypeArguments(null);
            return bme;
        }
    }
    
    JCond helpTransformExistsOrNonemptyCondition<JCond>(JCond ret, SpecifiedVariable|LIdentifier variable)
            given JCond satisfies JExistsOrNonemptyCondition {
        JVariable var = JVariable(null);
        switch (variable)
        case (is SpecifiedVariable) {
            value type = variable.type;
            switch (type)
            case (is Type) { var.type = transformType(type); }
            case (is ValueModifier) { var.type = transformValueModifier(type); }
            case (null) { var.type = JValueModifier(null); }
            var.identifier = transformLIdentifier(variable.name);
            var.specifierExpression = transformSpecifier(variable.specifier);
        }
        case (is LIdentifier) {
            var.identifier = transformLIdentifier(variable);
            // the parser does lots of stuff here (impliedVariable rule), I assume the compiler needs it?
            var.type = JSyntheticVariable(null);
            value se = JSpecifierExpression(null);
            value e = JExpression(null);
            value bme = JBaseMemberExpression(null);
            bme.identifier = var.identifier;
            bme.typeArguments = JInferredTypeArguments(null);
            e.term = bme;
            se.expression = e;
            var.specifierExpression = se;
        }
        ret.variable = var;
        return ret;
    }
    
    void helpTransformMemberDec(MemberDec that, JMemberLiteral ret) {
        if (exists qualifier = that.qualifier) {
            value jQualifier = helpTransformDecQualifier(qualifier);
            switch (jQualifier)
            case (is JStaticType) { ret.type = jQualifier; }
            case (is JBaseMemberExpression) { ret.objectExpression = jQualifier; }
            ret.endToken = tokens.token(".", member_op);
        }
        ret.identifier = transformLIdentifier(that.name);
        ret.endToken = tokens.token("`", backtick);
    }
    
    JExpression wrapTerm(JTerm term) {
        value expression = JExpression(null);
        expression.term = term;
        return expression;
    }
}
