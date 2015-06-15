import ceylon.ast.core {
    BaseType,
    Node,
    PackageQualifier,
    TypeArguments,
    TypeNameWithTypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseType=BaseType
    }
}

"Converts a RedHat AST [[BaseType|JBaseType]] to a `ceylon.ast` [[BaseType]]."
shared BaseType baseTypeToCeylon(JBaseType baseType, Anything(JNode,Node) update = noop) {
    TypeArguments? typeArguments;
    if (exists jTypeArguments = baseType.typeArgumentList) {
        typeArguments = typeArgumentsToCeylon(jTypeArguments, update);
    } else {
        typeArguments = null;
    }
    value result = BaseType {
        nameAndArgs = TypeNameWithTypeArguments(uIdentifierToCeylon(baseType.identifier, update), typeArguments);
        qualifier = baseType.packageQualified then PackageQualifier();
    };
    update(baseType, result);
    return result;
}

"Compiles the given [[code]] for a Base Type
 into a [[BaseType]] using the Ceylon compiler
 (more specifically, the rule for a `baseType`)."
shared BaseType? compileBaseType(String code, Anything(JNode,Node) update = noop) {
    if (is JBaseType jBaseType = createParser(code).baseType()) {
        return baseTypeToCeylon(jBaseType, update);
    } else {
        return null;
    }
}
