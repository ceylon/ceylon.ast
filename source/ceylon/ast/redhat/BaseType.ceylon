import ceylon.ast.core {
    TypeArguments,
    BaseType,
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
    return BaseType(TypeNameWithTypeArguments(uIdentifierToCeylon(baseType.identifier), typeArguments));
}

"Compiles the given [[code]] for a Base Type
 into a [[BaseType]] using the Ceylon compiler
 (more specifically, the rule for a `typeNameWithArguments`)."
shared BaseType? compileBaseType(String code) {
    if (exists jTypeNameWithArguments = createParser(code).typeNameWithArguments()) {
        JBaseType baseType = JBaseType(null);
        baseType.identifier = jTypeNameWithArguments.identifier;
        baseType.typeArgumentList = jTypeNameWithArguments.typeArgumentList;
        return baseTypeToCeylon(baseType);
    } else {
        return null;
    }
}
