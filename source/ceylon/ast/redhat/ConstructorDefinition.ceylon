import ceylon.ast.core {
    ConstructorDefinition,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JConstructor=Constructor,
        JEnumerated=Enumerated
    },
    JNode=Node
}

"Converts a RedHat AST [[Constructor|JConstructor]] or [[Enumerated|JEnumerated]] to a `ceylon.ast` [[ConstructorDefinition]]."
shared ConstructorDefinition constructorDefinitionToCeylon(JConstructor|JEnumerated constructorDefinition, Anything(JNode, Node) update = noop) {
    switch (constructorDefinition)
    case (is JConstructor) { return callableConstructorDefinitionToCeylon(constructorDefinition, update); }
    case (is JEnumerated) { return valueConstructorDefinitionToCeylon(constructorDefinition, update); }
}

"Parses the given [[code]] for a Constructor Definition
 into a [[ConstructorDefinition]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared ConstructorDefinition? parseConstructorDefinition(String code, Anything(JNode, Node) update = noop) {
    if (is JConstructor|JEnumerated jConstructorDefinition = createParser(code).declaration()) {
        return constructorDefinitionToCeylon(jConstructorDefinition, update);
    } else {
        return null;
    }
}
