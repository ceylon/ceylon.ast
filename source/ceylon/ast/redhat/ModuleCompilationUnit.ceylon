import ceylon.ast.core {
    ModuleCompilationUnit,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCompilationUnit=CompilationUnit
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[ModuleCompilationUnit]]."
throws (`class AssertionError`, "If the compilation unit contains package descriptors, declarations, or not exactly one module descriptor")
shared ModuleCompilationUnit moduleCompilationUnitToCeylon(JCompilationUnit moduleCompilationUnit, Anything(JNode,Node) update = noop) {
    "Must not have declarations or package descriptors"
    assert (moduleCompilationUnit.declarations.empty,
        moduleCompilationUnit.packageDescriptors.empty);
    "Must have exactly one module descriptor"
    assert (moduleCompilationUnit.moduleDescriptors.size() == 1);
    value moduleDescriptor = moduleCompilationUnit.moduleDescriptors.get(0);
    value result = ModuleCompilationUnit(moduleDescriptorToCeylon(moduleDescriptor, update), CeylonIterable(moduleCompilationUnit.importList.imports).collect(propagateUpdate(importToCeylon, update)));
    update(moduleCompilationUnit, result);
    return result;
}

"Parses the given [[code]] for a Module Compilation Unit
 into a [[ModuleCompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared ModuleCompilationUnit? parseModuleCompilationUnit(String code, Anything(JNode,Node) update = noop) {
    if (exists jCompilationUnit = createParser(code).compilationUnit(),
        jCompilationUnit.moduleDescriptors.size() == 1,
        jCompilationUnit.declarations.empty,
        jCompilationUnit.packageDescriptors.empty) {
        return moduleCompilationUnitToCeylon(jCompilationUnit, update);
    } else {
        return null;
    }
}
