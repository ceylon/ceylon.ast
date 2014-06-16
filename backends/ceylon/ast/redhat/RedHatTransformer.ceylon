import ceylon.ast.api {
    ...
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JCharacterLiteral=CharLiteral,
        JFloatLiteral=FloatLiteral,
        JIntegerLiteral=NaturalLiteral,
        JIdentifier=Identifier,
        JLiteral=Literal,
        JOuter=Outer,
        JPackage=Package,
        JSelfExpression=SelfExpression,
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
        lidentifier=\iLIDENTIFIER,
        outerType=\iOUTER,
        packageType=\iPACKAGE,
        string_literal=\iSTRING_LITERAL,
        superType=\iSUPER,
        thisType=\iTHIS,
        uidentifier=\iUIDENTIFIER,
        verbatim_string_literal=\iVERBATIM_STRING
    }
}

shared class RedHatTransformer(TokenFactory tokens) extends NarrowingTransformer<JNode>() {
    shared actual JBaseType transformBaseType(BaseType that) {
        JTypeArgumentList? typeArgumentList;
        if (exists arguments = that.nameAndArgs.arguments) {
            value typeArgList = JTypeArgumentList(null);
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
    
    shared actual JFloatLiteral transformFloatLiteral(FloatLiteral that)
            => JFloatLiteral(tokens.token(that.text, float_literal));
    
    shared actual JIdentifier transformIdentifier(Identifier that) {
        assert (is JIdentifier ret = super.transformIdentifier(that));
        return ret;
    }
    
    shared actual JIntegerLiteral transformIntegerLiteral(IntegerLiteral that)
            => JIntegerLiteral(tokens.token(that.text, integer_literal));
    
    shared actual JIdentifier transformLIdentifier(LIdentifier that)
            => JIdentifier(tokens.token(that.name, lidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
    
    shared actual JLiteral transformLiteral(Literal that) {
        assert (is JLiteral ret = super.transformLiteral(that));
        return ret;
    }
    
    shared actual JOuter transformOuter(Outer that)
            => JOuter(tokens.token("outer", outerType));
    
    shared actual JPackage transformPackage(Package that)
            => JPackage(tokens.token("package", packageType));
    
    shared actual JStringLiteral transformStringLiteral(StringLiteral that) {
        value quotes = that.isVerbatim then "\"\"\"" else "\"";
        return JStringLiteral(tokens.token(quotes + that.text + quotes, that.isVerbatim then verbatim_string_literal else string_literal));
    }
    
    shared actual JSelfExpression|JOuter|JPackage transformSelfReference(SelfReference that) {
        assert (is JSelfExpression|JOuter|JPackage ret = super.transformSelfReference(that));
        return ret;
    }
    
    shared actual JSuper transformSuper(Super that)
            => JSuper(tokens.token("super", superType));
    
    shared actual JThis transformThis(This that)
            => JThis(tokens.token("this", thisType));
    
    shared actual JType transformType(Type that) {
        assert (is JType ret = super.transformType(that));
        return ret;
    }
    
    "The RedHat AST has no direct equivalent of [[TypeNameWithArguments]];
     this method throws."
    shared actual Nothing transformTypeNameWithArguments(TypeNameWithArguments that) {
        throw Exception("TypeNameWithArguments has no RedHat AST equivalent!");
    }
    
    shared actual JIdentifier transformUIdentifier(UIdentifier that)
            => JIdentifier(tokens.token(that.name, uidentifier, that.usePrefix then that.name.size + 2 else that.name.size));
}
