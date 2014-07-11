import ceylon.ast.core {
    IntersectionType,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionType=IntersectionType,
        JStaticType=StaticType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[IntersectionType|JIntersectionType]] to a `ceylon.ast` [[IntersectionType]]."
shared IntersectionType intersectionTypeToCeylon(JIntersectionType intersectionType) {
    assert (nonempty types = CeylonIterable(intersectionType.staticTypes).collect((JStaticType jType) {
                assert (is PrimaryType type = typeToCeylon(jType));
                return type;
            }));
    return IntersectionType(types);
}

"Compiles the given [[code]] for an Intersection Type
 into an [[IntersectionType]] using the Ceylon compiler
 (more specifically, the rule for an `intersectionType`)."
shared IntersectionType? compileIntersectionType(String code) {
    if (is JIntersectionType jIntersectionType = createParser(code).intersectionType()) {
        return intersectionTypeToCeylon(jIntersectionType);
    } else {
        return null;
    }
}
