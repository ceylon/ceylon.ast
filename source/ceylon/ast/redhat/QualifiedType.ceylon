import ceylon.ast.core {
    GroupedType,
    QualifiedType,
    SimpleType,
    TypeArguments,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JGroupedType=GroupedType,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[QualifiedType|JQualifiedType]] to a `ceylon.ast` [[QualifiedType]]."
shared QualifiedType qualifiedTypeToCeylon(JQualifiedType qualifiedType) {
    TypeArguments? typeArguments;
    if (exists jTypeArguments = qualifiedType.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments);
    } else {
        typeArguments = null;
    }
    SimpleType|GroupedType qualifyingType;
    assert (is JBaseType|JQualifiedType|JGroupedType jQualifyingType = qualifiedType.outerType);
    switch (jQualifyingType)
    case (is JBaseType) { qualifyingType = baseTypeToCeylon(jQualifyingType); }
    case (is JGroupedType) { qualifyingType = groupedTypeToCeylon(jQualifyingType); }
    case (is JQualifiedType) { qualifyingType = qualifiedTypeToCeylon(jQualifyingType); }
    return QualifiedType(qualifyingType, TypeNameWithTypeArguments(uIdentifierToCeylon(qualifiedType.identifier), typeArguments));
}

"Compiles the given [[code]] for a Qualified Type
 into a [[QualifiedType]] using the Ceylon compiler
 (more specifically, the rule for a `qualifiedType`)."
shared QualifiedType? compileQualifiedType(String code) {
    if (exists jQualifiedType = createParser(code).qualifiedType()) {
        if (is JQualifiedType jQualifiedType) {
            return qualifiedTypeToCeylon(jQualifiedType);
        } else {
            // the grammar rule also allows direct base types
            return null;
        }
    } else {
        return null;
    }
}
