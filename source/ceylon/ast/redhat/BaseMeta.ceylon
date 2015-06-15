import ceylon.ast.core {
    BaseMeta,
    MemberName,
    MemberNameWithTypeArguments,
    Node,
    PackageQualifier,
    TypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[BaseMeta]]."
shared BaseMeta baseMetaToCeylon(JMemberLiteral baseMeta, Anything(JNode,Node) update = noop) {
    "Must be unqualified"
    assert (!baseMeta.type exists);
    "Must not be a reference expression"
    assert (!baseMeta is JFunctionLiteral|JValueLiteral); // reference expressions are subtypes of meta expressions. ew
    assert (is MemberName name = identifierToCeylon(baseMeta.identifier, update));
    TypeArguments? typeArguments;
    if (exists jTypeArguments = baseMeta.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments, update);
    } else {
        typeArguments = null;
    }
    value result = BaseMeta(MemberNameWithTypeArguments(name, typeArguments), baseMeta.packageQualified then PackageQualifier());
    update(baseMeta, result);
    return result;
}

"Compiles the given [[code]] for a Base Meta
 into a [[BaseMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared BaseMeta? compileBaseMeta(String code, Anything(JNode,Node) update = noop) {
    if (is JMemberLiteral jMetaLiteral = createParser(code).metaLiteral(),
        !jMetaLiteral.type exists,
        !jMetaLiteral is JFunctionLiteral|JValueLiteral) {
        return baseMetaToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
