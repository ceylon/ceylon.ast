import ceylon.ast.core {
    CompilationUnit,
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

"Converts a RedHat AST [[CompilationUnit|JCompilationUnit]] to a `ceylon.ast` [[CompilationUnit]]."
throws (`class AssertionError`, "If the compilation unit contains package or module descriptors")
shared CompilationUnit compilationUnitToCeylon(JCompilationUnit compilationUnit, Anything(JNode,Node) update = noop) {
    "Must not have package or module descriptors"
    assert (compilationUnit.packageDescriptors.empty,
        compilationUnit.moduleDescriptors.empty);
    value result = CompilationUnit {
        declarations = CeylonIterable(compilationUnit.declarations).collect(propagateUpdate(declarationToCeylon, update));
        imports = CeylonIterable(compilationUnit.importList.imports).collect(propagateUpdate(importToCeylon, update));
    };
    update(compilationUnit, result);
    return result;
}

"Compiles the given [[code]] for a Compilation Unit
 into a [[CompilationUnit]] using the Ceylon compiler
 (more specifically, the rule for a `compilationUnit`)."
shared CompilationUnit? compileCompilationUnit(String code, Anything(JNode,Node) update = noop) {
    if (exists jCompilationUnit = createParser(code).compilationUnit(),
        jCompilationUnit.packageDescriptors.empty,
        jCompilationUnit.moduleDescriptors.empty) {
        return compilationUnitToCeylon(jCompilationUnit, update);
    } else {
        return null;
    }
}
