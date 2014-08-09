import ceylon.ast.core {
    PackageCompilationUnit
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[PackageCompilationUnit]]."
throws (`class AssertionError`, "If the compilation unit contains module descriptors, declarations, or not exactly one package descriptor")
shared PackageCompilationUnit packageCompilationUnitToCeylon(JCompilationUnit packageCompilationUnit) {
    "Must not have declarations or module descriptors"
    assert (packageCompilationUnit.declarations.empty,
        packageCompilationUnit.moduleDescriptors.empty);
    "Must have exactly one package descriptor"
    assert (packageCompilationUnit.packageDescriptors.size() == 1);
    value packageDescriptor = packageCompilationUnit.packageDescriptors.get(0);
    return PackageCompilationUnit(packageDescriptorToCeylon(packageDescriptor), CeylonIterable(packageCompilationUnit.importList.imports).collect(importToCeylon));
}

"Compiles the given [[code]] for a Package Compilation Unit
 into a [[PackageCompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared PackageCompilationUnit? compilePackageCompilationUnit(String code) {
    if (exists jCompilationUnit = createParser(code).compilationUnit(),
        jCompilationUnit.packageDescriptors.size() == 1,
        jCompilationUnit.declarations.empty,
        jCompilationUnit.moduleDescriptors.empty) {
        return packageCompilationUnitToCeylon(jCompilationUnit);
    } else {
        return null;
    }
}
