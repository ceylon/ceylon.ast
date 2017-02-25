import ceylon.ast.core {
    Node,
    UnionableType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIntersectionType=IntersectionType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[UnionableType]]."
shared UnionableType unionableTypeToCeylon(JStaticType unionableType, Anything(JNode, Node) update = noop) {
    if (is JIntersectionType unionableType) {
        return intersectionTypeToCeylon(unionableType, update);
    } else {
        return primaryTypeToCeylon(unionableType, update);
    }
}

"Parses the given [[code]] for a Unionable Type
 into a [[UnionableType]] using the Ceylon compiler
 (more specifically, the rule for an `intersectionType`)."
shared UnionableType? parseUnionableType(String code, Anything(JNode, Node) update = noop) {
    if (exists jType = createParser(code).intersectionType()) {
        return unionableTypeToCeylon(jType, update);
    } else {
        return null;
    }
}
