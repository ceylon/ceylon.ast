import ceylon.ast.core {
    Meta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMemberLiteral=MemberLiteral,
        JMetaLiteral=MetaLiteral,
        JTypeLiteral=TypeLiteral
    }
}

"Converts a RedHat AST [[MetaLiteral|JMetaLiteral]] to a `ceylon.ast` [[Meta]]."
shared Meta metaToCeylon(JMetaLiteral metaLiteral) {
    assert (is JTypeLiteral|JMemberLiteral metaLiteral);
    switch (metaLiteral)
    case (is JTypeLiteral) { return typeMetaToCeylon(metaLiteral); }
    case (is JMemberLiteral) { return memberMetaToCeylon(metaLiteral); }
}

"Compiles the given [[code]] for a Meta
 into a [[Meta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared Meta? compileMeta(String code) {
    if (exists jMetaLiteral = createParser(code).metaLiteral()) {
        return metaToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
