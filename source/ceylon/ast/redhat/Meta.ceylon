import ceylon.ast.core {
    Meta,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JMemberLiteral=MemberLiteral,
        JMetaLiteral=MetaLiteral,
        JTypeLiteral=TypeLiteral
    }
}

"Converts a RedHat AST [[MetaLiteral|JMetaLiteral]] to a `ceylon.ast` [[Meta]]."
shared Meta metaToCeylon(JMetaLiteral metaLiteral, Anything(JNode,Node) update = noop) {
    assert (is JTypeLiteral|JMemberLiteral metaLiteral);
    switch (metaLiteral)
    case (is JTypeLiteral) { return typeMetaToCeylon(metaLiteral, update); }
    case (is JMemberLiteral) {
        if (metaLiteral.type exists) {
            return memberMetaToCeylon(metaLiteral, update);
        } else {
            return baseMetaToCeylon(metaLiteral, update);
        }
    }
}

"Parses the given [[code]] for a Meta
 into a [[Meta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared Meta? parseMeta(String code, Anything(JNode,Node) update = noop) {
    if (exists jMetaLiteral = createParser(code).metaLiteral()) {
        return metaToCeylon(jMetaLiteral, update);
    } else {
        return null;
    }
}
