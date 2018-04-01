import ceylon.ast.core {
    AnyFunction
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyFunctionToCeylon,
    parseAnyFunction
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyMethod=AnyMethod
    }
}

shared object anyFunction satisfies AbstractTest<AnyFunction,JAnyMethod> {
    parse = parseAnyFunction;
    fromCeylon = RedHatTransformer.transformAnyFunction;
    toCeylon = anyFunctionToCeylon;
    
    tests = [functionDeclaration, functionDefinition, functionShortcutDefinition];
}
