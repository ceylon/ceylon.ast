import ceylon.ast.core {
    MemberMeta,
    MemberNameWithTypeArguments,
    Node,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JValueLiteral=ValueLiteral
    }
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[MemberMeta]]."
shared MemberMeta memberMetaToCeylon(JMemberLiteral memberMeta, Anything(JNode,Node) update = noop) {
    assert (exists jQualifier = memberMeta.type);
    "Must not be a reference expression"
    assert (!memberMeta is JFunctionLiteral|JValueLiteral); // reference expressions are subtypes of meta expressions. ew
    
    value result = MemberMeta {
        value qualifier {
            assert (is PrimaryType type = typeToCeylon(jQualifier, update));
            return type;
        }
        nameAndArgs = MemberNameWithTypeArguments {
            name = lIdentifierToCeylon(memberMeta.identifier, update);
            typeArguments = if (exists jTypeArguments = memberMeta.typeArgumentList)
            then typeArgumentsToCeylon(jTypeArguments, update)
            else null;
        };
    };
    update(memberMeta, result);
    return result;
}

"Compiles the given [[code]] for a Member Meta
 into a [[MemberMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared MemberMeta? compileMemberMeta(String code, Anything(JNode,Node) update = noop) {
    if (is JMemberLiteral jMetaLiteral = createParser(code).metaLiteral(),
        jMetaLiteral.type exists,
        !jMetaLiteral is JFunctionLiteral|JValueLiteral) {
        return memberMetaToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
