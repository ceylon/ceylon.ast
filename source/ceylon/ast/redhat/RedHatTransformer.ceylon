import ceylon.ast.api {
    ...
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JCharacterLiteral=CharLiteral,
        JDefaultedType=DefaultedType,
        JFloatLiteral=FloatLiteral,
        JGroupedType=GroupedType,
        JIntegerLiteral=NaturalLiteral,
        JIdentifier=Identifier,
        JIterableType=IterableType,
        JLiteral=Literal,
        JOptionalType=OptionalType,
        JOuter=Outer,
        JPackage=Package,
        JQualifiedType=QualifiedType,
        JSelfExpression=SelfExpression,
        JSequenceType=SequenceType,
        JSequencedType=SequencedType,
        JSimpleType=SimpleType,
        JStaticType=StaticType,
        JStringLiteral=StringLiteral,
        JSuper=Super,
        JThis=This,
        JType=Type,
        JTypeArgumentList=TypeArgumentList
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        character_literal=\iCHAR_LITERAL,
        float_literal=\iFLOAT_LITERAL,
        integer_literal=\iNATURAL_LITERAL,
        larger_op=\iLARGER_OP,
        lbrace=\iLBRACE,
        lidentifier=\iLIDENTIFIER,
        member_op=\iMEMBER_OP,
        optionalType=\iOPTIONAL,
        outerType=\iOUTER,
        packageType=\iPACKAGE,
        product_op=\iPRODUCT_OP,
        rbrace=\iRBRACE,
        rbracket=\iRBRACKET,
        smaller_op=\iSMALLER_OP,
        specify=\iSPECIFY,
        string_literal=\iSTRING_LITERAL,
        sum_op=\iSUM_OP,
        superType=\iSUPER,
        thisType=\iTHIS,
        uidentifier=\iUIDENTIFIER,
        verbatim_string_literal=\iVERBATIM_STRING
    }
}

shared class RedHatTransformer(TokenFactory tokens) satisfies NarrowingTransformer<JNode> {
    shared actual JBaseType transformBaseType(BaseType that) {
        JTypeArgumentList? typeArgumentList;
        if (exists arguments = that.nameAndArgs.arguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            typeArgList.endToken = tokens.token(">", larger_op);
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgumentList = typeArgList;
        } else {
            typeArgumentList = null;
        }
        JBaseType ret = JBaseType(null);
        ret.identifier = transformUIdentifier(that.nameAndArgs.name);
        ret.typeArgumentList = typeArgumentList;
        return ret;
    }
    
    shared actual JCharacterLiteral transformCharacterLiteral(CharacterLiteral that)
            => JCharacterLiteral(tokens.token("'``that.text``'", character_literal));
    
    shared actual JDefaultedType transformDefaultedType(DefaultedType that) {
        JDefaultedType ret = JDefaultedType(null);
        ret.endToken = tokens.token("=", specify);
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JFloatLiteral transformFloatLiteral(FloatLiteral that)
            => JFloatLiteral(tokens.token(that.text, float_literal));
    
    shared actual JGroupedType transformGroupedType(GroupedType that) {
        JGroupedType ret = JGroupedType(tokens.token("<", smaller_op));
        ret.endToken = tokens.token(">", larger_op);
        ret.type = transformType(that.type);
        return ret;
    }
    
    shared actual JIdentifier transformIdentifier(Identifier that) {
        assert (is JIdentifier ret = super.transformIdentifier(that));
        return ret;
    }
    
    shared actual JIntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => JIntegerLiteral(tokens.token(that.text, integer_literal));
    
    shared actual JIterableType transformIterableType(IterableType that) {
        JIterableType ret = JIterableType(tokens.token("{", lbrace));
        ret.endToken = tokens.token("}", rbrace);
        if (exists varType = that.variadicType) {
            ret.elementType = transformVariadicType(varType);
        }
        return ret;
    }
    
    shared actual JIdentifier transformLIdentifier(LIdentifier that)
            => JIdentifier(tokens.token(that.name, lidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JLiteral transformLiteral(Literal that) {
        assert (is JLiteral ret = super.transformLiteral(that));
        return ret;
    }
    
    shared actual JOptionalType transformOptionalType(OptionalType that) {
        JOptionalType ret = JOptionalType(null);
        ret.endToken = tokens.token("?", optionalType);
        ret.definiteType = transformPrimaryType(that.definiteType);
        return ret;
    }
    
    shared actual JOuter transformOuter(Outer that)
            => JOuter(tokens.token("outer", outerType));
    
    shared actual JPackage transformPackage(Package that)
            => JPackage(tokens.token("package", packageType));
    
    shared actual JStaticType transformPrimaryType(PrimaryType that) {
        assert (is JStaticType ret = super.transformPrimaryType(that));
        return ret;
    }
    
    shared actual JQualifiedType transformQualifiedType(QualifiedType that) {
        JTypeArgumentList? typeArgumentList;
        if (exists arguments = that.nameAndArgs.arguments) {
            value typeArgList = JTypeArgumentList(tokens.token("<", smaller_op));
            typeArgList.endToken = tokens.token(">", larger_op);
            for (Type type in arguments) {
                typeArgList.addType(transformType(type));
            }
            typeArgumentList = typeArgList;
        } else {
            typeArgumentList = null;
        }
        JQualifiedType ret = JQualifiedType(tokens.token(".", member_op));
        ret.identifier = transformUIdentifier(that.nameAndArgs.name);
        ret.typeArgumentList = typeArgumentList;
        ret.outerType = transformType(that.qualifyingType);
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
        ret.endToken = tokens.token("]", rbracket);
        ret.elementType = transformPrimaryType(that.elementType);
        return ret;
    }
    
    shared actual JSuper transformSuper(Super that)
            => JSuper(tokens.token("super", superType));
    
    shared actual JThis transformThis(This that)
            => JThis(tokens.token("this", thisType));
    
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
    
    "The RedHat AST has no direct equivalent of [[TypeNameWithArguments]];
     this method throws."
    shared actual Nothing transformTypeNameWithArguments(TypeNameWithArguments that) {
        throw Exception("TypeNameWithArguments has no RedHat AST equivalent!");
    }
    
    shared actual JIdentifier transformUIdentifier(UIdentifier that)
            => JIdentifier(tokens.token(that.name, uidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JSequencedType transformVariadicType(VariadicType that) {
        JSequencedType ret = JSequencedType(null);
        if (that.isNonempty) {
            ret.endToken = tokens.token("+", sum_op);
        } else {
            ret.endToken = tokens.token("*", product_op);
        }
        ret.type = transformType(that.elementType);
        ret.atLeastOne = that.isNonempty;
        return ret;
    }
}
