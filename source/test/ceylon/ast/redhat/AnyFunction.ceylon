import ceylon.ast.core {
    AnyFunction
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyFunctionToCeylon,
    compileAnyFunction
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAnyMethod=AnyMethod
    }
}

shared object anyFunction satisfies AbstractTest<AnyFunction,JAnyMethod> {
    compile = compileAnyFunction;
    fromCeylon = RedHatTransformer.transformAnyFunction;
    toCeylon = anyFunctionToCeylon;
    
    tests = [functionDeclaration];
}
