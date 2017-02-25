import ceylon.ast.core {
    InlineDefinitionArgument,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAttributeArgument=AttributeArgument,
        JMethodArgument=MethodArgument,
        JTypedArgument=TypedArgument,
        JObjectArgument=ObjectArgument
    }
}

"Converts a RedHat AST [[TypedArgument|JTypedArgument]] to a `ceylon.ast` [[InlineDefinitionArgument]]."
shared InlineDefinitionArgument inlineDefinitionArgumentToCeylon(JTypedArgument inlineDefinitionArgument, Anything(JNode, Node) update = noop) {
    assert (is JAttributeArgument|JMethodArgument|JObjectArgument inlineDefinitionArgument);
    switch (inlineDefinitionArgument)
    case (is JAttributeArgument) { return valueArgumentToCeylon(inlineDefinitionArgument, update); }
    case (is JMethodArgument) { return functionArgumentToCeylon(inlineDefinitionArgument, update); }
    case (is JObjectArgument) { return objectArgumentToCeylon(inlineDefinitionArgument, update); }
}

"Parses the given [[code]] for an Inline Definition Argument
 into an [[InlineDefinitionArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgumentDeclaration`)."
shared InlineDefinitionArgument? parseInlineDefinitionArgument(String code, Anything(JNode, Node) update = noop) {
    if (is JTypedArgument jNamedArgumentDeclaration = createParser(code).namedArgumentDeclaration()) {
        return inlineDefinitionArgumentToCeylon(jNamedArgumentDeclaration, update);
    } else {
        return null;
    }
}
