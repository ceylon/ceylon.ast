import ceylon.ast.core {
    Node,
    SimpleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JQualifiedType=QualifiedType,
        JSimpleType=SimpleType
    }
}

"Converts a RedHat AST [[SimpleType|JSimpleType]] to a `ceylon.ast` [[SimpleType]]."
shared SimpleType simpleTypeToCeylon(JSimpleType simpleType, Anything(JNode,Node) update = noop) {
    assert (is JBaseType|JQualifiedType simpleType);
    switch (simpleType)
    case (is JBaseType) { return baseTypeToCeylon(simpleType, update); }
    case (is JQualifiedType) { return qualifiedTypeToCeylon(simpleType, update); }
}

"Compiles the given [[code]] for a Simple Type
 into a [[SimpleType]] using the Ceylon compiler
 (more specifically, the rule for a `qualifiedType`)."
shared SimpleType? compileSimpleType(String code, Anything(JNode,Node) update = noop) {
    if (is JSimpleType jQualifiedType = createParser(code).qualifiedType()) {
        return simpleTypeToCeylon(jQualifiedType, update);
    } else {
        return null;
    }
}
