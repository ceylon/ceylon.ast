import ceylon.ast.core {
    GroupedType,
    Node,
    QualifiedType,
    SimpleType,
    TypeArguments,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JGroupedType=GroupedType,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[QualifiedType|JQualifiedType]] to a `ceylon.ast` [[QualifiedType]]."
shared QualifiedType qualifiedTypeToCeylon(JQualifiedType qualifiedType, Anything(JNode,Node) update = noop) {
    TypeArguments? typeArguments;
    if (exists jTypeArguments = qualifiedType.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments, update);
    } else {
        typeArguments = null;
    }
    SimpleType|GroupedType qualifyingType;
    assert (is JBaseType|JQualifiedType|JGroupedType jQualifyingType = qualifiedType.outerType);
    switch (jQualifyingType)
    case (is JBaseType) { qualifyingType = baseTypeToCeylon(jQualifyingType, update); }
    case (is JGroupedType) { qualifyingType = groupedTypeToCeylon(jQualifyingType, update); }
    case (is JQualifiedType) { qualifyingType = qualifiedTypeToCeylon(jQualifyingType, update); }
    value tnta = TypeNameWithTypeArguments(uIdentifierToCeylon(qualifiedType.identifier, update), typeArguments);
    update(qualifiedType, tnta);
    value result = QualifiedType(qualifyingType, tnta);
    update(qualifiedType, result);
    return result;
}

"Parses the given [[code]] for a Qualified Type
 into a [[QualifiedType]] using the Ceylon compiler
 (more specifically, the rule for a `qualifiedType`)."
shared QualifiedType? parseQualifiedType(String code, Anything(JNode,Node) update = noop) {
    if (exists jQualifiedType = createParser(code).qualifiedType()) {
        if (is JQualifiedType jQualifiedType) {
            return qualifiedTypeToCeylon(jQualifiedType, update);
        } else {
            // the grammar rule also allows direct base types
            return null;
        }
    } else {
        return null;
    }
}
