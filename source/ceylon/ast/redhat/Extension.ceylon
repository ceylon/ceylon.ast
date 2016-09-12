import ceylon.ast.core {
    Extension,
    TypeNameWithTypeArguments,
    Node,
    PackageQualifier,
    PositionalArguments,
    SimpleType,
    Super
}
import com.redhat.ceylon.compiler.typechecker.tree {
    CustomTree {
        JExtendedTypeExpression=ExtendedTypeExpression
    },
    JNode=Node,
    Tree {
        JBaseType=BaseType,
        JInvocationExpression=InvocationExpression,
        JQualifiedType=QualifiedType,
        JSimpleType=SimpleType,
        JSuperType=SuperType
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        lidentifier=\iLIDENTIFIER
    }
}

"Converts a RedHat AST [[InvocationExpression|JInvocationExpression]] or [[SimpleType|JSimpleType]] to a `ceylon.ast` [[Extension]]."
shared Extension extensionToCeylon(JInvocationExpression|JSimpleType extension, Anything(JNode,Node) update = noop) {
    PositionalArguments? arguments;
    JSimpleType type;
    switch (extension)
    case (is JInvocationExpression) {
        arguments = positionalArgumentsToCeylon(extension.positionalArgumentList, update);
        assert (is JExtendedTypeExpression ete = extension.primary);
        type = ete.type;
    }
    case (is JSimpleType) {
        arguments = null;
        type = extension;
    }
    assert (is JBaseType|JQualifiedType type);
    value name = uIdentifierToCeylon(type.identifier, update);
    value ta = anyTypeArgumentsToCeylon(type.typeArgumentList, update);
    TypeNameWithTypeArguments nameAndArgs = TypeNameWithTypeArguments(name, ta);
    update(extension, nameAndArgs);
    PackageQualifier|Super|SimpleType? qualifier;
    switch (type)
    case (is JBaseType) {
        if (type.packageQualified) {
            value pq = PackageQualifier();
            update(type, pq);
            qualifier = pq;
        } else {
            qualifier = null;
        }
    }
    case (is JQualifiedType) {
        switch (ot = type.outerType)
        case (is JSuperType) {
            value sq = Super();
            update(ot, sq);
            qualifier = sq;
        }
        case (is JSimpleType) {
            qualifier = simpleTypeToCeylon(ot, update);
        }
        else {
            throw AssertionError("Unknown kind of qualified type in extension");
        }
    }
    value result = Extension(nameAndArgs, arguments, qualifier);
    update(extension, result);
    return result;
}

"Parses the given [[code]] for an Extension
 into an [[Extension]] using the Ceylon compiler
 (more specifically, the rule for an `classInstantiation`)."
shared Extension? parseExtension(String code, Anything(JNode,Node) update = noop) {
    if (exists jClassInstantiation = createParser(code).classInstantiation()) {
        if (exists ie = jClassInstantiation.invocationExpression,
            is JExtendedTypeExpression ete = ie.primary,
            ete.type.identifier.token.type == lidentifier) {
            // construction
            return null;
        } else {
            return extensionToCeylon(jClassInstantiation.invocationExpression else jClassInstantiation.type, update);
        }
    } else {
        return null;
    }
}
