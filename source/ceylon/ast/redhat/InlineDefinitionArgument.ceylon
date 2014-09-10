import ceylon.ast.core {
    InlineDefinitionArgument
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeArgument=AttributeArgument,
        JMethodArgument=MethodArgument,
        JTypedArgument=TypedArgument,
        JObjectArgument=ObjectArgument
    }
}

"Converts a RedHat AST [[TypedArgument|JTypedArgument]] to a `ceylon.ast` [[InlineDefinitionArgument]]."
shared InlineDefinitionArgument inlineDefinitionArgumentToCeylon(JTypedArgument inlineDefinitionArgument) {
    assert (is JAttributeArgument|JMethodArgument|JObjectArgument inlineDefinitionArgument);
    switch (inlineDefinitionArgument)
    case (is JAttributeArgument) { return valueArgumentToCeylon(inlineDefinitionArgument); }
    case (is JMethodArgument) { return functionArgumentToCeylon(inlineDefinitionArgument); }
    case (is JObjectArgument) { return objectArgumentToCeylon(inlineDefinitionArgument); }
}

"Compiles the given [[code]] for an Inline Definition Argument
 into an [[InlineDefinitionArgument]] using the Ceylon compiler
 (more specifically, the rule for a `namedArgumentDeclaration`)."
shared InlineDefinitionArgument? compileInlineDefinitionArgument(String code) {
    if (is JTypedArgument jNamedArgumentDeclaration = createParser(code).namedArgumentDeclaration()) {
        return inlineDefinitionArgumentToCeylon(jNamedArgumentDeclaration);
    } else {
        return null;
    }
}
