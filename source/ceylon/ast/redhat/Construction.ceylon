import ceylon.ast.core {
    BaseType,
    Construction,
    MemberNameWithTypeArguments,
    Node,
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
        JSuperType=SuperType
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        lidentifier=\iLIDENTIFIER
    }
}

"Converts a RedHat AST [[InvocationExpression|JInvocationExpression]] to a `ceylon.ast` [[Construction]]."
shared Construction constructionToCeylon(JInvocationExpression construction, Anything(JNode, Node) update = noop) {
    assert (is JExtendedTypeExpression ete = construction.primary);
    assert (is JBaseType|JQualifiedType type = ete.type);
    value name = lIdentifierToCeylon(type.identifier, update);
    value ta = anyTypeArgumentsToCeylon(type.typeArgumentList, update);
    MemberNameWithTypeArguments nameAndArgs = MemberNameWithTypeArguments(name, ta);
    update(construction, nameAndArgs);
    value arguments = positionalArgumentsToCeylon(construction.positionalArgumentList, update);
    BaseType|Super? qualifier;
    switch (type)
    case (is JBaseType) {
        qualifier = null;
    }
    case (is JQualifiedType) {
        assert (is JBaseType|JSuperType ot = type.outerType);
        switch (ot)
        case (is JBaseType) {
            qualifier = baseTypeToCeylon(ot, update);
        }
        case (is JSuperType) {
            qualifier = Super();
        }
        assert (exists qualifier);
        update(ot, qualifier);
    }
    value result = Construction(nameAndArgs, arguments, qualifier);
    update(construction, result);
    return result;
}

"Parses the given [[code]] for a Construction
 into a [[Construction]] using the Ceylon compiler
 (more specifically, the rule for a `classInstantiation`)."
shared Construction? parseConstruction(String code, Anything(JNode, Node) update = noop) {
    if (exists jClassInstantiation = createParser(code).classInstantiation(),
        exists ie = jClassInstantiation.invocationExpression,
        is JExtendedTypeExpression ete = ie.primary,
        ete.type.identifier.token.type == lidentifier) {
        return constructionToCeylon(ie, update);
    } else {
        return null;
    }
}
