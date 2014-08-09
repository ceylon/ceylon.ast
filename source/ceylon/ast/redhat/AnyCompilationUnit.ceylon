import ceylon.ast.core {
    AnyCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[AnyCompilationUnit]]."
shared AnyCompilationUnit anyCompilationUnitToCeylon(JCompilationUnit anyCompilationUnit) {
    if (!anyCompilationUnit.declarations.empty) {
        return compilationUnitToCeylon(anyCompilationUnit);
    } else if (!anyCompilationUnit.packageDescriptors.empty) {
        return packageCompilationUnitToCeylon(anyCompilationUnit);
    } else if (!anyCompilationUnit.moduleDescriptors.empty) {
        return moduleCompilationUnitToCeylon(anyCompilationUnit);
    } else {
        // an empty compilation unit is a regular compilation unit
        return compilationUnitToCeylon(anyCompilationUnit);
    }
}

"Compiles the given [[code]] for Any Compilation Unit
 into an [[AnyCompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared AnyCompilationUnit? compileAnyCompilationUnit(String code) {
    if (exists jCompilationUnit = createParser(code).compilationUnit()) {
        return anyCompilationUnitToCeylon(jCompilationUnit);
    } else {
        return null;
    }
}
