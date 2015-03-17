import ceylon.ast.core {
    MemberMeta,
    MemberNameWithTypeArguments,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[MemberMeta]]."
shared MemberMeta memberMetaToCeylon(JMemberLiteral memberMeta) {
    assert (exists jQualifier = memberMeta.type);
    "Must not be a reference expression"
    assert (!memberMeta is JFunctionLiteral|JValueLiteral); // reference expressions are subtypes of meta expressions. ew
    
    return MemberMeta {
        value qualifier {
            assert (is PrimaryType type = typeToCeylon(jQualifier));
            return type;
        }
        nameAndArgs = MemberNameWithTypeArguments {
            name = lIdentifierToCeylon(memberMeta.identifier);
            typeArguments = if (exists jTypeArguments = memberMeta.typeArgumentList)
            then typeArgumentsToCeylon(jTypeArguments)
            else null;
        };
    };
}

"Compiles the given [[code]] for a Member Meta
 into a [[MemberMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared MemberMeta? compileMemberMeta(String code) {
    if (is JMemberLiteral jMetaLiteral = createParser(code).metaLiteral(),
        jMetaLiteral.type exists,
        !jMetaLiteral is JFunctionLiteral|JValueLiteral) {
        return memberMetaToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
