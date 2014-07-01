import ceylon.ast.core {
    GroupedType,
    QualifiedType,
    SimpleType,
    TypeArguments,
    TypeName,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JGroupedType=GroupedType,
        JQualifiedType=QualifiedType,
        JStaticType=StaticType,
        JType=Type
    }
}
import ceylon.interop.java {
    CeylonIterable
}
import ceylon.ast.redhat {
    identifierToCeylon,
    createParser
}

"Converts a RedHat AST [[QualifiedType|JQualifiedType]] to a `ceylon.ast` [[QualifiedType]]."
shared QualifiedType qualifiedTypeToCeylon(JQualifiedType qualifiedType) {
    assert (is TypeName name = identifierToCeylon(qualifiedType.identifier));
    TypeArguments? arguments;
    if (exists jArgs = qualifiedType.typeArgumentList, nonempty jArguments = CeylonIterable(jArgs.types).sequence()) {
        arguments = jArguments.collect((JType jType) {
                assert (is JStaticType jType);
                return typeToCeylon(jType);
            });
    } else {
        arguments = null;
    }
    SimpleType|GroupedType qualifyingType;
    assert (is JBaseType|JQualifiedType|JGroupedType jQualifyingType = qualifiedType.outerType);
    switch (jQualifyingType)
    case (is JBaseType) { qualifyingType = baseTypeToCeylon(jQualifyingType); }
    case (is JGroupedType) { qualifyingType = groupedTypeToCeylon(jQualifyingType); }
    case (is JQualifiedType) { qualifyingType = qualifiedTypeToCeylon(jQualifyingType); }
    return QualifiedType(qualifyingType, TypeNameWithTypeArguments(name, arguments));
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
