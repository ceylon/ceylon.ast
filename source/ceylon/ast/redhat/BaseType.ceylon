import ceylon.ast.core {
    BaseType,
    PackageQualifier,
    TypeArguments,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType
    }
}

"Converts a RedHat AST [[BaseType|JBaseType]] to a `ceylon.ast` [[BaseType]]."
shared BaseType baseTypeToCeylon(JBaseType baseType) {
    TypeArguments? typeArguments;
    if (exists jTypeArguments = baseType.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments);
    } else {
        typeArguments = null;
    }
    return BaseType {
        nameAndArgs = TypeNameWithTypeArguments(uIdentifierToCeylon(baseType.identifier), typeArguments);
        qualifier = baseType.packageQualified then PackageQualifier();
    };
}

"Compiles the given [[code]] for a Base Type
 into a [[BaseType]] using the Ceylon compiler
 (more specifically, the rule for a `baseType`)."
shared BaseType? compileBaseType(String code) {
    if (is JBaseType jBaseType = createParser(code).baseType()) {
        return baseTypeToCeylon(jBaseType);
    } else {
        return null;
    }
}
