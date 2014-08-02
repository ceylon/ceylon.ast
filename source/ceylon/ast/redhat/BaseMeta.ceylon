import ceylon.ast.core {
    BaseMeta,
    MemberName,
    MemberNameWithTypeArguments,
    TypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[BaseMeta]]."
shared BaseMeta baseMetaToCeylon(JMemberLiteral baseMeta) {
    "Must be unqualified"
    assert (!baseMeta.type exists,
        !baseMeta.objectExpression exists);
    "Must not be a reference expression"
    assert (!baseMeta is JFunctionLiteral|JValueLiteral); // reference expressions are subtypes of meta expressions. ew
    assert (is MemberName name = identifierToCeylon(baseMeta.identifier));
    TypeArguments? typeArguments;
    if (exists jTypeArguments = baseMeta.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments);
    } else {
        typeArguments = null;
    }
    return BaseMeta(MemberNameWithTypeArguments(name, typeArguments));
}

"Compiles the given [[code]] for a Base Meta
 into a [[BaseMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared BaseMeta? compileBaseMeta(String code) {
    if (is JMemberLiteral jMetaLiteral = createParser(code).metaLiteral(),
        !jMetaLiteral.type exists,
        !jMetaLiteral.objectExpression exists,
        !jMetaLiteral is JFunctionLiteral|JValueLiteral) {
        return baseMetaToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
