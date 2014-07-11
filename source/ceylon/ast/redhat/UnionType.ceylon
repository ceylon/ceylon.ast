import ceylon.ast.core {
    IntersectionType,
    PrimaryType,
    UnionType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JStaticType=StaticType,
        JUnionType=UnionType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[UnionType|JUnionType]] to a `ceylon.ast` [[UnionType]]."
shared UnionType unionTypeToCeylon(JUnionType unionType) {
    assert (nonempty types = CeylonIterable(unionType.staticTypes).collect((JStaticType jType) {
                assert (is PrimaryType|IntersectionType type = typeToCeylon(jType));
                return type;
            }));
    return UnionType(types);
}

"Compiles the given [[code]] for a Union Type
 into an [[UnionType]] using the Ceylon compiler
 (more specifically, the rule for a `unionType`)."
shared UnionType? compileUnionType(String code) {
    if (is JUnionType jUnionType = createParser(code).unionType()) {
        return unionTypeToCeylon(jUnionType);
    } else {
        return null;
    }
}
