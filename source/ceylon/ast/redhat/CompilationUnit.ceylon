import ceylon.ast.core {
    CompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[CompilationUnit]]."
throws (`class AssertionError`, "If the compilation unit contains package or module descriptors")
shared CompilationUnit compilationUnitToCeylon(JCompilationUnit compilationUnit) {
    "Must not have package or module descriptors"
    assert (compilationUnit.packageDescriptors.empty,
        compilationUnit.moduleDescriptors.empty);
    return CompilationUnit {
        declarations = CeylonIterable(compilationUnit.declarations).collect(declarationToCeylon);
        imports = CeylonIterable(compilationUnit.importList.imports).collect(importToCeylon);
    };
}

"Compiles the given [[code]] for a Compilation Unit
 into a [[CompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared CompilationUnit? compileCompilationUnit(String code) {
    if (exists jCompilationUnit = createParser(code).compilationUnit(),
        jCompilationUnit.packageDescriptors.empty,
        jCompilationUnit.moduleDescriptors.empty) {
        return compilationUnitToCeylon(jCompilationUnit);
    } else {
        return null;
    }
}
