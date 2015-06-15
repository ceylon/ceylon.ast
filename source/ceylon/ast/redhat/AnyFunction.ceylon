import ceylon.ast.core {
    AnyFunction,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAnyMethod=AnyMethod,
        JMethodDeclaration=MethodDeclaration,
        JMethodDefinition=MethodDefinition
    }
}

"Converts a RedHat AST [[AnyMethod|JAnyMethod]] to a `ceylon.ast` [[AnyFunction]]."
shared AnyFunction anyFunctionToCeylon(JAnyMethod anyFunction, Anything(JNode,Node) update = noop) {
    assert (is JMethodDefinition|JMethodDeclaration anyFunction);
    switch (anyFunction)
    case (is JMethodDefinition) {
        return functionDefinitionToCeylon(anyFunction, update);
    }
    case (is JMethodDeclaration) {
        if (anyFunction.specifierExpression exists) {
            return functionShortcutDefinitionToCeylon(anyFunction, update);
        } else {
            return functionDeclarationToCeylon(anyFunction, update);
        }
    }
}

"Compiles the given [[code]] for Any Function
 into an [[AnyFunction]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyFunction? compileAnyFunction(String code, Anything(JNode,Node) update = noop) {
    if (is JAnyMethod jDeclaration = createParser(code).declaration()) {
        return anyFunctionToCeylon(jDeclaration, update);
    } else {
        return null;
    }
}
