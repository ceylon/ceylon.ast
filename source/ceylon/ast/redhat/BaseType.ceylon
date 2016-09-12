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
        value nameAndArgs {
            value result = TypeNameWithTypeArguments(uIdentifierToCeylon(baseType.identifier, update), typeArguments);
            update(baseType, result);
            return result;
        }
        value qualifier {
            if (baseType.packageQualified) {
                value pq = PackageQualifier();
                update(baseType, pq);
                return pq;
            } else {
                return null;
            }
        }
    };
    update(baseType, result);
    return result;
}

"Parses the given [[code]] for a Base Type
 into a [[BaseType]] using the Ceylon compiler
 (more specifically, the rule for a `baseType`)."
shared BaseType? parseBaseType(String code, Anything(JNode,Node) update = noop) {
    if (is JBaseType jBaseType = createParser(code).baseType()) {
        return baseTypeToCeylon(jBaseType, update);
    } else {
        return null;
    }
}
