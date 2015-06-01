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
        JAnyInterface=AnyInterface,
        JAnyMethod=AnyMethod,
        JArgumentList=ArgumentList,
        JArithmeticAssignmentOp=ArithmeticAssignmentOp,
        JArithmeticOp=ArithmeticOp,
        JAssertion=Assertion,
        JAssignmentOp=AssignmentOp,
        JAssignOp=AssignOp,
        JAtom=Atom,
        JAttributeArgument=AttributeArgument,
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
        JConstructor=Constructor,
        JContinue=Continue,
        JControlStatement=ControlStatement,
        JDeclaration=Declaration,
        JDecrementOp=DecrementOp,
        JDefaultedType=DefaultedType,
        JDefaultOp=DefaultOp,
        JDefaultTypeArgument=DefaultTypeArgument,
        JDelegatedConstructor=DelegatedConstructor,
        JDestructure=Destructure,
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
        JIfExpression=IfExpression,
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
        JInterfaceDeclaration=InterfaceDeclaration,
        JInterfaceDefinition=InterfaceDefinition,
        JInterfaceLiteral=InterfaceLiteral,
        JIntersectAssignOp=IntersectAssignOp,
        JIntersectionOp=IntersectionOp,
        JIntersectionType=IntersectionType,
        JInvocationExpression=InvocationExpression,
        JIsCase=IsCase,
        JIsCondition=IsCondition,
        JIsOp=IsOp,
        JIterableType=IterableType,
        JKeyValuePattern=KeyValuePattern,
        JLargeAsOp=LargeAsOp,
        JLargerOp=LargerOp,
        JLazySpecifierExpression=LazySpecifierExpression,
        JLetClause=LetClause,
        JLetExpression=LetExpression,
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
        JMethodArgument=MethodArgument,
        JMethodDeclaration=MethodDeclaration,
        JMethodDefinition=MethodDefinition,
        JModuleDescriptor=ModuleDescriptor,
        JModuleLiteral=ModuleLiteral,
        JMultiplyAssignOp=MultiplyAssignOp,
        JNamedArgument=NamedArgument,
        JNamedArgumentList=NamedArgumentList,
        JNegativeOp=NegativeOp,
        JNewLiteral=NewLiteral,
        JNonempty=Nonempty,
        JNonemptyCondition=NonemptyCondition,
        JNotEqualOp=NotEqualOp,
        JNotOp=NotOp,
        JObjectArgument=ObjectArgument,
        JObjectDefinition=ObjectDefinition,
        JObjectExpression=ObjectExpression,
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
        JParameterizedExpression=ParameterizedExpression,
        JPattern=Pattern,
        JPatternIterator=PatternIterator,
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
        JSpreadType=SpreadType,
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
        JSwitchExpression=SwitchExpression,
        JSwitchStatement=SwitchStatement,
        JSwitched=Switched,
        JSyntheticVariable=SyntheticVariable,
        JTerm=Term,
        JThenOp=ThenOp,
        JThis=This,
        JThrow=Throw,
        JTryCatchStatement=TryCatchStatement,
        JTryClause=TryClause,
        JTuple=Tuple,
        JTuplePattern=TuplePattern,
        JTupleType=TupleType,
        JTypeAliasDeclaration=TypeAliasDeclaration,
        JTypeArgumentList=TypeArgumentList,
        JTypeConstraint=TypeConstraint,
        JTypeConstriantList=TypeConstraintList,
        JTypeParameterDeclaration=TypeParameterDeclaration,
        JTypeParameterList=TypeParameterList,
        JTypeSpecifier=TypeSpecifier,
        JTypedArgument=TypedArgument,
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
        JValueIterator=ValueIterator,
        JValueLiteral=ValueLiteral,
        JValueModifier=ValueModifier,
        JValueParameterDeclaration=ValueParameterDeclaration,
        JVariable=Variable,
        JVariablePattern=VariablePattern,
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
        letType=\iLET,
        lidentifier=\iLIDENTIFIER,
        lparen=\iLPAREN,
        member_op=\iMEMBER_OP,
        moduleType=\iMODULE,
        multiply_specify=\iMULTIPLY_SPECIFY,
        newType=\iNEW,
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

"A [[Transformer]] from `ceylon.ast` to the RedHat AST.
 
 Sample usage:
 
     JCompilationUnit redHatCU
         = RedHatTransformer(SimpleTokenFactory())
             .transformCompilationUnit(ceylonAstCU);
 
 If your [[TokenFactory]] supports resets, or you don’t care
 about the properties of the generated tokens, you may reuse
 a [[RedHatTransformer]] instance to transform several nodes
 without problems.
 
 All tokens present in source code are requested from the
 [[token factory|tokens]], even if they won’t be reachable
 from the transformed RedHat AST node; your [[TokenFactory]]
 implementation may track them, and later offer them as a
 `TokenSource` or `TokenStream`, for example.
 Note however that no whitespace tokens are generated,
 and thus simply concatenating all the tokens will not give
 you valid Ceylon code for the transformed node(s)."
shared class RedHatTransformer(TokenFactory tokens) satisfies ImmediateNarrowingTransformer<JNode> {
    
    value isLowerBoundKey = ScopedKey<Boolean>(`class RedHatTransformer`, "isLowerBound");
    
    shared actual JAddAssignOp transformAddAssignmentOperation(AddAssignmentOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JAddAssignOp ret = JAddAssignOp(tokens.token(that.operator, add_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
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
        value bt = tokens.token("`", backtick);
        JAliasLiteral ret = JAliasLiteral(null);
        ret.endToken = tokens.token(that.keyword, aliasType);
        ret.type = helpTransformDecQualifier(DecQualifier(that.qualifier.components.withTrailing(that.name), that.qualifier.packageQualifier));
        ret.endToken = null;
        ret.token = bt;
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JAndAssignOp transformAndAssignmentOperation(AndAssignmentOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JAndAssignOp ret = JAndAssignOp(tokens.token(that.operator, and_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JAndOp transformAndOperation(AndOperation that) {
        JTerm left = transformConjoiningExpression(that.leftOperand);
        JAndOp ret = JAndOp(tokens.token(that.operator, and_op));
        ret.leftTerm = left;
        ret.rightTerm = transformConjoiningExpression(that.rightOperand);
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
        ret.endToken = tokens.token(";", semicolon);
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
    
    shared actual JAnyInterface transformAnyInterface(AnyInterface that) {
        assert (is JAnyInterface ret = super.transformAnyInterface(that));
        return ret;
    }
    
    shared actual JInterfaceDefinition transformAnyInterfaceDefinition(AnyInterfaceDefinition that) {
        value annotations = transformAnnotations(that.annotations);
        JInterfaceDefinition ret;
        switch (that)
        case (is InterfaceDefinition) {
            ret = JInterfaceDefinition(tokens.token("interface", interface_definition));
        }
        case (is DynamicInterfaceDefinition) {
            ret = JInterfaceDefinition(tokens.token("dynamic", dynamicType));
            ret.\idynamic = true;
        }
        // everything else is common for regular and dynamic interface definitions
        ret.annotationList = annotations;
        ret.identifier = transformUIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        if (exists caseTypes = that.caseTypes) {
            ret.caseTypes = transformCaseTypes(caseTypes);
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
        ret.interfaceBody = transformInterfaceBody(that.body);
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
        JTerm left = transformThenElseExpression(that.leftOperand);
        JAssignOp ret = JAssignOp(tokens.token(that.operator, specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
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
        value bt = tokens.token("`", backtick);
        JMemberLiteral ret = JMemberLiteral(null);
        if (that.packageQualifier exists) {
            ret.token = tokens.token("package", packageType);
            ret.endToken = tokens.token(".", member_op);
            ret.endToken = null;
            ret.packageQualified = true;
        }
        ret.identifier = transformIdentifier(that.nameAndArgs.name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArgumentList = transformTypeArguments(typeArguments);
        }
        ret.token = bt;
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JBaseType transformBaseType(BaseType that) {
        JBaseType ret;
        if (that.qualifier exists) {
            ret = JBaseType(tokens.token("package", packageType));
            ret.packageQualified = true;
            ret.endToken = tokens.token(".", member_op);
            ret.endToken = null;
        } else {
            ret = JBaseType(null);
        }
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
        case (is Type) {
            dec.type = transformType(type);
        }
        case (is VoidModifier) {
            dec.type = transformVoidModifier(type);
        }
        case (is FunctionModifier) {
            dec.type = transformFunctionModifier(type);
        }
        case (is DynamicModifier) {
            dec.type = transformDynamicModifier(type);
        }
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
        switch (argumentTypes = that.argumentTypes)
        case (is TypeList) {
            for (elementType in argumentTypes.elements) {
                switch (elementType)
                case (is Type) { ret.addArgumentType(transformType(elementType)); }
                case (is DefaultedType) { ret.addArgumentType(transformDefaultedType(elementType)); }
            }
            if (exists var = argumentTypes.variadic) {
                ret.addArgumentType(transformVariadicType(var));
            }
        }
        case (is SpreadType) {
            ret.addArgumentType(transformSpreadType(argumentTypes));
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
    
    "The RedHat AST has no direct equivalent of [[CaseExpression]];
     this method throws."
    shared actual Nothing transformCaseExpression(CaseExpression that) {
        throw AssertionError("CaseExpression has no RedHat AST equivalent!");
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
    
    shared actual JClassDeclaration transformClassAliasDefinition(ClassAliasDefinition that) {
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
        value bt = tokens.token("`", backtick);
        JClassLiteral ret = JClassLiteral(null);
        ret.endToken = tokens.token(that.keyword, class_definition);
        if (exists name = that.name) {
            assert (exists qualifier = that.qualifier);
            ret.type = helpTransformDecQualifier(DecQualifier(qualifier.components.withTrailing(name), qualifier.packageQualifier));
            ret.endToken = null;
        }
        ret.token = bt;
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
        if (exists parameters = that.parameters) {
            ret.parameterList = transformParameters(parameters);
        }
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
            endpoint = transformExistsNonemptyExpression(that.endpoint);
            token = tokens.token("<=", small_as_op);
        } else {
            // upper bound: token, then endpoint
            token = tokens.token("<=", small_as_op);
            endpoint = transformExistsNonemptyExpression(that.endpoint);
        }
        JClosedBound ret = JClosedBound(null); // TODO JClosedBound(token)? the compiler grammar doesn’t do it, but I don’t see why not
        ret.term = endpoint;
        return ret;
    }
    
    shared actual JCompareOp transformCompareOperation(CompareOperation that) {
        JTerm left = transformExistsNonemptyExpression(that.leftOperand);
        JCompareOp ret = JCompareOp(tokens.token(that.operator, compare_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExistsNonemptyExpression(that.rightOperand);
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
        JTerm left = transformThenElseExpression(that.leftOperand);
        JComplementAssignOp ret = JComplementAssignOp(tokens.token(that.operator, complement_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JComplementOp transformComplementOperation(ComplementOperation that) {
        JTerm left = transformUnioningExpression(that.leftOperand);
        JComplementOp ret = JComplementOp(tokens.token(that.operator, complement_op));
        ret.leftTerm = left;
        ret.rightTerm = transformIntersectingExpression(that.rightOperand);
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
    
    shared actual JIfExpression|JSwitchExpression transformConditionalExpression(ConditionalExpression that) {
        assert (is JIfExpression|JSwitchExpression ret = super.transformConditionalExpression(that));
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
    
    shared actual JNewLiteral transformConstructorDec(ConstructorDec that) {
        value bt = tokens.token("`", backtick);
        JNewLiteral ret = JNewLiteral(null);
        ret.endToken = tokens.token(that.keyword, newType);
        ret.type = helpTransformDecQualifier(DecQualifier(that.qualifier.components.withTrailing(that.name), that.qualifier.packageQualifier));
        ret.endToken = null;
        ret.token = bt;
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JConstructor transformConstructorDefinition(ConstructorDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JConstructor ret = JConstructor(tokens.token("new", newType));
        ret.annotationList = annotationList;
        if (exists name = that.name) {
            ret.identifier = transformUIdentifier(name);
        }
        ret.parameterList = transformParameters(that.parameters);
        if (exists extendedType = that.extendedType) {
            value jET = transformExtendedType(extendedType);
            value delegatedConstructor = JDelegatedConstructor(jET.mainToken);
            delegatedConstructor.type = jET.type;
            delegatedConstructor.invocationExpression = jET.invocationExpression;
            ret.delegatedConstructor = delegatedConstructor;
        }
        ret.block = transformBlock(that.block);
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
    
    shared actual JSpreadType transformSpreadType(SpreadType that) {
        JSpreadType ret = JSpreadType(tokens.token("*", product_op));
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JValueParameterDeclaration transformDefaultedValueParameter(DefaultedValueParameter that) {
        JValueParameterDeclaration ret = JValueParameterDeclaration(null);
        assert (is JAttributeDeclaration dec = transformValueParameter(that.parameter).typedDeclaration);
        dec.specifierOrInitializerExpression = transformSpecifier(that.specifier);
        ret.typedDeclaration = dec;
        return ret;
    }
    
    shared actual JDestructure transformDestructure(Destructure that) {
        value vm = transformValueModifier(that.valueModifier);
        JDestructure ret = JDestructure(null);
        ret.type = vm;
        ret.pattern = transformPattern(that.pattern);
        ret.specifierExpression = transformSpecifier(that.specifier);
        return ret;
    }
    
    shared actual JDifferenceOp transformDifferenceOperation(DifferenceOperation that) {
        JTerm left = transformAddingExpression(that.leftOperand);
        JDifferenceOp ret = JDifferenceOp(tokens.token(that.operator, difference_op));
        ret.leftTerm = left;
        ret.rightTerm = transformScalingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JDirective transformDirective(Directive that) {
        assert (is JDirective ret = super.transformDirective(that));
        return ret;
    }
    
    shared actual JDivideAssignOp transformDivideAssignmentOperation(DivideAssignmentOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JDivideAssignOp ret = JDivideAssignOp(tokens.token(that.operator, divide_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JDynamicStatement transformDynamicBlock(DynamicBlock that) {
        JDynamicStatement ret = JDynamicStatement(null);
        JDynamicClause clause = JDynamicClause(tokens.token("dynamic", dynamicType));
        clause.block = transformBlock(that.block);
        ret.dynamicClause = clause;
        return ret;
    }
    
    shared actual JInterfaceDefinition transformDynamicInterfaceDefinition(DynamicInterfaceDefinition that)
            => transformAnyInterfaceDefinition(that);
    
    shared actual JDynamicModifier transformDynamicModifier(DynamicModifier that) {
        JDynamicModifier ret = JDynamicModifier(tokens.token("dynamic", dynamicType));
        return ret;
    }
    
    shared actual JDynamic transformDynamicValue(DynamicValue that) {
        JDynamic ret = JDynamic(tokens.token("dynamic", dynamicType));
        JNamedArgumentList namedArgList = JNamedArgumentList(tokens.token("[", lbracket));
        for (namedArgument in that.namedArguments) {
            namedArgList.addNamedArgument(transformNamedArgument(namedArgument));
        }
        if (that.iterableArgument.children nonempty) {
            namedArgList.sequencedArgument = transformArgumentList(that.iterableArgument);
        }
        namedArgList.endToken = tokens.token("]", rbracket);
        ret.namedArgumentList = namedArgList;
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
        JTerm left = transformThenElseExpression(that.leftOperand);
        JDefaultOp ret = JDefaultOp(tokens.token(that.operator, else_clause));
        ret.leftTerm = left;
        ret.rightTerm = transformDisjoiningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JEntryOp transformEntryOperation(EntryOperation that) {
        JTerm left = transformAddingExpression(that.leftOperand);
        JEntryOp ret = JEntryOp(tokens.token(that.operator, entry_op));
        ret.leftTerm = left;
        ret.rightTerm = transformAddingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JKeyValuePattern transformEntryPattern(EntryPattern that) {
        JKeyValuePattern ret = JKeyValuePattern(null);
        ret.key = transformPattern(that.key);
        ret.endToken = tokens.token("->", entry_op);
        ret.\ivalue = transformPattern(that.item);
        ret.endToken = null;
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
        JTerm left = transformComparingExpression(that.leftOperand);
        JEqualOp ret = JEqualOp(tokens.token(that.operator, equal_op));
        ret.leftTerm = left;
        ret.rightTerm = transformComparingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JEqualityOp|JIdenticalOp transformEqualityOperation(EqualityOperation that) {
        assert (is JEqualityOp|JIdenticalOp ret = super.transformEqualityOperation(that));
        return ret;
    }
    
    shared actual JExistsCondition transformExistsCondition(ExistsCondition that) {
        JExistsCondition ret = JExistsCondition(tokens.token("exists", exists_op));
        return helpTransformExistsOrNonemptyCondition(ret, that);
    }
    
    shared actual JExists transformExistsOperation(ExistsOperation that) {
        JTerm term = transformSpanningExpression(that.operand);
        JExists ret = JExists(tokens.token(that.operator, exists_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JExistsOrNonemptyCondition transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) {
        assert (is JExistsOrNonemptyCondition ret = super.transformExistsOrNonemptyCondition(that));
        return ret;
    }
    
    shared actual JPowerOp transformExponentiationOperation(ExponentiationOperation that) {
        value left = transformPrePostfixingExpression(that.leftOperand);
        JPowerOp ret = JPowerOp(tokens.token(that.operator, power_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExponentiatingExpression(that.rightOperand);
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
        JForIterator ret;
        switch (pattern = that.pattern)
        case (is VariablePattern) {
            // Use ValueIterator instead of PatternIterator with VariablePattern
            value vi = JValueIterator(tokens.token("(", lparen));
            JVariable variable = JVariable(null);
            switch (type = pattern.variable.type)
            case (is Type) {
                variable.type = transformType(type);
            }
            case (is ValueModifier) {
                variable.type = transformValueModifier(type);
            }
            else {
                variable.type = JValueModifier(null);
            }
            variable.identifier = transformLIdentifier(pattern.variable.name);
            vi.variable = variable;
            ret = vi;
        }
        else {
            value pi = JPatternIterator(tokens.token("(", lparen));
            pi.pattern = transformPattern(pattern);
            ret = pi;
        }
        JSpecifierExpression containment = JSpecifierExpression(tokens.token("in", in_op));
        containment.expression = wrapTerm(transformExpression(that.iterated));
        ret.specifierExpression = containment;
        ret.endToken = tokens.token(")", rparen);
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
    
    shared actual JMethodArgument transformFunctionArgument(FunctionArgument that) {
        JMethodArgument ret = JMethodArgument(null);
        value type = that.type;
        switch (type)
        case (is Type) { ret.type = transformType(type); }
        case (is FunctionModifier) { ret.type = transformFunctionModifier(type); }
        case (is VoidModifier) { ret.type = transformVoidModifier(type); }
        case (is DynamicModifier) { ret.type = transformDynamicModifier(type); }
        ret.identifier = transformLIdentifier(that.name);
        for (parameters in that.parameterLists) {
            ret.addParameterList(transformParameters(parameters));
        }
        value definition = that.definition;
        switch (definition)
        case (is Block) { ret.block = transformBlock(definition); }
        case (is LazySpecifier) {
            ret.specifierExpression = transformLazySpecifier(definition);
            ret.endToken = tokens.token(";", semicolon);
        }
        return ret;
    }
    
    shared actual JFunctionLiteral transformFunctionDec(FunctionDec that) {
        value bt = tokens.token("`", backtick);
        JFunctionLiteral ret = JFunctionLiteral(null);
        ret.endToken = tokens.token(that.keyword, function_modifier);
        helpTransformMemberDec(that, ret);
        ret.token = bt;
        return ret;
    }
    
    shared actual JMethodDeclaration transformFunctionDeclaration(FunctionDeclaration that) {
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
        ret.endToken = tokens.token(";", semicolon);
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
        value bt = tokens.token("`", backtick);
        JTypeParameterLiteral ret = JTypeParameterLiteral(null);
        ret.endToken = tokens.token(that.keyword, type_constraint);
        ret.type = helpTransformDecQualifier(DecQualifier(that.qualifier.components.withTrailing(that.name), that.qualifier.packageQualifier));
        ret.endToken = null;
        ret.token = bt;
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
        JTerm left = transformComparingExpression(that.leftOperand);
        JIdenticalOp ret = JIdenticalOp(tokens.token(that.operator, identical_op));
        ret.leftTerm = left;
        ret.rightTerm = transformComparingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JPositiveOp transformIdentityOperation(IdentityOperation that) {
        JPositiveOp ret = JPositiveOp(tokens.token(that.operator, sum_op));
        ret.term = transformExponentiatingExpression(that.operand);
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
    
    shared actual JIfExpression transformIfElseExpression(IfElseExpression that) {
        JIfExpression ret = JIfExpression(tokens.token("if", if_clause));
        value cl = transformConditions(that.conditions);
        value ic = JIfClause(tokens.token("then", then_clause));
        ic.expression = wrapTerm(transformExpression(that.thenExpression));
        value ec = JElseClause(tokens.token("else", else_clause));
        ec.expression = wrapTerm(transformExpression(that.elseExpression));
        ret.ifClause = ic;
        ret.elseClause = ec;
        ic.conditionList = cl;
        // now comes lots of variable manipulation, pulled from the grammar
        value conditions = cl.conditions;
        if (conditions.size() == 1) {
            assert (exists c = conditions.get(0));
            JIdentifier? id;
            JType? t;
            if (is JExistsOrNonemptyCondition c, is JVariable v = c.variable) {
                t = v.type;
                id = v.identifier;
            } else if (is JIsCondition c, exists v = c.variable) {
                t = v.type;
                id = v.identifier;
            } else {
                t = null;
                id = null;
            }
            if (id exists, t is JSyntheticVariable) {
                value ev = JVariable(null);
                ev.type = JSyntheticVariable(null);
                value ese = JSpecifierExpression(null);
                value ee = JExpression(null);
                value ebme = JBaseMemberExpression(null);
                ebme.typeArguments = JInferredTypeArguments(null);
                ee.term = ebme;
                ese.expression = ee;
                ev.specifierExpression = ese;
                ec.variable = ev;
                ev.identifier = id;
                ebme.identifier = id;
            }
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
    
    shared actual JTypedArgument transformInlineDefinitionArgument(InlineDefinitionArgument that) {
        assert (is JTypedArgument ret = super.transformInlineDefinitionArgument(that));
        return ret;
    }
    
    shared actual JTypeVariance transformInModifier(InModifier that) {
        JTypeVariance ret = JTypeVariance(tokens.token(that.text, in_op));
        return ret;
    }
    
    shared actual JInOp transformInOperation(InOperation that) {
        JTerm left = transformExistsNonemptyExpression(that.leftOperand);
        JInOp ret = JInOp(tokens.token(that.operator, in_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExistsNonemptyExpression(that.rightOperand);
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
        value bt = tokens.token("`", backtick);
        JInterfaceLiteral ret = JInterfaceLiteral(null);
        ret.endToken = tokens.token(that.keyword, interface_definition);
        if (exists name = that.name) {
            assert (exists qualifier = that.qualifier);
            ret.type = helpTransformDecQualifier(DecQualifier(qualifier.components.withTrailing(name), qualifier.packageQualifier));
            ret.endToken = null;
        }
        ret.token = bt;
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JInterfaceDeclaration transformInterfaceAliasDefinition(InterfaceAliasDefinition that) {
        value annotations = transformAnnotations(that.annotations);
        JInterfaceDeclaration ret = JInterfaceDeclaration(tokens.token("interface", interface_definition));
        ret.annotationList = annotations;
        ret.identifier = transformUIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        if (exists caseTypes = that.caseTypes) {
            ret.caseTypes = transformCaseTypes(caseTypes);
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
        ret.typeSpecifier = transformTypeSpecifier(that.specifier);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JInterfaceDefinition transformInterfaceDefinition(InterfaceDefinition that)
            => transformAnyInterfaceDefinition(that);
    
    shared actual JIntersectAssignOp transformIntersectAssignmentOperation(IntersectAssignmentOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JIntersectAssignOp ret = JIntersectAssignOp(tokens.token(that.operator, intersect_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JIntersectionOp transformIntersectionOperation(IntersectionOperation that) {
        JTerm left = transformIntersectingExpression(that.leftOperand);
        JIntersectionOp ret = JIntersectionOp(tokens.token(that.operator, intersection_op));
        ret.leftTerm = left;
        ret.rightTerm = transformInvertingExpression(that.rightOperand);
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
        JTerm term = transformExistsNonemptyExpression(that.operand);
        JIsOp ret = JIsOp(tokens.token(that.operator, is_op));
        ret.term = term;
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JSequenceEnumeration transformIterable(Iterable that) {
        JSequenceEnumeration ret = JSequenceEnumeration(tokens.token("{", lbrace));
        if (that.argumentList.children nonempty) {
            ret.sequencedArgument = transformArgumentList(that.argumentList);
        }
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JIterableType transformIterableType(IterableType that) {
        JIterableType ret = JIterableType(tokens.token("{", lbrace));
        ret.elementType = transformVariadicType(that.variadicType);
        ret.endToken = tokens.token("}", rbrace);
        return ret;
    }
    
    shared actual JElement transformKeySubscript(KeySubscript that) {
        JElement ret = JElement(null);
        ret.expression = wrapTerm(transformExpression(that.key));
        return ret;
    }
    
    shared actual JLargeAsOp transformLargeAsOperation(LargeAsOperation that) {
        JTerm left = transformExistsNonemptyExpression(that.leftOperand);
        JLargeAsOp ret = JLargeAsOp(tokens.token(that.operator, large_as_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExistsNonemptyExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JLargerOp transformLargerOperation(LargerOperation that) {
        JTerm left = transformExistsNonemptyExpression(that.leftOperand);
        JLargerOp ret = JLargerOp(tokens.token(that.operator, larger_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExistsNonemptyExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JSpecifierStatement transformLazySpecification(LazySpecification that) {
        JSpecifierStatement ret = JSpecifierStatement(null);
        JPrimary nameBME;
        if (exists qualifier = that.qualifier) {
            nameBME = transformQualifiedExpression(QualifiedExpression(qualifier, MemberNameWithTypeArguments(that.name)));
        } else {
            nameBME = transformBaseExpression(BaseExpression(MemberNameWithTypeArguments(that.name)));
        }
        if (nonempty parameterLists = that.parameterLists) {
            JParameterizedExpression pe = JParameterizedExpression(null);
            pe.primary = nameBME;
            for (parameters in parameterLists) {
                pe.addParameterList(transformParameters(parameters));
            }
            ret.baseMemberExpression = pe;
        } else {
            ret.baseMemberExpression = nameBME;
        }
        ret.specifierExpression = transformLazySpecifier(that.specifier);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
    }
    
    shared actual JLazySpecifierExpression transformLazySpecifier(LazySpecifier that) {
        JLazySpecifierExpression ret = JLazySpecifierExpression(tokens.token("=>", compute));
        ret.expression = wrapTerm(transformExpression(that.expression));
        return ret;
    }
    
    shared actual JIdentifier transformLIdentifier(LIdentifier that)
            => JIdentifier(tokens.token(that.name, lidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JLetExpression transformLetExpression(LetExpression that) {
        JLetExpression ret = JLetExpression(null);
        JLetClause letClause = JLetClause(tokens.token("let", letType));
        letClause.endToken = tokens.token("(", lparen);
        letClause.addVariable(helpTransformSpecifiedPattern(that.patterns.patterns.first));
        for (pattern in that.patterns.patterns.rest) {
            letClause.endToken = tokens.token(",", comma);
            letClause.addVariable(helpTransformSpecifiedPattern(pattern));
        }
        letClause.endToken = tokens.token(")", rparen);
        letClause.expression = wrapTerm(transformExpression(that.expression));
        letClause.endToken = null;
        ret.letClause = letClause;
        return ret;
    }
    
    shared actual JLiteral transformLiteral(Literal that) {
        assert (is JLiteral ret = super.transformLiteral(that));
        return ret;
    }
    
    shared actual JLocalModifier transformLocalModifier(LocalModifier that) {
        assert (is JLocalModifier ret = super.transformLocalModifier(that));
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
        JTerm left = transformAddingExpression(that.leftOperand);
        JSegmentOp ret = JSegmentOp(tokens.token(that.operator, segment_op));
        ret.leftTerm = left;
        ret.rightTerm = transformAddingExpression(that.rightOperand);
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
        value bt = tokens.token("`", backtick);
        JMemberLiteral ret = JMemberLiteral(null);
        ret.type = transformPrimaryType(that.qualifier);
        ret.endToken = tokens.token(".", member_op);
        ret.endToken = null;
        ret.identifier = transformIdentifier(that.nameAndArgs.name);
        if (exists typeArguments = that.nameAndArgs.typeArguments) {
            ret.typeArgumentList = transformTypeArguments(typeArguments);
        }
        ret.token = bt;
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
    
    shared actual JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance transformModifier(Modifier that) {
        assert (is JVoidModifier|JLocalModifier|JDynamicModifier|JTypeVariance ret = super.transformModifier(that)); // TODO more case types!
        return ret;
    }
    
    shared actual JModuleLiteral transformModuleDec(ModuleDec that) {
        value bt = tokens.token("`", backtick);
        JModuleLiteral ret = JModuleLiteral(null);
        ret.endToken = tokens.token("module", moduleType);
        if (exists moduleName = that.moduleName) {
            ret.importPath = transformFullPackageName(moduleName);
        }
        ret.token = bt;
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
        JTerm left = transformThenElseExpression(that.leftOperand);
        JMultiplyAssignOp ret = JMultiplyAssignOp(tokens.token(that.operator, multiply_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
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
        ret.term = transformExponentiatingExpression(that.operand);
        return ret;
    }
    
    shared actual JNonemptyCondition transformNonemptyCondition(NonemptyCondition that) {
        JNonemptyCondition ret = JNonemptyCondition(tokens.token("nonempty", nonempty_op));
        return helpTransformExistsOrNonemptyCondition(ret, that);
    }
    
    shared actual JNonempty transformNonemptyOperation(NonemptyOperation that) {
        JTerm term = transformSpanningExpression(that.operand);
        JNonempty ret = JNonempty(tokens.token(that.operator, nonempty_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JNotEqualOp transformNotEqualOperation(NotEqualOperation that) {
        JTerm left = transformComparingExpression(that.leftOperand);
        JNotEqualOp ret = JNotEqualOp(tokens.token(that.operator, not_equal_op));
        ret.leftTerm = left;
        ret.rightTerm = transformComparingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JNotOp transformNotOperation(NotOperation that) {
        JNotOp ret = JNotOp(tokens.token(that.operator, not_op));
        ret.term = transformNegatingExpression(that.operand);
        return ret;
    }
    
    shared actual JObjectArgument transformObjectArgument(ObjectArgument that) {
        JObjectArgument ret = JObjectArgument(tokens.token("object", object_definition));
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
    
    shared actual JObjectDefinition transformObjectDefinition(ObjectDefinition that) {
        value annotationList = transformAnnotations(that.annotations);
        JObjectDefinition ret = JObjectDefinition(tokens.token("object", object_definition));
        ret.type = JValueModifier(null);
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
    
    shared actual JObjectExpression transformObjectExpression(ObjectExpression that) {
        JObjectExpression ret = JObjectExpression(tokens.token("object", object_definition));
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
        JTerm term = transformExistsNonemptyExpression(that.operand);
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
            endpoint = transformExistsNonemptyExpression(that.endpoint);
            token = tokens.token("<", small_as_op);
        } else {
            // upper bound: token, then endpoint
            token = tokens.token("<", small_as_op);
            endpoint = transformExistsNonemptyExpression(that.endpoint);
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
        JTerm left = transformThenElseExpression(that.leftOperand);
        JOrAssignOp ret = JOrAssignOp(tokens.token(that.operator, or_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JOrOp transformOrOperation(OrOperation that) {
        JTerm left = transformDisjoiningExpression(that.leftOperand);
        JOrOp ret = JOrOp(tokens.token(that.operator, or_op));
        ret.leftTerm = left;
        ret.rightTerm = transformDisjoiningExpression(that.rightOperand);
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
        value bt = tokens.token("`", backtick);
        JPackageLiteral ret = JPackageLiteral(null);
        ret.endToken = tokens.token("package", packageType);
        if (exists packageName = that.packageName) {
            ret.importPath = transformFullPackageName(packageName);
        }
        ret.token = bt;
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
    
    "The RedHat AST has no direct equivalent of [[PackageQualifier]];
     this method throws."
    shared actual Nothing transformPackageQualifier(PackageQualifier that) {
        throw AssertionError("PackageQualifier has no RedHat AST equivalent!");
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
    
    shared actual JPattern transformPattern(Pattern that) {
        assert (is JPattern ret = super.transformPattern(that));
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[PatternList]];
     this method throws."
    shared actual Nothing transformPatternList(PatternList that) {
        throw Exception("PatternList has no RedHat AST equivalent!");
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
    
    shared actual JTerm transformPrePostfixingExpression(PrePostfixingExpression that) {
        assert (is JTerm ret = super.transformPrePostfixingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformExponentiatingExpression(ExponentiatingExpression that) {
        assert (is JTerm ret = super.transformExponentiatingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformInvertingExpression(InvertingExpression that) {
        assert (is JTerm ret = super.transformInvertingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformIntersectingExpression(IntersectingExpression that) {
        assert (is JTerm ret = super.transformIntersectingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformUnioningExpression(UnioningExpression that) {
        assert (is JTerm ret = super.transformUnioningExpression(that));
        return ret;
    }
    
    shared actual JTerm transformMultiplyingExpression(MultiplyingExpression that) {
        assert (is JTerm ret = super.transformMultiplyingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformScalingExpression(ScalingExpression that) {
        assert (is JTerm ret = super.transformScalingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformAddingExpression(AddingExpression that) {
        assert (is JTerm ret = super.transformAddingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformSpanningExpression(SpanningExpression that) {
        assert (is JTerm ret = super.transformSpanningExpression(that));
        return ret;
    }
    
    shared actual JTerm transformExistsNonemptyExpression(ExistsNonemptyExpression that) {
        assert (is JTerm ret = super.transformExistsNonemptyExpression(that));
        return ret;
    }
    
    shared actual JTerm transformComparingExpression(ComparingExpression that) {
        assert (is JTerm ret = super.transformComparingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformEquatingExpression(EquatingExpression that) {
        assert (is JTerm ret = super.transformEquatingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformNegatingExpression(NegatingExpression that) {
        assert (is JTerm ret = super.transformNegatingExpression(that));
        return ret;
    }
    
    shared actual JTerm transformConjoiningExpression(ConjoiningExpression that) {
        assert (is JTerm ret = super.transformConjoiningExpression(that));
        return ret;
    }
    
    shared actual JTerm transformDisjoiningExpression(DisjoiningExpression that) {
        assert (is JTerm ret = super.transformDisjoiningExpression(that));
        return ret;
    }
    
    shared actual JTerm transformThenElseExpression(ThenElseExpression that) {
        assert (is JTerm ret = super.transformThenElseExpression(that));
        return ret;
    }
    
    shared actual JTerm transformAssigningExpression(AssigningExpression that) {
        assert (is JTerm ret = super.transformAssigningExpression(that));
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
        JTerm left = transformMultiplyingExpression(that.leftOperand);
        JProductOp ret = JProductOp(tokens.token(that.operator, product_op));
        ret.leftTerm = left;
        ret.rightTerm = transformUnioningExpression(that.rightOperand);
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
        JTerm left = transformMultiplyingExpression(that.leftOperand);
        JQuotientOp ret = JQuotientOp(tokens.token(that.operator, quotient_op));
        ret.leftTerm = left;
        ret.rightTerm = transformUnioningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JElementRange transformRangeSubscript(RangeSubscript that) {
        assert (is JElementRange ret = super.transformRangeSubscript(that));
        return ret;
    }
    
    shared actual JRemainderAssignOp transformRemainderAssignmentOperation(RemainderAssignmentOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JRemainderAssignOp ret = JRemainderAssignOp(tokens.token(that.operator, remainder_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JRemainderOp transformRemainderOperation(RemainderOperation that) {
        JTerm left = transformMultiplyingExpression(that.leftOperand);
        JRemainderOp ret = JRemainderOp(tokens.token(that.operator, remainder_op));
        ret.leftTerm = left;
        ret.rightTerm = transformUnioningExpression(that.rightOperand);
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
            ret.variable = helpTransformSpecifiedVariable(resource);
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
        JTerm left = transformMultiplyingExpression(that.leftOperand);
        JScaleOp ret = JScaleOp(tokens.token(that.operator, scale_op));
        ret.leftTerm = left;
        ret.rightTerm = transformScalingExpression(that.rightOperand);
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
        JTerm left = transformExistsNonemptyExpression(that.leftOperand);
        JSmallAsOp ret = JSmallAsOp(tokens.token(that.operator, small_as_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExistsNonemptyExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JSmallerOp transformSmallerOperation(SmallerOperation that) {
        JTerm left = transformExistsNonemptyExpression(that.leftOperand);
        JSmallerOp ret = JSmallerOp(tokens.token(that.operator, smaller_op));
        ret.leftTerm = left;
        ret.rightTerm = transformExistsNonemptyExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JStringLiteral transformStringLiteral(StringLiteral that) {
        value quotes = that.isVerbatim then "\"\"\"" else "\"";
        return JStringLiteral(tokens.token(quotes + padStringLiteral(that.text, quotes.size) + quotes, that.isVerbatim then verbatim_string_literal else string_literal));
    }
    
    shared actual JSelfExpression|JOuter|JPackage transformSelfReference(SelfReference that) {
        assert (is JSelfExpression|JOuter|JPackage ret = super.transformSelfReference(that));
        return ret;
    }
    
    shared actual JSequenceType transformSequentialType(SequentialType that) {
        JSequenceType ret = JSequenceType(null);
        ret.elementType = transformPrimaryType(that.elementType);
        ret.endToken = tokens.token("[", lbracket); // unreachable, but we need to have it in the token stream
        if (exists length = that.length) {
            ret.length = transformIntegerLiteral(length);
        }
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
        JTerm left = transformAddingExpression(that.leftOperand);
        JRangeOp ret = JRangeOp(tokens.token(that.operator, range_op));
        ret.leftTerm = left;
        ret.rightTerm = transformAddingExpression(that.rightOperand);
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
    
    """Returns a [[NamedArgument|JNamedArgument]], not a [[SpecifiedArgument|JSpecifiedArgument]],
       because lazy specification arguments like
       
           val => "Hello, World!";
           comparing(Integer x, Integer y) => x.magnitude <=> y.magnitude;
       
       are instead parsed as value / function arguments with a “synthetic”
       ‘`value`’ / ‘`function`’ modifier (null token). We duplicate that here."""
    shared actual JNamedArgument transformSpecifiedArgument(SpecifiedArgument that) {
        if (is LazySpecification specification = that.specification) {
            if (specification.parameterLists nonempty) {
                JMethodArgument ret = JMethodArgument(null);
                ret.type = JFunctionModifier(null);
                ret.identifier = transformLIdentifier(specification.name);
                for (parameters in specification.parameterLists) {
                    ret.addParameterList(transformParameters(parameters));
                }
                ret.specifierExpression = transformLazySpecifier(specification.specifier);
                ret.endToken = tokens.token(";", semicolon);
                return ret;
            } else {
                JAttributeArgument ret = JAttributeArgument(null);
                ret.type = JValueModifier(null);
                ret.identifier = transformLIdentifier(specification.name);
                ret.specifierExpression = transformLazySpecifier(specification.specifier);
                ret.endToken = tokens.token(";", semicolon);
                return ret;
            }
        } else {
            JSpecifiedArgument ret = JSpecifiedArgument(null);
            assert (is ValueSpecification specification = that.specification);
            switch (specification)
            case (is ValueSpecification) {
                ret.identifier = transformIdentifier(specification.name);
                ret.specifierExpression = transformSpecifier(specification.specifier);
            }
            ret.endToken = tokens.token(";", semicolon);
            return ret;
        }
    }
    
    "The RedHat AST has no direct equivalent of [[SpecifiedPattern]];
     this method throws."
    shared actual Nothing transformSpecifiedPattern(SpecifiedPattern that) {
        throw Exception("SpecifiedPattern has no RedHat AST equivalent!");
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
        ret.addStringLiteral(JStringLiteral(tokens.token("\"" + padStringLiteral(litFirst.text, 1) + "\`\`", string_start)));
        variable value litNext = litIt.next();
        variable value exprNext = exprIt.next();
        while (!litNext is Finished) {
            assert (is StringLiteral litCur = litNext);
            assert (is Expression exprCur = exprNext);
            litNext = litIt.next();
            exprNext = exprIt.next();
            ret.addExpression(wrapTerm(transformExpression(exprCur)));
            if (litNext is Finished) {
                // last part, litCur needs to become a string_end
                ret.addStringLiteral(JStringLiteral(tokens.token("\`\`" + padStringLiteral(litCur.text, 2) + "\"", string_end)));
                break; // not strictly necessary, but we know that the loop condition will be false iff we entered this block, so why not
            } else {
                // mid part, litCur needs to become a string_mid
                ret.addStringLiteral(JStringLiteral(tokens.token("\`\`" + padStringLiteral(litCur.text, 2) + "\`\`", string_mid)));
            }
        }
        return ret;
    }
    
    shared actual JElementOrRange transformSubscript(Subscript that) {
        assert (is JElementOrRange ret = super.transformSubscript(that));
        return ret;
    }
    
    shared actual JSubtractAssignOp transformSubtractAssignmentOperation(SubtractAssignmentOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JSubtractAssignOp ret = JSubtractAssignOp(tokens.token(that.operator, subtract_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JSumOp transformSumOperation(SumOperation that) {
        JTerm left = transformAddingExpression(that.leftOperand);
        JSumOp ret = JSumOp(tokens.token(that.operator, sum_op));
        ret.leftTerm = left;
        ret.rightTerm = transformScalingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JSuper transformSuper(Super that)
            => JSuper(tokens.token("super", superType));
    
    shared actual JSwitchStatement transformSwitchCaseElse(SwitchCaseElse that) {
        JSwitchStatement ret = JSwitchStatement(null);
        ret.switchClause = transformSwitchClause(that.clause);
        ret.switchCaseList = transformSwitchCases(that.cases);
        helpAddSwitchVariables(ret.switchClause, ret.switchCaseList);
        return ret;
    }
    
    shared actual JSwitchExpression transformSwitchCaseElseExpression(SwitchCaseElseExpression that) {
        JSwitchExpression ret = JSwitchExpression(null);
        ret.switchClause = transformSwitchClause(that.clause);
        value scl = JSwitchCaseList(null);
        for (caseExpression in that.caseExpressions) {
            scl.addCaseClause(helpTransformCaseExpression(caseExpression));
        }
        if (exists elseExpression = that.elseExpression) {
            value ec = JElseClause(tokens.token("else", else_clause));
            ec.expression = wrapTerm(transformExpression(elseExpression));
            scl.elseClause = ec;
        }
        ret.switchCaseList = scl;
        helpAddSwitchVariables(ret.switchClause, ret.switchCaseList);
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
        ret.endToken = tokens.token("(", lparen);
        ret.switched = JSwitched(null);
        switch (switched = that.switched)
        case (is Expression) { ret.switched.expression = wrapTerm(transformExpression(switched)); }
        case (is SpecifiedVariable) {
            JVariable var = JVariable(null);
            value type = switched.type;
            switch (type)
            case (is Type) { var.type = transformType(type); }
            case (is ValueModifier) { var.type = transformValueModifier(type); }
            case (null) { var.type = JValueModifier(null); }
            var.identifier = transformLIdentifier(switched.name);
            var.specifierExpression = transformSpecifier(switched.specifier);
            ret.switched.variable = var;
        }
        ret.endToken = tokens.token(")", rparen);
        return ret;
    }
    
    shared actual JThenOp transformThenOperation(ThenOperation that) {
        JTerm left = transformThenElseExpression(that.leftOperand);
        JThenOp ret = JThenOp(tokens.token(that.operator, then_clause));
        ret.leftTerm = left;
        ret.rightTerm = transformDisjoiningExpression(that.rightOperand);
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
        if (that.argumentList.children nonempty) {
            ret.sequencedArgument = transformArgumentList(that.argumentList);
        }
        ret.endToken = tokens.token("]", rbracket);
        return ret;
    }
    
    shared actual JTuplePattern transformTuplePattern(TuplePattern that) {
        JTuplePattern ret = JTuplePattern(tokens.token("[", lbracket));
        if (nonempty elementPatterns = that.elementPatterns) {
            ret.addPattern(transformPattern(elementPatterns.first));
            for (pattern in elementPatterns.rest) {
                ret.endToken = tokens.token(",", comma);
                ret.addPattern(transformPattern(pattern));
            }
        }
        if (exists variadicElementPattern = that.variadicElementPattern) {
            if (that.elementPatterns nonempty) {
                ret.endToken = tokens.token(",", comma);
            }
            value vp = JVariablePattern(null);
            value v = JVariable(null);
            JType t;
            if (exists type = variadicElementPattern.type) {
                t = transformType(type);
            } else {
                t = JValueModifier(null);
            }
            value st = JSequencedType(tokens.token("*", product_op));
            st.type = t;
            v.type = st;
            v.identifier = transformLIdentifier(variadicElementPattern.name);
            vp.variable = v;
            ret.addPattern(vp);
        }
        ret.endToken = tokens.token("]", rbracket);
        return ret;
    }
    
    shared actual JTupleType transformTupleType(TupleType that) {
        JTupleType ret = JTupleType(tokens.token("[", lbracket));
        value firstElementType = that.typeList.elements.first;
        if (exists firstElementType) {
            switch (firstElementType)
            case (is Type) { ret.addElementType(transformType(firstElementType)); }
            case (is DefaultedType) { ret.addElementType(transformDefaultedType(firstElementType)); }
            for (elementType in that.typeList.elements.rest) {
                ret.endToken = tokens.token(",", comma);
                switch (elementType)
                case (is Type) { ret.addElementType(transformType(elementType)); }
                case (is DefaultedType) { ret.addElementType(transformDefaultedType(elementType)); }
            }
        }
        if (exists var = that.typeList.variadic) {
            if (that.typeList.elements nonempty) {
                ret.endToken = tokens.token(",", comma);
            }
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
    
    shared actual JTypeAliasDeclaration transformTypeAliasDefinition(TypeAliasDefinition that) {
        value annotations = transformAnnotations(that.annotations);
        JTypeAliasDeclaration ret = JTypeAliasDeclaration(tokens.token("alias", aliasType));
        ret.annotationList = annotations;
        ret.identifier = transformUIdentifier(that.name);
        if (exists typeParameters = that.typeParameters) {
            ret.typeParameterList = transformTypeParameters(typeParameters);
        }
        if (nonempty typeConstraints = that.typeConstraints) {
            value typeConstraintList = JTypeConstriantList(null);
            for (typeConstraint in typeConstraints) {
                typeConstraintList.addTypeConstraint(transformTypeConstraint(typeConstraint));
            }
            ret.typeConstraintList = typeConstraintList;
        }
        ret.typeSpecifier = transformTypeSpecifier(that.specifier);
        ret.endToken = tokens.token(";", semicolon);
        return ret;
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
        if (exists firstTA = that.typeArguments.first) {
            ret.addType(transformTypeArgument(firstTA));
            for (typeArgument in that.typeArguments.rest) {
                ret.endToken = tokens.token(",", comma);
                ret.addType(transformTypeArgument(typeArgument));
            }
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
        value bt = tokens.token("`", backtick);
        JTypeLiteral ret = JTypeLiteral(null);
        ret.type = transformType(that.type);
        ret.token = bt;
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JLocalModifier|JVoidModifier|JDynamicModifier transformTypeModifier(TypeModifier that) {
        assert (is JLocalModifier|JVoidModifier|JDynamicModifier ret = super.transformTypeModifier(that));
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
        JTerm left = transformThenElseExpression(that.leftOperand);
        JUnionAssignOp ret = JUnionAssignOp(tokens.token(that.operator, union_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformAssigningExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JUnionOp transformUnionOperation(UnionOperation that) {
        JTerm left = transformUnioningExpression(that.leftOperand);
        JUnionOp ret = JUnionOp(tokens.token(that.operator, union_op));
        ret.leftTerm = left;
        ret.rightTerm = transformIntersectingExpression(that.rightOperand);
        return ret;
    }
    
    shared actual JUnionType transformUnionType(UnionType that) {
        JUnionType ret = JUnionType(null);
        value firstType = that.children.first;
        switch (firstType)
        case (is PrimaryType) { ret.addStaticType(transformPrimaryType(firstType)); }
        case (is IntersectionType) { ret.addStaticType(transformIntersectionType(firstType)); }
        for (elementType in that.children.rest) {
            tokens.token("|", union_op);
            switch (elementType)
            case (is PrimaryType) { ret.addStaticType(transformPrimaryType(elementType)); }
            case (is IntersectionType) { ret.addStaticType(transformIntersectionType(elementType)); }
        }
        return ret;
    }
    
    shared actual JAttributeArgument transformValueArgument(ValueArgument that) {
        JAttributeArgument ret = JAttributeArgument(null);
        value type = that.type;
        switch (type)
        case (is Type) { ret.type = transformType(type); }
        case (is ValueModifier) { ret.type = transformValueModifier(type); }
        case (is DynamicModifier) { ret.type = transformDynamicModifier(type); }
        ret.identifier = transformLIdentifier(that.name);
        value definition = that.definition;
        switch (definition)
        case (is Block) { ret.block = transformBlock(definition); }
        case (is AnySpecifier) {
            ret.specifierExpression = transformAnySpecifier(definition);
            ret.endToken = tokens.token(";", semicolon);
        }
        return ret;
    }
    
    shared actual JValueLiteral transformValueDec(ValueDec that) {
        value bt = tokens.token("`", backtick);
        JValueLiteral ret = JValueLiteral(null);
        ret.endToken = tokens.token(that.keyword, value_modifier);
        helpTransformMemberDec(that, ret);
        ret.token = bt;
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
        JTerm baseMemberExpression;
        if (exists qualifier = that.qualifier) {
            baseMemberExpression = transformQualifiedExpression(QualifiedExpression(qualifier, MemberNameWithTypeArguments(that.name)));
        } else {
            baseMemberExpression = transformBaseExpression(BaseExpression(MemberNameWithTypeArguments(that.name)));
        }
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
    
    shared actual JVariablePattern transformVariablePattern(VariablePattern that) {
        JVariablePattern ret = JVariablePattern(null);
        value variable = that.variable;
        value var = JVariable(null);
        value type = variable.type;
        switch (type)
        case (is Type) { var.type = transformType(type); }
        case (is ValueModifier) { var.type = transformValueModifier(type); }
        case (null) { var.type = JValueModifier(null); }
        var.identifier = transformLIdentifier(variable.name);
        ret.variable = var;
        return ret;
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
    
    "The usage of [[VariadicVariable]] in `ceylon.ast` differs significantly
     from the usage of [[Variable|JVariable]] in the RedHat AST, to the point
     where a conversion at the level of individual variable nodes isn’t possible."
    shared actual Nothing transformVariadicVariable(VariadicVariable that) {
        throw AssertionError("Can’t transform a ceylon.ast VariadicVariable to a RedHat AST Variable");
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
        ret.term = transformExistsNonemptyExpression(that.operand);
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
        switch (qualifier = that.qualifier)
        case (is TypeNameWithTypeArguments) {
            JBaseType bt = JBaseType(null);
            bt.identifier = transformUIdentifier(qualifier.name);
            if (exists typeArgs = qualifier.typeArguments) {
                bt.typeArgumentList = transformTypeArguments(typeArgs);
            }
            tokens.token(".", member_op);
            JQualifiedType qt = JQualifiedType(null);
            qt.outerType = bt;
            type = qt;
        }
        case (is Super) {
            JQualifiedType qt = JQualifiedType(null);
            JSuperType st = JSuperType(tokens.token("super", superType));
            tokens.token(".", member_op);
            qt.outerType = st;
            type = qt;
        }
        case (null) {
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
    
    JSimpleType helpTransformDecQualifier(DecQualifier that) {
        "Should be called with the name as added component"
        assert (nonempty components = that.components);
        variable JSimpleType ret;
        if (that.packageQualifier exists) {
            JBaseType bt = JBaseType(tokens.token("package", packageType));
            bt.packageQualified = true;
            bt.endToken = tokens.token(".", member_op);
            ret = bt;
        } else {
            ret = JBaseType(null);
        }
        ret.identifier = transformIdentifier(components.first);
        ret.endToken = null;
        for (identifier in that.components.rest) {
            JQualifiedType qt = JQualifiedType(tokens.token(".", member_op));
            qt.identifier = transformIdentifier(identifier);
            qt.outerType = ret;
            ret = qt;
        }
        return ret;
    }
    
    JCond helpTransformExistsOrNonemptyCondition<JCond>(JCond ret, ExistsOrNonemptyCondition that)
            given JCond satisfies JExistsOrNonemptyCondition {
        value tested = that.tested;
        switch (tested)
        case (is SpecifiedPattern) {
            // letVariable
            ret.variable = helpTransformSpecifiedPattern(tested);
        }
        case (is LIdentifier) {
            // impliedVariable
            JVariable v = JVariable(null);
            v.type = JSyntheticVariable(null);
            v.identifier = transformLIdentifier(tested);
            value se = JSpecifierExpression(null);
            value e = JExpression(null);
            value bme = JBaseMemberExpression(null);
            bme.identifier = v.identifier;
            bme.typeArguments = JInferredTypeArguments(null);
            e.term = bme;
            se.expression = e;
            v.specifierExpression = se;
            ret.variable = v;
        }
        ret.not = that.negated;
        return ret;
    }
    
    void helpTransformMemberDec(MemberDec that, JMemberLiteral ret) {
        if (that.qualifier.components nonempty) {
            ret.type = helpTransformDecQualifier(that.qualifier);
            tokens.token(".", member_op);
        } else if (that.qualifier.packageQualifier exists) {
            ret.packageQualified = true;
            tokens.token("package", packageType);
            tokens.token(".", member_op);
        }
        ret.identifier = transformLIdentifier(that.name);
        ret.endToken = tokens.token("`", backtick);
    }
    
    JVariable helpTransformSpecifiedVariable(SpecifiedVariable resource) {
        JVariable var = JVariable(null);
        value type = resource.type;
        switch (type)
        case (is Type) { var.type = transformType(type); }
        case (is ValueModifier) { var.type = transformValueModifier(type); }
        case (null) { var.type = JValueModifier(null); }
        var.identifier = transformLIdentifier(resource.name);
        var.specifierExpression = transformSpecifier(resource.specifier);
        return var;
    }
    
    JDestructure|JVariable helpTransformSpecifiedPattern(SpecifiedPattern specifiedPattern) {
        // letVariable
        JDestructure|JVariable statement;
        switch (pattern = specifiedPattern.pattern)
        case (is VariablePattern) {
            value v = pattern.variable;
            value variable = JVariable(null);
            value type = v.type;
            switch (type)
            case (is Type) { variable.type = transformType(type); }
            case (is ValueModifier) { variable.type = transformValueModifier(type); }
            case (null) { variable.type = JValueModifier(null); }
            variable.identifier = transformLIdentifier(v.name);
            statement = variable;
        }
        else {
            value d = JDestructure(null);
            d.pattern = transformPattern(pattern);
            statement = d;
        }
        switch (statement)
        case (is JDestructure) { statement.specifierExpression = transformSpecifier(specifiedPattern.specifier); }
        case (is JVariable) { statement.specifierExpression = transformSpecifier(specifiedPattern.specifier); }
        return statement;
    }
    
    JCaseClause helpTransformCaseExpression(CaseExpression caseExpression) {
        JCaseClause ret = JCaseClause(tokens.token("case", case_clause));
        tokens.token("(", lparen);
        ret.caseItem = transformCaseItem(caseExpression.caseItem);
        ret.caseItem.endToken = tokens.token(")", rparen);
        ret.expression = wrapTerm(transformExpression(caseExpression.expression));
        return ret;
    }
    
    "The parser adds synthetic variables to all ‘is’ cases and the else case.
     This is mostly copied from the grammar."
    see (`function transformSwitchCaseElse`, `function transformSwitchCaseElseExpression`)
    void helpAddSwitchVariables(JSwitchClause switchClause, JSwitchCaseList switchCaseList) {
        JIdentifier? id;
        if (is JBaseMemberExpression ex = switchClause.switched.expression?.term) {
            id = ex.identifier;
        } else if (exists var = switchClause.switched.variable) {
            id = var.identifier;
        } else {
            id = null;
        }
        if (exists id) {
            JVariable makeVariable() {
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
                return v;
            }
            for (cc in CeylonIterable(switchCaseList.caseClauses)) {
                if (is JIsCase ic = cc.caseItem) {
                    ic.variable = makeVariable();
                }
            }
            if (exists ec = switchCaseList.elseClause) {
                ec.variable = makeVariable();
            }
        }
    }
    
    JExpression wrapTerm(JTerm term) {
        value expression = JExpression(null);
        expression.term = term;
        return expression;
    }
    
    String padStringLiteral(String text, Integer initial) {
        StringBuilder ret = StringBuilder();
        value lines = text.lines;
        if (exists firstLine = lines.first) {
            ret.append(firstLine);
            for (line in lines.rest) {
                ret.appendNewline();
                for (i in 0:initial) {
                    ret.append(" ");
                }
                ret.append(line);
            }
        }
        return ret.string;
    }
}
