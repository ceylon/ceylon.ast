import ceylon.ast.api {
    SimpleType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JQualifiedType=QualifiedType,
        JSimpleType=SimpleType
    }
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[SimpleType|JSimpleType]] to a `ceylon.ast` [[SimpleType]]."
shared SimpleType simpleTypeToCeylon(JSimpleType simpleType) {
    assert (is JBaseType|JQualifiedType simpleType);
    switch (simpleType)
    case (is JBaseType) { return baseTypeToCeylon(simpleType); }
    case (is JQualifiedType) { return qualifiedTypeToCeylon(simpleType); }
}

"Compiles the given [[code]] for a Simple Type
 into a [[SimpleType]] using the Ceylon compiler
 (more specifically, the rule for a `qualifiedType`)."
shared SimpleType? compileSimpleType(String code) {
    if (is JSimpleType jQualifiedType = createParser(code).qualifiedType()) {
        return simpleTypeToCeylon(jQualifiedType);
    } else {
        return null;
    }
}
