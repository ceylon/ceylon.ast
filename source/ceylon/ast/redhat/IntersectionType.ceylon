import ceylon.ast.core {
    IntersectionType,
    Node,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIntersectionType=IntersectionType,
        JStaticType=StaticType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[IntersectionType|JIntersectionType]] to a `ceylon.ast` [[IntersectionType]]."
shared IntersectionType intersectionTypeToCeylon(JIntersectionType intersectionType, Anything(JNode,Node) update = noop) {
    assert (nonempty types = CeylonIterable(intersectionType.staticTypes).collect((JStaticType jType) {
                assert (is PrimaryType type = typeToCeylon(jType, update));
                return type;
            }));
    value result = IntersectionType(types);
    update(intersectionType, result);
    return result;
}

"Compiles the given [[code]] for an Intersection Type
 into an [[IntersectionType]] using the Ceylon compiler
 (more specifically, the rule for an `intersectionType`)."
shared IntersectionType? compileIntersectionType(String code, Anything(JNode,Node) update = noop) {
    if (is JIntersectionType jIntersectionType = createParser(code).intersectionType()) {
        return intersectionTypeToCeylon(jIntersectionType, update);
    } else {
        return null;
    }
}
