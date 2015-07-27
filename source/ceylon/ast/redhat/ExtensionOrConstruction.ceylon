import ceylon.ast.core {
    ExtensionOrConstruction,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    CustomTree {
        JExtendedTypeExpression=ExtendedTypeExpression
    },
    JNode=Node,
    Tree {
        JInvocationExpression=InvocationExpression,
        JSimpleType=SimpleType
    }
}
import com.redhat.ceylon.compiler.typechecker.parser {
    CeylonLexer {
        lidentifier=\iLIDENTIFIER
    }
}

"Converts a RedHat AST [[InvocationExpression|JInvocationExpression]] or [[SimpleType|JSimpleType]] to a `ceylon.ast` [[ExtensionOrConstruction]]."
shared ExtensionOrConstruction extensionOrConstructionToCeylon(JInvocationExpression|JSimpleType extensionOrConstruction, Anything(JNode,Node) update = noop) {
    switch (extensionOrConstruction)
    case (is JInvocationExpression) {
        assert (is JExtendedTypeExpression ete = extensionOrConstruction.primary);
        if (ete.type.identifier.token.type == lidentifier) {
            return constructionToCeylon(extensionOrConstruction, update);
        } else {
            return extensionToCeylon(extensionOrConstruction, update);
        }
    }
    case (is JSimpleType) {
        return extensionToCeylon(extensionOrConstruction, update);
    }
}

"Compiles the given [[code]] for an Extension Or Construction
 into an [[ExtensionOrConstruction]] using the Ceylon compiler
 (more specifically, the rule for an `classInstantiation`)."
shared ExtensionOrConstruction? compileExtensionOrConstruction(String code, Anything(JNode,Node) update = noop) {
    if (exists jClassInstantiation = createParser(code).classInstantiation()) {
        return extensionOrConstructionToCeylon(jClassInstantiation.invocationExpression else jClassInstantiation.type, update);
    } else {
        return null;
    }
}
