import ceylon.ast.core {
    ...
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAddAssignOp=AddAssignOp,
        JAndAssignOp=AndAssignOp,
        JAndOp=AndOp,
        JAnnotation=Annotation,
        JAnnotationList=AnnotationList,
        JAnonymousAnnotation=AnonymousAnnotation,
        JArgumentList=ArgumentList,
        JArithmeticAssignmentOp=ArithmeticAssignmentOp,
        JArithmeticOp=ArithmeticOp,
        JAssignmentOp=AssignmentOp,
        JAssignOp=AssignOp,
        JAtom=Atom,
        JBaseMemberExpression=BaseMemberExpression,
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression,
        JBaseType=BaseType,
        JBaseTypeExpression=BaseTypeExpression,
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JBitwiseAssignmentOp=BitwiseAssignmentOp,
        JBitwiseOp=BitwiseOp,
        JCharacterLiteral=CharLiteral,
        JCompareOp=CompareOp,
        JComparisonOp=ComparisonOp,
        JComplementAssignOp=ComplementAssignOp,
        JComplementOp=ComplementOp,
        JDecrementOp=DecrementOp,
        JDefaultedType=DefaultedType,
        JDefaultOp=DefaultOp,
        JDifferenceOp=DifferenceOp,
        JDivideAssignOp=DivideAssignOp,
        JDynamic=Dynamic,
        JEntryOp=EntryOp,
        JEntryType=EntryType,
        JEqualOp=EqualOp,
        JEqualityOp=EqualityOp,
        JExists=Exists,
        JExpression=Expression,
        JFloatLiteral=FloatLiteral,
        JFunctionType=FunctionType,
        JGroupedType=GroupedType,
        JIdenticalOp=IdenticalOp,
        JIdentifier=Identifier,
        JImportPath=ImportPath,
        JInOp=InOp,
        JIncrementOp=IncrementOp,
        JInferredTypeArguments=InferredTypeArguments,
        JIntegerLiteral=NaturalLiteral,
        JIntersectAssignOp=IntersectAssignOp,
        JIntersectionOp=IntersectionOp,
        JIntersectionType=IntersectionType,
        JInvocationExpression=InvocationExpression,
        JIsOp=IsOp,
        JIterableType=IterableType,
        JLargeAsOp=LargeAsOp,
        JLargerOp=LargerOp,
        JListedArgument=ListedArgument,
        JLogicalAssignmentOp=LogicalAssignmentOp,
        JLogicalOp=LogicalOp,
        JLiteral=Literal,
        JMemberLiteral=MemberLiteral,
        JMetaLiteral=MetaLiteral,
        JModuleLiteral=ModuleLiteral,
        JMultiplyAssignOp=MultiplyAssignOp,
        JNamedArgument=NamedArgument,
        JNamedArgumentList=NamedArgumentList,
        JNegativeOp=NegativeOp,
        JNonempty=Nonempty,
        JNotEqualOp=NotEqualOp,
        JNotOp=NotOp,
        JOfOp=OfOp,
        JOperatorExpression=OperatorExpression,
        JOptionalType=OptionalType,
        JOrAssignOp=OrAssignOp,
        JOrOp=OrOp,
        JOuter=Outer,
        JPackage=Package,
        JPackageLiteral=PackageLiteral,
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
        JQuotientOp=QuotientOp,
        JRangeOp=RangeOp,
        JRemainderAssignOp=RemainderAssignOp,
        JRemainderOp=RemainderOp,
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
        JStatement=Statement,
        JStaticType=StaticType,
        JStringLiteral=StringLiteral,
        JSubtractAssignOp=SubtractAssignOp,
        JSumOp=SumOp,
        JSuper=Super,
        JTerm=Term,
        JThenOp=ThenOp,
        JThis=This,
        JTuple=Tuple,
        JTupleType=TupleType,
        JTypeArgumentList=TypeArgumentList,
        JTypeLiteral=TypeLiteral,
        JTypeOperatorExpression=TypeOperatorExpression,
        JTypeParameterLiteral=TypeParameterLiteral,
        JType=Type,
        JUnaryOperatorExpression=UnaryOperatorExpression,
        JUnionAssignOp=UnionAssignOp,
        JUnionOp=UnionOp,
        JUnionType=UnionType
    },
    JVisitorAdaptor=VisitorAdaptor
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        add_specify=\iADD_SPECIFY,
        aidentifier=\iAIDENTIFIER,
        astring_literal=\iASTRING_LITERAL,
        averbatim_string=\iAVERBATIM_STRING,
        and_op=\iAND_OP,
        and_specify=\iAND_SPECIFY,
        backtick=\iBACKTICK,
        case_types=\iCASE_TYPES,
        character_literal=\iCHAR_LITERAL,
        comma=\iCOMMA,
        compare_op=\iCOMPARE_OP,
        complement_op=\iCOMPLEMENT_OP,
        complement_specify=\iCOMPLEMENT_SPECIFY,
        decrement_op=\iDECREMENT_OP,
        difference_op=\iDIFFERENCE_OP,
        divide_specify=\iDIVIDE_SPECIFY,
        else_clause=\iELSE_CLAUSE,
        entry_op=\iENTRY_OP,
        equal_op=\iEQUAL_OP,
        exists_op=\iEXISTS,
        float_literal=\iFLOAT_LITERAL,
        identical_op=\iIDENTICAL_OP,
        in_op=\iIN_OP,
        increment_op=\iINCREMENT_OP,
        integer_literal=\iNATURAL_LITERAL,
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
        optionalType=\iOPTIONAL,
        or_op=\iOR_OP,
        or_specify=\iOR_SPECIFY,
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
        rparen=\iRPAREN,
        scale_op=\iSCALE_OP,
        segment_op=\iSEGMENT_OP,
        small_as_op=\iSMALL_AS_OP,
        smaller_op=\iSMALLER_OP,
        specify=\iSPECIFY,
        string_literal=\iSTRING_LITERAL,
        subtract_specify=\iSUBTRACT_SPECIFY,
        sum_op=\iSUM_OP,
        superType=\iSUPER,
        then_clause=\iTHEN_CLAUSE,
        thisType=\iTHIS,
        type_constraint=\iTYPE_CONSTRAINT,
        uidentifier=\iUIDENTIFIER,
        union_op=\iUNION_OP,
        union_specify=\iUNION_SPECIFY,
        value_modifier=\iVALUE_MODIFIER,
        verbatim_string_literal=\iVERBATIM_STRING
    }
}
import ceylon.interop.java {
    CeylonIterable
}

shared class RedHatTransformer(TokenFactory tokens) satisfies NarrowingTransformer<JNode> {
    
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
                switch (sequenceArgument)
                case (is SpreadArgument) {
                    ret.endToken = tokens.token(",", comma);
                    ret.positionalArguments.add(transformSpreadArgument(sequenceArgument));
                }
                // TODO case (is Comprehension)
            }
        } else {
            if (exists sequenceArgument = that.sequenceArgument) {
                switch (sequenceArgument)
                case (is SpreadArgument) {
                    ret.positionalArguments.add(transformSpreadArgument(sequenceArgument));
                }
                // TODO case (is Comprehension)
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
        if (exists arguments = that.nameAndArgs.typeArguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgList.endToken = tokens.token(">", larger_op);
            ret.typeArguments = typeArgList;
        } else {
            ret.typeArguments = JInferredTypeArguments(null);
        }
        return ret;
    }
    
    shared actual JMemberLiteral transformBaseMeta(BaseMeta that) {
        JMemberLiteral ret = JMemberLiteral(tokens.token("`", backtick));
        ret.identifier = transformIdentifier(that.nameAndArgs.name);
        if (exists arguments = that.nameAndArgs.typeArguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgList.endToken = tokens.token(">", larger_op);
            ret.typeArgumentList = typeArgList;
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    shared actual JBaseType transformBaseType(BaseType that) {
        JBaseType ret = JBaseType(null);
        ret.identifier = transformUIdentifier(that.nameAndArgs.name);
        JTypeArgumentList? typeArgumentList;
        if (exists arguments = that.nameAndArgs.typeArguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgList.endToken = tokens.token(">", larger_op);
            typeArgumentList = typeArgList;
        } else {
            typeArgumentList = null;
        }
        ret.typeArgumentList = typeArgumentList;
        return ret;
    }
    
    shared actual JBinaryOperatorExpression transformBinaryOperation(BinaryOperation that) {
        assert (is JBinaryOperatorExpression ret = super.transformBinaryOperation(that));
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
    
    shared actual JCharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => JCharacterLiteral(tokens.token("'``that.text``'", character_literal));
    
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
    
    shared actual JMetaLiteral transformDec(Dec that) {
        assert (is JMetaLiteral ret = super.transformDec(that));
        return ret;
    }
    
    shared actual JDefaultedType transformDefaultedType(DefaultedType that) {
        JDefaultedType ret = JDefaultedType(null);
        ret.type = transformType(that.type);
        ret.endToken = tokens.token("=", specify);
        return ret;
    }
    
    shared actual JDifferenceOp transformDifferenceOperation(DifferenceOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JDifferenceOp ret = JDifferenceOp(tokens.token(that.operator, difference_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence7Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JDivideAssignOp transformDivideAssignmentOperation(DivideAssignmentOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JDivideAssignOp ret = JDivideAssignOp(tokens.token(that.operator, divide_specify));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence17Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JDynamic transformDynamicValue(DynamicValue that) {
        JDynamic ret = JDynamic(tokens.token("value", value_modifier));
        ret.namedArgumentList = transformNamedArguments(that.content);
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
    
    shared actual JExists transformExistsOperation(ExistsOperation that) {
        JTerm term = transformPrecedence9Expression(that.operand);
        JExists ret = JExists(tokens.token(that.operator, exists_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JNotOp transformNotOperation(NotOperation that) {
        JNotOp ret = JNotOp(tokens.token(that.operator, not_op));
        ret.term = transformPrecedence13Expression(that.operand);
        return ret;
    }
    
    shared actual JPowerOp transformExponentiationOperation(ExponentiationOperation that) {
        value left = transformPrecedence1Expression(that.leftOperand);
        JPowerOp ret = JPowerOp(tokens.token(that.operator, power_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence2Expression(that.rightOperand);
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
    
    shared actual JSpecifierExpression transformSpecifier(Specifier that) {
        JSpecifierExpression ret = JSpecifierExpression(tokens.token("=", specify));
        ret.expression = wrapTerm(transformExpression(that.expression));
        return ret;
    }
    
    shared actual JStatement transformStatement(Statement that) {
        assert (is JStatement ret = super.transformStatement(that));
        return ret;
    }
    
    shared actual JTerm transformExpression(Expression that) {
        assert (is JTerm ret = super.transformExpression(that));
        return ret;
    }
    
    shared actual JTerm transformExpressionIsh(ExpressionIsh that) {
        assert (is JTerm ret = super.transformExpressionIsh(that));
        return ret;
    }
    
    shared actual JFloatLiteral transformFloatLiteral(FloatLiteral that)
            => JFloatLiteral(tokens.token(that.text, float_literal));
    
    shared actual JImportPath transformFullPackageName(FullPackageName that) {
        JImportPath ret = JImportPath(null);
        ret.addIdentifier(transformPIdentifier(that.components.first));
        for (component in that.components.rest) {
            ret.endToken = tokens.token(".", member_op);
            ret.addIdentifier(transformPIdentifier(component));
        }
        return ret;
    }
    
    shared actual JTypeParameterLiteral transformGivenDec(GivenDec that) {
        JTypeParameterLiteral ret = JTypeParameterLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token("given", type_constraint);
        ret.type = transformBaseType(BaseType(TypeNameWithTypeArguments(that.typeParameter)));
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
    
    shared actual JInOp transformInOperation(InOperation that) {
        JTerm left = transformPrecedence10Expression(that.leftOperand);
        JInOp ret = JInOp(tokens.token(that.operator, in_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence10Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JIntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => JIntegerLiteral(tokens.token(that.text, integer_literal));
    
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
    
    shared actual JSegmentOp transformMeasureOperation(MeasureOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JSegmentOp ret = JSegmentOp(tokens.token(that.operator, segment_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence8Expression(that.rightOperand);
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
        if (exists arguments = that.nameAndArgs.typeArguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgList.endToken = tokens.token(">", larger_op);
            ret.typeArgumentList = typeArgList;
        }
        ret.endToken = tokens.token("`", backtick);
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[MemberNameWithTypeArguments]];
     this method throws."
    shared actual Nothing transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) {
        throw Exception("MemberNameWithTypeArguments has no RedHat AST equivalent!");
    }
    
    shared actual JMetaLiteral transformMeta(Meta that) {
        assert (is JMetaLiteral ret = super.transformMeta(that));
        return ret;
    }
    
    shared actual JStaticType|JIdentifier transformMetaQualifier(MetaQualifier that) {
        assert (is JStaticType|JIdentifier ret = super.transformMetaQualifier(that));
        return ret;
    }
    
    shared actual JModuleLiteral transformModuleDec(ModuleDec that) {
        JModuleLiteral ret = JModuleLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token("module", moduleType);
        ret.importPath = transformFullPackageName(that.moduleName);
        ret.endToken = tokens.token("`", backtick);
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
    
    shared actual JOfOp transformOfOperation(OfOperation that) {
        JTerm term = transformPrecedence10Expression(that.operand);
        JOfOp ret = JOfOp(tokens.token(that.operator, case_types));
        ret.term = term;
        ret.type = transformType(that.type);
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
    
    shared actual JOuter transformOuter(Outer that)
            => JOuter(tokens.token("outer", outerType));
    
    shared actual JPackage transformPackage(Package that)
            => JPackage(tokens.token("package", packageType));
    
    shared actual JPackageLiteral transformPackageDec(PackageDec that) {
        JPackageLiteral ret = JPackageLiteral(tokens.token("`", backtick));
        ret.endToken = tokens.token("package", packageType);
        ret.importPath = transformFullPackageName(that.packageName);
        ret.endToken = tokens.token("`", backtick);
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
        ret.identifier = transformIdentifier(name);
        if (exists arguments = that.nameAndArgs.typeArguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgList.endToken = tokens.token(">", larger_op);
            ret.typeArguments = typeArgList;
        } else {
            ret.typeArguments = JInferredTypeArguments(null);
        }
        return ret;
    }
    
    shared actual JQualifiedType transformQualifiedType(QualifiedType that) {
        JTypeArgumentList? typeArgumentList;
        if (exists arguments = that.nameAndArgs.typeArguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgList.endToken = tokens.token(">", larger_op);
            typeArgumentList = typeArgList;
        } else {
            typeArgumentList = null;
        }
        value outerType = transformType(that.qualifyingType);
        JQualifiedType ret = JQualifiedType(tokens.token(".", member_op));
        ret.identifier = transformUIdentifier(that.nameAndArgs.name);
        ret.typeArgumentList = typeArgumentList;
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
    
    shared actual JRangeOp transformSpanOperation(SpanOperation that) {
        JTerm left = transformPrecedence8Expression(that.leftOperand);
        JRangeOp ret = JRangeOp(tokens.token(that.operator, range_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence8Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JSpecifierStatement transformSpecification(Specification that) {
        assert (is JSpecifierStatement ret = super.transformSpecification(that));
        return ret;
    }
    
    shared actual JSpreadArgument transformSpreadArgument(SpreadArgument that) {
        JSpreadArgument ret = JSpreadArgument(tokens.token("*", product_op));
        value expression = JExpression(null);
        expression.term = transformExpression(that.argument);
        ret.expression = expression;
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
    
    shared actual JThenOp transformThenOperation(ThenOperation that) {
        JTerm left = transformPrecedence16Expression(that.leftOperand);
        JThenOp ret = JThenOp(tokens.token(that.operator, then_clause));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence15Expression(that.rightOperand);
        return ret;
    }
    
    shared actual JThis transformThis(This that)
            => JThis(tokens.token("this", thisType));
    
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
    
    shared actual JIdentifier transformUIdentifier(UIdentifier that)
            => JIdentifier(tokens.token(that.name, uidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JStaticType transformUnionableType(UnionableType that) {
        assert (is JStaticType ret = super.transformUnionableType(that));
        return ret;
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
    
    shared actual JTerm transformValueExpression(ValueExpression that) {
        assert (is JTerm ret = super.transformValueExpression(that));
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
    
    shared actual JSpecifierStatement transformValueSpecification(ValueSpecification that) {
        JTerm baseMemberExpression = transformBaseExpression(BaseExpression(MemberNameWithTypeArguments(that.name)));
        JSpecifierStatement ret = JSpecifierStatement(null);
        ret.baseMemberExpression = baseMemberExpression;
        ret.specifierExpression = transformSpecifier(that.specifier);
        return ret;
    }
    
    JExpression wrapTerm(JTerm term) {
        value expression = JExpression(null);
        expression.term = term;
        return expression;
    }
}
