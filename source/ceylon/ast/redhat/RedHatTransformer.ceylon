import ceylon.ast.core {
    ...
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAtom=Atom,
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression,
        JBaseMemberExpression=BaseMemberExpression,
        JBaseTypeExpression=BaseTypeExpression,
        JBaseType=BaseType,
        JBinaryOperatorExpression=BinaryOperatorExpression,
        JCharacterLiteral=CharLiteral,
        JDefaultedType=DefaultedType,
        JEntryType=EntryType,
        JPowerOp=PowerOp,
        JExpression=Expression,
        JFloatLiteral=FloatLiteral,
        JFunctionType=FunctionType,
        JGroupedType=GroupedType,
        JInferredTypeArguments=InferredTypeArguments,
        JIntegerLiteral=NaturalLiteral,
        JIntersectionType=IntersectionType,
        JIdentifier=Identifier,
        JIterableType=IterableType,
        JLiteral=Literal,
        JMemberLiteral=MemberLiteral,
        JMetaLiteral=MetaLiteral,
        JOperatorExpression=OperatorExpression,
        JOptionalType=OptionalType,
        JOuter=Outer,
        JPackage=Package,
        JPostfixDecrementOp=PostfixDecrementOp,
        JPostfixIncrementOp=PostfixIncrementOp,
        JPostfixOperatorExpression=PostfixOperatorExpression,
        JDecrementOp=DecrementOp,
        JIncrementOp=IncrementOp,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPrimary=Primary,
        JQualifiedMemberExpression=QualifiedMemberExpression,
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression,
        JQualifiedType=QualifiedType,
        JQualifiedTypeExpression=QualifiedTypeExpression,
        JSelfExpression=SelfExpression,
        JSequenceType=SequenceType,
        JSequencedType=SequencedType,
        JSimpleType=SimpleType,
        JStaticType=StaticType,
        JStringLiteral=StringLiteral,
        JSuper=Super,
        JTerm=Term,
        JThis=This,
        JTupleType=TupleType,
        JType=Type,
        JTypeArgumentList=TypeArgumentList,
        JTypeLiteral=TypeLiteral,
        JTypeParameterLiteral=TypeParameterLiteral,
        JUnaryOperatorExpression=UnaryOperatorExpression,
        JUnionType=UnionType
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        backtick=\iBACKTICK,
        character_literal=\iCHAR_LITERAL,
        decrement_op=\iDECREMENT_OP,
        entry_op=\iENTRY_OP,
        float_literal=\iFLOAT_LITERAL,
        increment_op=\iINCREMENT_OP,
        integer_literal=\iNATURAL_LITERAL,
        intersection_op=\iINTERSECTION_OP,
        larger_op=\iLARGER_OP,
        lbrace=\iLBRACE,
        lbracket=\iLBRACKET,
        lidentifier=\iLIDENTIFIER,
        lparen=\iLPAREN,
        member_op=\iMEMBER_OP,
        optionalType=\iOPTIONAL,
        outerType=\iOUTER,
        packageType=\iPACKAGE,
        power_op=\iPOWER_OP,
        product_op=\iPRODUCT_OP,
        rbrace=\iRBRACE,
        rbracket=\iRBRACKET,
        rparen=\iRPAREN,
        smaller_op=\iSMALLER_OP,
        specify=\iSPECIFY,
        string_literal=\iSTRING_LITERAL,
        sum_op=\iSUM_OP,
        superType=\iSUPER,
        thisType=\iTHIS,
        type_constraint=\iTYPE_CONSTRAINT,
        uidentifier=\iUIDENTIFIER,
        union_op=\iUNION_OP,
        verbatim_string_literal=\iVERBATIM_STRING
    }
}

shared class RedHatTransformer(TokenFactory tokens) satisfies NarrowingTransformer<JNode> {
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
    
    shared actual JEntryType transformEntryType(EntryType that) {
        JEntryType ret = JEntryType(null);
        ret.keyType = transformMainType(that.key);
        ret.endToken = tokens.token("->", entry_op);
        ret.valueType = transformMainType(that.item);
        return ret;
    }
    
    shared actual JPowerOp transformExponentiationOperation(ExponentiationOperation that) {
        value left = transformPrecedence1Expression(that.leftChild);
        JPowerOp ret = JPowerOp(tokens.token(that.operator, power_op));
        ret.leftTerm = left;
        ret.rightTerm = transformPrecedence2Expression(that.rightChild);
        return ret;
    }
    
    shared actual JPrimary|JPostfixOperatorExpression|JPrefixOperatorExpression transformPrecedence1Expression(Precedence1Expression that) {
        assert (is JPrimary|JPostfixOperatorExpression|JPrefixOperatorExpression ret = super.transformPrecedence1Expression(that));
        return ret;
    }
    
    shared actual JPowerOp|JPrimary|JPostfixOperatorExpression|JPrefixOperatorExpression transformPrecedence2Expression(Precedence2Expression that) {
        assert (is JPowerOp|JPrimary|JPostfixOperatorExpression|JPrefixOperatorExpression ret = super.transformPrecedence2Expression(that));
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
    
    shared actual JIntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => JIntegerLiteral(tokens.token(that.text, integer_literal));
    
    shared actual JIntersectionType transformIntersectionType(IntersectionType that) {
        JIntersectionType ret = JIntersectionType(null);
        ret.addStaticType(transformPrimaryType(that.children.first));
        for (elementType in that.children.rest) {
            tokens.token("&", intersection_op);
            ret.addStaticType(transformPrimaryType(elementType));
        }
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
    
    shared actual JIdentifier transformLIdentifier(LIdentifier that)
            => JIdentifier(tokens.token(that.name, lidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JLiteral transformLiteral(Literal that) {
        assert (is JLiteral ret = super.transformLiteral(that));
        return ret;
    }
    
    shared actual JStaticType transformMainType(MainType that) {
        assert (is JStaticType ret = super.transformMainType(that));
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
    
    shared actual JOuter transformOuter(Outer that)
            => JOuter(tokens.token("outer", outerType));
    
    shared actual JPackage transformPackage(Package that)
            => JPackage(tokens.token("package", packageType));
    
    shared actual JPostfixDecrementOp transformPostfixDecrementOperation(PostfixDecrementOperation that) {
        value term = transformPrimary(that.child);
        JPostfixDecrementOp ret = JPostfixDecrementOp(tokens.token(that.operator, decrement_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JPostfixIncrementOp transformPostfixIncrementOperation(PostfixIncrementOperation that) {
        value term = transformPrimary(that.child);
        JPostfixIncrementOp ret = JPostfixIncrementOp(tokens.token(that.operator, increment_op));
        ret.term = term;
        return ret;
    }
    
    shared actual JPostfixOperatorExpression transformPostfixOperation(PostfixOperation that) {
        assert (is JPostfixOperatorExpression ret = super.transformPostfixOperation(that));
        return ret;
    }
    
    shared actual JDecrementOp transformPrefixDecrementOperation(PrefixDecrementOperation that) {
        JDecrementOp ret = JDecrementOp(tokens.token(that.operator, decrement_op));
        ret.term = transformPrimary(that.child);
        return ret;
    }
    
    shared actual JIncrementOp transformPrefixIncrementOperation(PrefixIncrementOperation that) {
        JIncrementOp ret = JIncrementOp(tokens.token(that.operator, increment_op));
        ret.term = transformPrimary(that.child);
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
    
    shared actual JSimpleType transformSimpleType(SimpleType that) {
        assert (is JSimpleType ret = super.transformSimpleType(that));
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
    
    shared actual JSuper transformSuper(Super that)
            => JSuper(tokens.token("super", superType));
    
    shared actual JThis transformThis(This that)
            => JThis(tokens.token("this", thisType));
    
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
    
    shared actual JUnaryOperatorExpression transformUnaryOperation(UnaryOperation that) {
        assert (is JUnaryOperatorExpression ret = super.transformUnaryOperation(that));
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
}
