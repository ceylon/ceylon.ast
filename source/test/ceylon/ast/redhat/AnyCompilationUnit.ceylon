import ceylon.ast.core {
    AnyCompilationUnit
}
import ceylon.ast.redhat {
    RedHatTransformer,
    anyCompilationUnitToCeylon,
    parseAnyCompilationUnit
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

shared object anyCompilationUnit satisfies AbstractTest<AnyCompilationUnit,JCompilationUnit> {
    parse = parseAnyCompilationUnit;
    fromCeylon = RedHatTransformer.transformAnyCompilationUnit;
    toCeylon = anyCompilationUnitToCeylon;
    
    tests = [compilationUnit, moduleCompilationUnit, packageCompilationUnit];
}
