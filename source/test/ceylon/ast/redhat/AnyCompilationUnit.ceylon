import ceylon.ast.core {
    AnyCompilationUnit
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyCompilationUnitToCeylon,
    compileAnyCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

shared object anyCompilationUnit satisfies AbstractTest<AnyCompilationUnit,JCompilationUnit> {
    compile = compileAnyCompilationUnit;
    fromCeylon = RedHatTransformer.transformAnyCompilationUnit;
    toCeylon = anyCompilationUnitToCeylon;
    
    tests = [compilationUnit, moduleCompilationUnit, packageCompilationUnit];
}
