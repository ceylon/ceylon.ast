import ceylon.ast.core {
    Node,
    PackageCompilationUnit
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[PackageCompilationUnit]]."
throws (`class AssertionError`, "If the compilation unit contains module descriptors, declarations, or not exactly one package descriptor")
shared PackageCompilationUnit packageCompilationUnitToCeylon(JCompilationUnit packageCompilationUnit, Anything(JNode, Node) update = noop) {
    "Must not have declarations or module descriptors"
    assert (packageCompilationUnit.declarations.empty,
        packageCompilationUnit.moduleDescriptors.empty);
    "Must have exactly one package descriptor"
    assert (packageCompilationUnit.packageDescriptors.size() == 1);
    value packageDescriptor = packageCompilationUnit.packageDescriptors.get(0);
    value result = PackageCompilationUnit(packageDescriptorToCeylon(packageDescriptor, update), CeylonIterable(packageCompilationUnit.importList.imports).collect(propagateUpdate(importToCeylon, update)));
    update(packageCompilationUnit, result);
    return result;
}

"Parses the given [[code]] for a Package Compilation Unit
 into a [[PackageCompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared PackageCompilationUnit? parsePackageCompilationUnit(String code, Anything(JNode, Node) update = noop) {
    if (exists jCompilationUnit = createParser(code).compilationUnit(),
        jCompilationUnit.packageDescriptors.size() == 1,
        jCompilationUnit.declarations.empty,
        jCompilationUnit.moduleDescriptors.empty) {
        return packageCompilationUnitToCeylon(jCompilationUnit, update);
    } else {
        return null;
    }
}
