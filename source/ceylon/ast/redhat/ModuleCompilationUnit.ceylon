import ceylon.ast.core {
    ModuleCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[ModuleCompilationUnit]]."
throws (`class AssertionError`, "If the compilation unit contains package descriptors, declarations, or not exactly one module descriptor")
shared ModuleCompilationUnit moduleCompilationUnitToCeylon(JCompilationUnit moduleCompilationUnit) {
    "Must not have declarations or package descriptors"
    assert (moduleCompilationUnit.declarations.empty,
        moduleCompilationUnit.packageDescriptors.empty);
    "Must have exactly one module descriptor"
    assert (moduleCompilationUnit.moduleDescriptors.size() == 1);
    value moduleDescriptor = moduleCompilationUnit.moduleDescriptors.get(0);
    return ModuleCompilationUnit(moduleDescriptorToCeylon(moduleDescriptor), CeylonIterable(moduleCompilationUnit.importList.imports).collect(importToCeylon));
}

"Compiles the given [[code]] for a Module Compilation Unit
 into a [[ModuleCompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared ModuleCompilationUnit? compileModuleCompilationUnit(String code) {
    if (exists jCompilationUnit = createParser(code).compilationUnit(),
        jCompilationUnit.moduleDescriptors.size() == 1,
        jCompilationUnit.declarations.empty,
        jCompilationUnit.packageDescriptors.empty) {
        return moduleCompilationUnitToCeylon(jCompilationUnit);
    } else {
        return null;
    }
}
