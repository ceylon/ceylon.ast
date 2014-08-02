import ceylon.ast.core {
    LIdentifier,
    MemberMeta,
    MemberNameWithTypeArguments,
    MetaQualifier,
    TypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberExpression=BaseMemberExpression,
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JStaticType=StaticType,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[MemberMeta]]."
shared MemberMeta memberMetaToCeylon(JMemberLiteral memberMeta) {
    assert (exists jQualifier = memberMeta.type else memberMeta.objectExpression);
    "Must not be a reference expression"
    assert (!memberMeta is JFunctionLiteral|JValueLiteral); // reference expressions are subtypes of meta expressions. ew
    MetaQualifier qualifier;
    switch (jQualifier)
    case (is JStaticType) {
        assert (is MetaQualifier qual = typeToCeylon(jQualifier));
        qualifier = qual;
    }
    case (is JBaseMemberExpression) {
        value qual = baseExpressionToCeylon(jQualifier).nameAndArgs;
        "Must not have type arguments"
        assert (!qual.typeArguments exists);
        assert (is LIdentifier name = qual.name);
        qualifier = name;
    }
    TypeArguments? typeArguments;
    if (exists jTypeArguments = memberMeta.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments);
    } else {
        typeArguments = null;
    }
    return MemberMeta(qualifier, MemberNameWithTypeArguments(lIdentifierToCeylon(memberMeta.identifier), typeArguments));
}

"Compiles the given [[code]] for a Member Meta
 into a [[MemberMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared MemberMeta? compileMemberMeta(String code) {
    if (is JMemberLiteral jMetaLiteral = createParser(code).metaLiteral(),
        jMetaLiteral.type exists || jMetaLiteral.objectExpression exists,
        !jMetaLiteral is JFunctionLiteral|JValueLiteral) {
        return memberMetaToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
