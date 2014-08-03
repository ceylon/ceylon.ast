import ceylon.ast.core {
    AnyFunction
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyMethod=AnyMethod,
        JMethodDeclaration=MethodDeclaration,
        JMethodDefinition=MethodDefinition
    }
}

"Converts a RedHat AST [[AnyMethod|JAnyMethod]] to a `ceylon.ast` [[AnyFunction]]."
shared AnyFunction anyFunctionToCeylon(JAnyMethod anyFunction) {
    assert (is JMethodDefinition|JMethodDeclaration anyFunction);
    switch (anyFunction)
    case (is JMethodDefinition) {
        throw AssertionError("Function definitions not supported yet"); // TODO implement function definitions
    }
    case (is JMethodDeclaration) {
        if (anyFunction.specifierExpression exists) {
            throw AssertionError("Function shortcut definitions not implemented yet"); // TODO implement function shortcut definitions
        } else {
            return functionDeclarationToCeylon(anyFunction);
        }
    }
}

"Compiles the given [[code]] for Any Function
 into an [[AnyFunction]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared AnyFunction? compileAnyFunction(String code) {
    if (is JAnyMethod jDeclaration = createParser(code).declaration()) {
        return anyFunctionToCeylon(jDeclaration);
    } else {
        return null;
    }
}
