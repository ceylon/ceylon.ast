import ceylon.ast.core {
    IntersectionType,
    Node,
    PrimaryType,
    UnionType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JStaticType=StaticType,
        JUnionType=UnionType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[UnionType|JUnionType]] to a `ceylon.ast` [[UnionType]]."
shared UnionType unionTypeToCeylon(JUnionType unionType, Anything(JNode, Node) update = noop) {
    assert (nonempty types = CeylonIterable(unionType.staticTypes).collect((JStaticType jType) {
                assert (is PrimaryType|IntersectionType type = typeToCeylon(jType, update));
                return type;
            }));
    value result = UnionType(types);
    update(unionType, result);
    return result;
}

"Parses the given [[code]] for a Union Type
 into an [[UnionType]] using the Ceylon compiler
 (more specifically, the rule for a `unionType`)."
shared UnionType? parseUnionType(String code, Anything(JNode, Node) update = noop) {
    if (is JUnionType jUnionType = createParser(code).unionType()) {
        return unionTypeToCeylon(jUnionType, update);
    } else {
        return null;
    }
}
