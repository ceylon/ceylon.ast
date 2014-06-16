import ceylon.ast.api {
    TypeArguments,
    QualifiedType,
    SimpleType,
    TypeName,
    TypeNameWithArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JQualifiedType=QualifiedType
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
        arguments = jArguments.collect(typeToCeylon);
    } else {
        arguments = null;
    }
    SimpleType qualifyingType;
    assert (is JBaseType|JQualifiedType jQualifyingType = qualifiedType.outerType);
    switch (jQualifyingType)
    case (is JQualifiedType) { qualifyingType = qualifiedTypeToCeylon(jQualifyingType); }
    case (is JBaseType) { qualifyingType = baseTypeToCeylon(jQualifyingType); }
    return QualifiedType(qualifyingType, TypeNameWithArguments(name, arguments));
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
